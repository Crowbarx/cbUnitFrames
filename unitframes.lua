local function ApplyTextSettings(frame, textType)
  local cfg = C.unitframes[frame.unit].text[textType]
  if cfg then
    frame[textType.."Text"]:SetFont(pfUI.font[ cfg.font ] or STANDARD_TEXT_FONT, cfg.size, "OUTLINE")
    frame[textType.."Text"]:SetTextColor(unpack(cfg.color))
  end
end

function pfUI.uf:CreateUnitFrame(unit, ...)
  -- ...existing code...
  -- After creating LeftText, CenterText, RightText:
  ApplyTextSettings(frame, "left")
  ApplyTextSettings(frame, "center")
  ApplyTextSettings(frame, "right")
  -- ...existing code...
end