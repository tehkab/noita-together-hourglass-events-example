--Append our translations to the game
local TRANSLATIONS_FILE = "data/translations/common.csv"
local translations = ModTextFileGetContent(TRANSLATIONS_FILE) .. ModTextFileGetContent("mods/noita-together-hourglass-events-example/files/translations/translations.csv")
ModTextFileSetContent(TRANSLATIONS_FILE, translations)

--Append hourglass events to noita together
ModLuaFileAppend("mods/noita-together/files/scripts/hourglass_events.lua", "mods/noita-together-hourglass-events-example/files/append/hourglass_events.lua")