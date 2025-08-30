-- cbUnitFrames.lua
local cbUF = LibStub("AceAddon-3.0"):NewAddon("cbUnitFrames", "AceConsole-3.0", "AceEvent-3.0", "AceConfig-3.0")

-- Create a public table for registering new media
cbUF.media = {
    barTextures = {},
}

-- Define a table to hold the default settings for AceDB
local defaults = {
    profile = {
        width = 200,
        height = 40,
        healthbarTexture = "ToxiUI-clean",
        font = "Fonts\\FRIZQT__.TTF",
        fontSize = 12,
    }
}
-- Store unit frames
cbUF.frames = {}

-- More aggressive hide function
function cbUF:HideBlizzardUnitFrames()
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames: Hiding Blizzard frames...")
    local framesToHide = { "PlayerFrame", "TargetFrame", "PartyMemberFrame1", "PartyMemberFrame2", "PartyMemberFrame3", "PartyMemberFrame4" }
    for i = 1, table.getn(framesToHide) do
        local frameName = framesToHide[i]
        local frame = _G[frameName]
        if frame then
            frame:UnregisterAllEvents()
            frame:SetAlpha(0)
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", -5000, -5000)
            frame:Hide()
            frame:SetScript("OnShow", function(self) self:Hide() end)
        end
    end
end

function cbUF:BuildTextureList()
    local values = {}
    -- Loop through all textures registered in our public media table
    for _, textureInfo in pairs(self.media.barTextures) do
        -- Add them to the format AceGUI expects for a 'select' widget.
        -- The key is the full texture path, which is what we'll save.
        -- The value is the friendly name, which is what the user sees.
        values[textureInfo.path] = textureInfo.name
    end
    return values
end

function cbUF:UpdateAllFramesAppearance()
    -- Get all the settings from the database at once
    local cfg = self.db.profile
    local texPath = cfg.healthbarTexture

    for unit, frame in pairs(self.frames) do
        if frame and frame.health then
            -- Apply size
            frame:SetWidth(cfg.width)
            frame:SetHeight(cfg.height)

            -- Apply texture
            frame.health:SetStatusBarTexture(texPath)

            -- Apply color
            if unit == "player" then
                frame.health:SetStatusBarColor(0, 1, 0) -- Green
            else
                local reaction = UnitReaction(unit, "player")
                if reaction and reaction >= 5 then
                    frame.health:SetStatusBarColor(0, 1, 0) -- Friendly (Green)
                elseif reaction == 4 then
                    frame.health:SetStatusBarColor(1, 1, 0) -- Neutral (Yellow)
                else
                    frame.health:SetStatusBarColor(1, 0, 0) -- Hostile (Red)
                end
            end
            
            -- Apply font settings
            if frame.name then
                frame.name:SetFont(cfg.font, cfg.fontSize + 4, "OUTLINE")
            end
        end
    end
end

function cbUF:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("cbUnitFramesDB", defaults, "Default")
    
    self.options = {
        name = "Crowbar Unit Frames",
        handler = self,
        type = 'group',
        args = {
            width = {
                type = 'range', name = 'Frame Width', min = 50, max = 500, step = 1,
                get = function(info) return self.db.profile.width end,
                set = function(info, value)
                    self.db.profile.width = value
                    self:UpdateAllFramesAppearance() -- Call the new function
                end,
            },
            height = {
                order = 3, type = 'range', name = 'Frame Height', min = 10, max = 200, step = 1,
                get = function(info) return self.db.profile.height end,
                set = function(info, value)
                    self.db.profile.height = value
                    self:UpdateAllFramesAppearance() -- Call the new function
                end,
            },
            fontSize = {
                type = 'range', name = 'Font Size', min = 8, max = 32, step = 1,
                get = function(info) return self.db.profile.fontSize end,
                set = function(info, value)
                    self.db.profile.fontSize = value
                    self:UpdateAllFramesAppearance() -- Call the new function
                end,
            },
            healthbarTexture = {
                order = 4, type = 'select', name = 'Bar Texture',
                values = self:BuildTextureList(),
                get = function(info) return self.db.profile.healthbarTexture end,
                set = function(info, value)
                    self.db.profile.healthbarTexture = value
                    self:UpdateAllFramesAppearance() -- Call the new function
                end,
            },
        },
    }

    self:RegisterOptionsTable("cbUnitFrames", self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("cbUnitFrames", "cbUnitFrames")

    self:RegisterChatCommand("cb", "ChatCommandHandler")
    self:RegisterChatCommand("cbunitframes", "ChatCommandHandler")
end

function cbUF:OnEnable()
    self:CreateUnitFrame("player")
    self:CreateUnitFrame("target")
    
    -- Tell each event to call your "OnEvent" method
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "OnEvent")
    self:RegisterEvent("UNIT_HEALTH", "OnEvent")
    self:RegisterEvent("UNIT_MANA", "OnEvent")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
end

function cbUF:OnEvent(event, unit) -- Changed "..." to "unit"
    if event == "PLAYER_ENTERING_WORLD" then
        self:HideBlizzardUnitFrames()
        self:CreateUnitFrame("player")
        self:CreateUnitFrame("target")
    elseif event == "PLAYER_TARGET_CHANGED" then
        self:UpdateUnitFrame("target")
    elseif event == "UNIT_HEALTH" or event == "UNIT_MANA" then
        -- Now, the 'unit' variable is already correctly assigned!
        -- No need for "local unit = ..."
        if self.frames[unit] then
            self:UpdateUnitFrame(unit)
        end
    end
end

function cbUF:ChatCommandHandler(input)
    -- Open the config window in Blizzard options
    if LibStub and LibStub("AceConfigDialog-3.0", true) then
        LibStub("AceConfigDialog-3.0"):Open("cbUnitFrames")
    else
        self:Print("Config window could not be opened. AceConfigDialog-3.0 missing.")
    end
end

function cbUF:CreateUnitFrame(unit)
    -- If frame already exists, just update its appearance
    if self.frames[unit] then
        self:UpdateAllFramesAppearance()
        return
    end
    
    local frame = CreateFrame("Frame", "cbUF_"..unit, UIParent)
    self.frames[unit] = frame

    if unit == "player" then
        frame:SetPoint("CENTER", UIParent, "CENTER", -250, -150)
    else -- target
        frame:SetPoint("CENTER", UIParent, "CENTER", 250, -150)
    end

    -- Health bar
    frame.health = CreateFrame("StatusBar", nil, frame)
    frame.health:SetAllPoints(frame)
    
    -- Name text
    frame.name = frame.health:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.name:SetPoint("CENTER", frame.health, "CENTER")
    
    -- Set the appearance and update the values
    self:UpdateAllFramesAppearance()
    self:UpdateUnitFrame(unit)
end

-- Update function for the simple frame

function cbUF:UpdateUnitFrame(unit)
    local frame = self.frames[unit]
    if not frame then return end

    if UnitExists(unit) then
        frame.name:SetText(UnitName(unit))

        -- Update health
        local health = UnitHealth(unit)
        local maxHealth = UnitHealthMax(unit)
        frame.health:SetMinMaxValues(0, maxHealth)
        frame.health:SetValue(health)

        frame:Show()
    else
        frame:Hide()
    end
end