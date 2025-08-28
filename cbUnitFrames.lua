-- cbUnitFrames.lua
-- Author: Crowbarx
-- Version: 0.1
-- cbUnitFrames.lua
-- Author: Crowbarx
-- Version: 0.1
-- Custom Unit Frames Addon for WoW 1.12.1

local addonName = "Crowbar Unit Frames"

function cbUnitFrames_OnLoad()
local addonName = "Crowbar Unit Frames"

DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00cb|cff3399ffU|rnit|cffff3333F|rames - " .. addonName .. " loaded.")
DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Crowbar|cff3399ffU|cffff3333F|r Unit Frames Enabled")

SlashCmdList["CBUNITFRAMES"] = function(msg)
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames settings window would open here.")
end
-- SLASH_CBUNITFRAMES1 = "/cb"
-- Frame setup
-- local frame = CreateFrame("Frame")
-- Frame setup
-- frame:SetScript("OnLoad", nil)  -- Remove OnLoad script as it's no longer needed
