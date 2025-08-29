-- cbUnitFrames.lua
local cbUF = LibStub("AceAddon-3.0"):NewAddon("cbUnitFrames", "AceConsole-3.0", "AceEvent-3.0")

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
    self:Print("Ace3 setup successful!")
end

function cbUF:CreateUnitFrame(unit)
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames: Creating frame for "..unit)
    if self.frames[unit] then return end

    local cfg = self.config
    local frame = CreateFrame("Frame", "cbUF_"..unit, UIParent)
    frame:SetWidth(cfg.width)
    frame:SetHeight(cfg.height)

    if unit == "player" then
        frame:SetPoint("CENTER", UIParent, "CENTER", -250, -150)
    else -- target
    frame:SetPoint("CENTER", UIParent, "CENTER", 250, -150)
    frame:SetWidth(200)
    frame:SetHeight(30)
    end

    -- Health bar
    frame.health = CreateFrame("StatusBar", nil, frame)
    frame.health:ClearAllPoints()
    frame.health:SetPoint("CENTER", frame, "CENTER", 0, 0)
    frame.health:SetWidth(200)
    frame.health:SetHeight(30)
    
    -- CORRECTED: Use backslashes for the texture path.
    frame.health:SetStatusBarTexture("Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\ToxiUI-clean.tga")

    -- Add fallback background for visibility
    if not frame.health.bg then
        frame.health.bg = frame.health:CreateTexture(nil, "BACKGROUND")
        frame.health.bg:SetAllPoints(frame.health)
        frame.health.bg:SetTexture(1, 1, 1, 1) -- solid white
        frame.health.bg:SetVertexColor(0.2, 0.2, 0.2, 1) -- dark gray
    end

    -- DELETED THE UNNECESSARY BACKGROUND TEXTURE CODE --

    if unit == "player" then
        frame.health:SetStatusBarColor(0, 1, 0) -- Green
    else
        -- This will be updated later based on faction
        frame.health:SetStatusBarColor(1, 0, 0) -- Red
    end

    -- Name text (child of health bar to fix layering)
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
