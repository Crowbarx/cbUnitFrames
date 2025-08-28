-- cbUnitFrames.lua
local cbUF = {}
cbUnitFrames = cbUF -- global reference

-- More aggressive hide function
local function HideBlizzardUnitFrames()
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

-- Store unit frames
cbUF.frames = {}

-- Default config
cbUF.config = {
    font = "Fonts\\FRIZQT__.TTF",
    fontSize = 12,
    width = 200,
    height = 40,
}

-- OnLoad function, called from XML
function cbUnitFrames_OnLoad()
    this:RegisterEvent("PLAYER_ENTERING_WORLD")
    this:RegisterEvent("PLAYER_TARGET_CHANGED")
    this:RegisterEvent("UNIT_HEALTH")
    this:RegisterEvent("UNIT_MANA")
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00cbUnitFrames:|r XML version loaded.")
end

-- OnEvent function, called from XML
function cbUnitFrames_OnEvent(event, arg1)
    if event == "PLAYER_ENTERING_WORLD" then
        HideBlizzardUnitFrames()
        cbUF:CreateUnitFrame("player")
        cbUF:CreateUnitFrame("target")
    elseif event == "PLAYER_TARGET_CHANGED" then
        cbUF:UpdateUnitFrame("target")
    elseif event == "UNIT_HEALTH" or event == "UNIT_MANA" then
        if cbUF.frames[arg1] then
            cbUF:UpdateUnitFrame(arg1)
        end
    end
end

-- Create a simplified unit frame for debugging
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
    end

    -- Simple solid color backdrop for debugging
    frame:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8" })
    if unit == "player" then
        frame:SetBackdropColor(0, 0.8, 0, 0.8) -- Bright green
    else
        frame:SetBackdropColor(0.8, 0, 0, 0.8) -- Bright red
    end

    -- Name text
    frame.name = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.name:SetFont(cfg.font, cfg.fontSize + 4, "OUTLINE")
    frame.name:SetPoint("CENTER", frame, "CENTER")

    self.frames[unit] = frame
    self:UpdateUnitFrame(unit)
end

-- Update function for the simple frame
function cbUF:UpdateUnitFrame(unit)
    local frame = self.frames[unit]
    if not frame then return end

    if UnitExists(unit) then
        frame.name:SetText(UnitName(unit))
        frame:Show()
    else
        frame:Hide()
    end
end
