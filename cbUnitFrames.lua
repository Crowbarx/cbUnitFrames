-- cbUnitFrames.lua
local cbUF = {}
cbUnitFrames = cbUF -- global reference so other modules can use it

-- Store unit frames
cbUF.frames = {}

-- Default config (can be overridden by SavedVariables later)
cbUF.config = {
    font = "Fonts\\FRIZQT__.TTF",
    fontSize = 12,
    texture = "Interface\\TargetingFrame\\UI-StatusBar",
    width = 200,
    height = 40,
}

-- Print colored login message
DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Crowbar|r |cff3399ffU|r|cffffffffnit|r |cffff3333F|r|cfffffffframes|r Enabled.")

-- Slash command
SLASH_CBUF1 = "/cb"
SlashCmdList["CBUF"] = function(msg)
    cbUF:OpenConfig(msg)
end

function cbUF:OpenConfig(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00cbUnitFrames Config:|r Coming soon! You typed: " .. (msg or ""))
end

-- Event handler
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("UNIT_HEALTH")
eventFrame:RegisterEvent("UNIT_MANA")
eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "PLAYER_ENTERING_WORLD" then
        cbUF:CreateUnitFrame("player")
        cbUF:CreateUnitFrame("target")
    elseif event == "UNIT_HEALTH" or event == "UNIT_MANA" then
        cbUF:UpdateUnitFrame(arg1)
    elseif event == "PLAYER_TARGET_CHANGED" then
        cbUF:UpdateUnitFrame("target")
    end
end)

-- Create a unit frame
function cbUF:CreateUnitFrame(unit)
    if self.frames[unit] then return end

    local cfg = self.config
    local frame = CreateFrame("Frame", "cbUF_"..unit, UIParent)
    frame:SetSize(cfg.width, cfg.height)
    if unit == "player" then
        frame:SetPoint("CENTER", UIParent, "CENTER", -250, -200)
    elseif unit == "target" then
        frame:SetPoint("CENTER", UIParent, "CENTER", 250, -200)
    end

    -- Health Bar
    frame.health = CreateFrame("StatusBar", nil, frame)
    frame.health:SetSize(cfg.width, cfg.height * 0.6)
    frame.health:SetPoint("TOP", frame, "TOP")
    frame.health:SetStatusBarTexture(cfg.texture)
    frame.health:SetMinMaxValues(0, UnitHealthMax(unit))

    -- Power Bar
    frame.power = CreateFrame("StatusBar", nil, frame)
    frame.power:SetSize(cfg.width, cfg.height * 0.3)
    frame.power:SetPoint("TOP", frame.health, "BOTTOM", 0, -2)
    frame.power:SetStatusBarTexture(cfg.texture)
    frame.power:SetMinMaxValues(0, UnitManaMax(unit))

    -- Name text
    frame.name = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.name:SetFont(cfg.font, cfg.fontSize, "OUTLINE")
    frame.name:SetPoint("CENTER", frame.health, "CENTER")

    self.frames[unit] = frame
    self:UpdateUnitFrame(unit)
end

-- Update function
function cbUF:UpdateUnitFrame(unit)
    local frame = self.frames[unit]
    if not frame then return end

    frame.health:SetValue(UnitHealth(unit))
    frame.health:SetMinMaxValues(0, UnitHealthMax(unit))

    frame.power:SetValue(UnitMana(unit))
    frame.power:SetMinMaxValues(0, UnitManaMax(unit))

    frame.name:SetText(UnitName(unit) or unit)
end
