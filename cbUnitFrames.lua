local MAJOR, MINOR = "cbUnitFrames", 1
local cbUnitFrames, oldminor = LibStub:NewLibrary(MAJOR, MINOR)
if not cbUnitFrames then return end

cbUnitFrames.version = GetAddOnMetadata("cbUnitFrames", "Version")
cbUnitFrames.patch, cbUnitFrames.build, cbUnitFrames.date, cbUnitFrames.toc = ("@project-version@"):match("^(%d+%.%d+)%.?(%d*)%-(%d%d%d%d%d%d)T(%d%d%d%d)$")

local E, L, V, P, G = {}, {}, {}, {}, {}
cbUnitFrames.E = E
cbUnitFrames.L = L
cbUnitFrames.V = V
cbUnitFrames.P = P
cbUnitFrames.G = G

function E:NewModule(name, ...)
	local module = self:GetModule(name)
	return module
end

function E:GetModule(name)
	return self.modules[name]
end

E.modules = {}

function E:RegisterInitialModule(name, callback)
	E.modules[name] = callback
end

function E:Print(msg)
	print(msg)
end

function E:StringTitle(str)
	return str:gsub("^%l", string.upper)
end

function E:Point(obj, arg1, arg2, arg3, arg4, arg5)
	obj:SetPoint(arg1, arg2, arg3, arg4, arg5)
end

function E:Size(obj, width, height)
	obj:SetSize(width, height)
end

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
		units = {}
	}
}
E.private = {
	unitframe = {
		enable = true,
		disabledBlizzardFrames = {}
	}
}
