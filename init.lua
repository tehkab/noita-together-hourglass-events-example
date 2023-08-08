--Append our translations to the game
local TRANSLATIONS_FILE = "data/translations/common.csv"
local translations = ModTextFileGetContent(TRANSLATIONS_FILE) .. ModTextFileGetContent("mods/test-nt-add-hourglass/files/translations/translations.csv")
ModTextFileSetContent(TRANSLATIONS_FILE, translations)

--Append hourglass events to noita together
ModLuaFileAppend("mods/noita-together/files/scripts/hourglass_events.lua", "mods/test-nt-add-hourglass/files/append/hourglass_events.lua")