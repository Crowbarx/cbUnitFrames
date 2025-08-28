DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00cb|cff3399ffU|r|cffffffffnit|cffff3333F|r|cfffffffframes|r - Crowbar Unit Frames loaded.")

function E:GetColorTable(color)
	return {r = color.r, g = color.g, b = color.b}
end

function E:FontTemplate(obj, font, size, outline)
	-- Stub function
end

function E:SetTemplate(obj, template)
	-- Stub function
end

function E:EnableMover(name)
	-- Stub function
end

function E:DisableMover(name)
	-- Stub function
end

function E:UpdatePositionOverride(name)
	-- Stub function
end

function E:CopyTable(to, from)
	for k, v in pairs(from) do
		if type(v) == "table" then
			to[k] = E:CopyTable({}, v)
		else
			to[k] = v
		end
	end
	return to
end

local UF = {}
function UF:RegisterStyle(name, style)
	-- Stub function
end

function UF:SetActiveStyle(name)
	-- Stub function
end

function UF:Spawn(unit, name)
	return CreateFrame("Button", name, E.UIParent)
end

function UF:SpawnHeader(overrideName, headerTemplate, ...)
	return CreateFrame("Frame", overrideName, E.UIParent)
end

cbUnitFrames.UF = UF
UF.oUF = oUF

--Stubs for ElvUI variables
E.UIParent = UIParent
E.Spacing = 4
E.Border = 12
E.mult = 1
E.PixelMode = true
E.db = {
	unitframe = {
		thinBorders = true,
		colors = {
			reaction = {},
			power = {},
			classResources = {
				comboPoints = {}
			}
		},
		units = {
			player = {
				enable = true,
			},
		}
	}
}
E.private = {
	unitframe = {
		enable = true,
		disabledBlizzardFrames = {}
	}
}
