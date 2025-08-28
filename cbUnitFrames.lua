-- cbUnitFrames.lua
-- Author: Crowbarx
-- Version: 0.1.2
-- Custom Unit Frames Addon for WoW 1.12.1

function cbUnitFrames_OnLoad()
    this:RegisterEvent("ADDON_LOADED");
end

function cbUnitFrames_OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "cbUnitFrames" then
        -- Welcome messages
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00Crowbar|r |cff3399ffU|r|cffffffffnit|r |cffff3333F|r|cfffffffframes|r Enabled")
        DEFAULT_CHAT_FRAME:AddMessage("type /cb for options but we dont implement this feature yet.")
        
        -- Unregister the event after it has fired to avoid running it again
        this:UnregisterEvent("ADDON_LOADED")
    end
end

-- Slash command setup
SlashCmdList["CBUNITFRAMES"] = function(msg)
    DEFAULT_CHAT_FRAME:AddMessage("cbUnitFrames settings window would open here.")
end
SLASH_CBUNITFRAMES1 = "/cb"
