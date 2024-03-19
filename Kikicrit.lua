
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


-- local function MakeGfindReady(template) -- changes global string to fit gfind pattern
--   template = gsub(template, "%%s", "(.+)") -- % is escape: %%s = %s raw
--   return gsub(template, "%%d", "(%%d+)")
-- end

-- local combatlog_patterns = {} -- parser for combat log, order = {source, attack, target, value, school}, if not presenst = nil; parse order matters!!
-- ####### DAMAGE SOURCE:ME TARGET:OTHER
-- combatlog_patterns[14] = {string=MakeGfindReady(SPELLLOGCRITSCHOOLSELFOTHER), order={nil, 1, 2, 3, 4}, kind="dmg"} -- Your %s crits %s for %d %s damage. (parse before %s crits %s for %d %s damage.)
-- combatlog_patterns[16] = {string=MakeGfindReady(SPELLLOGCRITSELFOTHER), order={nil, 1, 2, 3, nil}, kind="dmg"} -- Your %s crits %s for %d. (parse before %s crits %s for %d.)
-- combatlog_patterns[19] = {string=MakeGfindReady(COMBATHITCRITSELFOTHER), order={nil, nil, 1, 2, nil}, kind="dmg"} -- You crit %s for %d.
-- combatlog_patterns[21] = {string=MakeGfindReady(COMBATHITCRITSCHOOLSELFOTHER), order={nil, nil, 1, 2, 3}, kind="dmg"} -- You crit %s for %d %s damage.

parser:SetScript("OnEvent", function()
  if arg1 then
    if string.find(arg1, " crit ") or string.find(arg1, " crits ") then
      local idx = math.random(1, 16)
      PlaySoundFile("Interface\\AddOns\\Kikicrit\\wow-"..idx..".mp3")
    end
  end
end)