-- cbUnitFrames.lua
local cbUF = LibStub("AceAddon-3.0"):NewAddon("cbUnitFrames", "AceConsole-3.0", "AceEvent-3.0", "AceConfig-3.0")


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

-- Default config
cbUF.config = {
    font = "Fonts\\FRIZQT__.TTF",
    fontSize = 12,
    width = 200,
    height = 40,
}

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

function cbUF:OnInitialize()
    -- Initialize the database with the default settings
    self.db = LibStub("AceDB-3.0"):New("cbUnitFramesDB", defaults, "Default")
    
    -- Create a table of textures for our dropdown menu
    -- The key is the filename (without .tga), the value is the text shown in the menu.
    local barTextures = {
        ["ToxiUI-clean"] = "ToxiUI Clean",
        ["ToxiUI-dark"] = "ToxiUI Dark",
        ["bar_tukui"] = "Tukui Style",
        ["pfUI-R"] = "pfUI Style R",
        -- Add more of your texture filenames here! For example:
        -- ["Bezo"] = "Bezo Style",
        -- ["Minimalist"] = "Minimalist",
    }

    -- Create the options table
    self.options = {
        name = "Crowbar Unit Frames",
        handler = self,
        type = 'group',
        args = {
            width = {
                type = 'range',
                name = 'Frame Width',
                desc = 'Adjust the width of the unit frames.',
                min = 50,
                max = 500,
                step = 1,
                get = function(info)
                    return self.db.profile.width
                end,
                set = function(info, value)
                    self.db.profile.width = value
                    if self.frames.player then self.frames.player:SetWidth(value) end
                    if self.frames.target then self.frames.target:SetWidth(value) end
                end,
            },
            fontSize = {
                type = 'range',
                name = 'Font Size',
                desc = 'Adjust the font size of unit frame names.',
                min = 8,
                max = 32,
                step = 1,
                get = function(info)
                    return self.db.profile.fontSize
                end,
                set = function(info, value)
                    self.db.profile.fontSize = value
                    self:UpdateAllFrameTextures() -- We can update all frames at once now
                end,
            },
            -- This is the new dropdown menu for textures
            healthbarTexture = {
                order = 4,
                type = 'select', -- Changed from 'input' to 'select'
                name = 'Bar Texture',
                desc = 'Select the texture for the health bars.',
                values = barTextures, -- Point the dropdown to our table of textures
                get = function(info)
                    return self.db.profile.healthbarTexture
                end,
                set = function(info, value)
                    self.db.profile.healthbarTexture = value
                    self:UpdateAllFrameTextures() -- Call our new update function
                end,
            },
        },
    }

    -- Register the options table
    self:RegisterOptionsTable("cbUnitFrames", self.options)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("cbUnitFrames", "cbUnitFrames")

    -- The rest of your initialization
    self:HideBlizzardUnitFrames()
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
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames: Creating frame for "..unit)
    if self.frames[unit] then return end

    -- CHANGED: Point cfg to the new AceDB database
    local cfg = self.db.profile
    local frame = CreateFrame("Frame", "cbUF_"..unit, UIParent)
    frame:SetWidth(cfg.width)
    frame:SetHeight(cfg.height)

    if unit == "player" then
        frame:SetPoint("CENTER", UIParent, "CENTER", -250, -150)
    else -- target
        frame:SetPoint("CENTER", UIParent, "CENTER", 250, -150)
    end

    -- Health bar
    frame.health = CreateFrame("StatusBar", nil, frame)
    frame.health:SetAllPoints(frame)
    
    -- CHANGED: Get the texture name from the new AceDB database
    local tex = self.db.profile.healthbarTexture
    local texPath = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\" .. tex .. ".tga"
    frame.health:SetStatusBarTexture(texPath)

    -- Fallback background (This can be removed if your texture looks fine on its own)
    if not frame.health.bg then
        frame.health.bg = frame.health:CreateTexture(nil, "BACKGROUND")
        frame.health.bg:SetAllPoints(frame.health)
        frame.health.bg:SetTexture(0.1, 0.1, 0.1, 1) -- solid dark gray
    end

    if unit == "player" then
        frame.health:SetStatusBarColor(0, 1, 0) -- Green
    else
        frame.health:SetStatusBarColor(1, 0, 0) -- Red
    end

    -- Name text
    frame.name = frame.health:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.name:SetFont(cfg.font, cfg.fontSize + 4, "OUTLINE")
    frame.name:SetPoint("CENTER", frame.health, "CENTER")

    self.frames[unit] = frame
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

function cbUF:UpdateAllFrameTextures()
    local textureName = self.db.profile.healthbarTexture
    local texPath = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\" .. textureName .. ".tga"

    for _, frame in pairs(self.frames) do
        if frame and frame.health then
            frame.health:SetStatusBarTexture(texPath)
        end
    end
end