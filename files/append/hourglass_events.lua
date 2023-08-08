--pea soup event - example of a temporary effect hourglass event
--pea soup isn't a great example because as a material it doesnt flow nicely,
-- so you probably need 2 flasks worth to trigger the event. but it works anyway and this is just an example!
--first argument is internal unique event name, second is trigger material name, third is the callback function
RegisterHourglassEvent("pea_soup", "pea_soup", function(player, triggered_by_name, data)
    local effect_entity = LoadGameEffectEntityTo(player, "data/entities/misc/effect_farts.xml")
    local effect_comp = EntityGetFirstComponent(effect_entity, "GameEffectComponent")
    ComponentSetValue2(effect_comp, "frames", 60*120)
    EntityAddComponent2(effect_entity, "UIIconComponent", {
        icon_sprite_file = "data/ui_gfx/status_indicators/farts.png",
        name = GameTextGet("$test_nt_add_hourglass_buff_pea_soup_name"),
        description = GameTextGet("$test_nt_add_hourglass_buff_pea_soup_desc", triggered_by_name),
        display_above_head = true,
        display_in_hud = true,
        is_perk = false
    })
    GamePrintImportant(GameTextGet("$test_nt_add_hourglass_pea_soup_boost_title", triggered_by_name), "$test_nt_add_hourglass_pea_soup_boost_subtitle")
end)

--Whiskey event - example of a forced-ingestion hourglass event
--first argument is internal unique event name, second is trigger material name, third is the callback function
RegisterHourglassEvent("alcohol", "alcohol", function(player, triggered_by_name, data)
    local booze = CellFactory_GetType("alcohol")
    if (player ~= nil) then
        EntityIngestMaterial( player, booze, 300 )
        local stomach = EntityGetFirstComponent(player, "IngestionComponent")
        if (stomach ~= nil) then
            local ingestion_size = ComponentGetValue2(stomach, "ingestion_size")
            ComponentSetValue2(stomach, "ingestion_size", math.max(0, ingestion_size - 300))
        end
        GamePrintImportant(GameTextGet("$test_nt_add_hourglass_whiskey_boost_title", triggered_by_name), "$test_nt_add_hourglass_whiskey_boost_subtitle")
    end
end)