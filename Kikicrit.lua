local number_of_sounds = 4

-- for debugging: DEFAULT_CHAT_FRAME:AddMessage("Test")
local function print(msg)
  DEFAULT_CHAT_FRAME:AddMessage(msg)
end

-- create parser frame
local parser = CreateFrame("Frame")

-- events are a total mess, better register to many than too little
-- SPELL DAMAGE events
parser:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")

-- COMBAT DAMAGE events
parser:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS")

-- SPELL HEAL events
parser:RegisterEvent("CHAT_MSG_SPELL_SELF_BUFF")
parser:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")

-- Your %s crits %s for %d %s damage.
-- Your %s crits %s for %d.
-- You crit %s for %d.
-- You crit %s for %d %s damage.
-- Your %s critically heals you for %d.
-- %s's %s critically heals you for %d.

parser:SetScript("OnEvent", function()
  if arg1 then
    if string.find(arg1, " crit ") or string.find(arg1, " crits ")or string.find(arg1, " critically ") then
      local idx = math.random(1, number_of_sounds)
      PlaySoundFile("Interface\\AddOns\\Kikicrit\\sounds2\\wow-"..idx..".mp3")
    end
  end
end)