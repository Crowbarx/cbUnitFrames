local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local LSM = LibStub("LibSharedMedia-3.0")

local textures = {
    ["bar_tukui"] = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\bar_tukui.tga",
    ["pfUI-R"] = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\pfUI-R.tga",
    ["ToxiUI-clean"] = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\ToxiUI-clean.tga",
    ["ToxiUI-dark"] = "Interface\\AddOns\\cbUnitFrames\\Media\\BarTextures\\ToxiUI-dark.tga",
}

local options = {
    name = "cbUnitFrames Config",
    type = "group",
    args = {
        healthbarTexture = {
            type = "select",
            name = "Healthbar Texture",
            desc = "Select the healthbar texture.",
            values = function()
                local vals = {}
                for k, _ in pairs(textures) do vals[k] = k end
                return vals
            end,
            get = function()
                return cbUnitFrames.Config.healthbarTexture or "ToxiUI-clean"
            end,
            set = function(_, val)
                cbUnitFrames.Config.healthbarTexture = val
                for _, frame in pairs(cbUnitFrames.frames or {}) do
                    if frame.health then
                        frame.health:SetStatusBarTexture(textures[val])
                    end
                end
            end,
        },
    },
}

AceConfig:RegisterOptionsTable("cbUnitFrames", options)
AceConfigDialog:AddToBlizOptions("cbUnitFrames", "cbUnitFrames")
