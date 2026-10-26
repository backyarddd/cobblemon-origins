# Cobblemon Loot Plus

Adds Cobblemon-ecosystem loot (Cobblemon, Mega Showdown, ZA Mega, Cobblemon Utility+, Raid Dens, CobbledGacha,
Cobblemon Repel, Mega Compass, Legendary Monuments) to every structure chest. Existing loot is kept: each touched
table is its original JSON, unchanged, with one extra pool appended that rolls `cobbleloot:profiles/<profile>`.

Generated file. Requires Minecraft 1.21.1 (pack_format 48), loaded globally by Paxi.

## How tables are touched

- `cobblemon:injection/chests/*`: Cobblemon injects these into the matching vanilla chests at runtime (no builtin check),
  so the vanilla tables stay untouched; Cobblemon's own injected pools are kept and our pool is appended.
- Other vanilla structure chests: vanilla table copied verbatim from the 1.21.1 jar plus our pool. Artifacts only injects
  into non-overridden (builtin) tables, so its `artifacts:inject/...` pool is replicated on the overridden tables where it applies.
- Mod structure chests (Cobblemon, Mega Showdown, Legendary Monuments, Supplementaries galleon, Artifacts campsite,
  YUNG Better Desert Temples/Dungeons/Jungle Temples/Nether Fortresses/Ocean Monuments/Strongholds/Witch Huts, YUNG Extras,
  ChoiceTheorem Overhauled Village, Explorify, Terralith): copied verbatim from the mod jar plus our pool.
- Cobblemon Additions (BCA) village tables `bca:general/*`: copied verbatim plus the `village` profile (money-free tiers,
  a 15% coin pool and a 0.5% jackpot of legendary-tier items), because each house holds tens of per-player Lootr containers.
- Structure pieces that use vanilla tables (YUNG Better Mineshafts code-placed chests use `minecraft:chests/abandoned_mineshaft`;
  YUNG/CTOV/Explorify/Terralith pieces placing vanilla village, dungeon, temple, fortress or stronghold tables) are covered by the
  vanilla/Cobblemon-injection overrides and get nothing extra.
- A table whose original content already rolls into another touched table is left alone so the Cobblemon pool is never doubled.

## Profiles (pools added per chest)

| Profile | Pools |
|---|---|
| basic | common x2-3, uncommon x0-1, ores x1 (25% chance) |
| adventure | common x2-3, uncommon x1-2, rare x1 (35% chance), ores x0-1 |
| underground | common x1-3, uncommon x1-2, rare x1 (40% chance), ores x1-3 |
| treasure | uncommon x2-3, rare x1-2, epic x1 (30% chance), ores x0-2 |
| vault | uncommon x1, rare x1, epic x1 (25% chance) |
| vault_ominous | rare x1-2, epic x1 (50% chance) |
| village | village_common x1-2, village_uncommon x1 (35% chance), rare x1 (5% chance), coins x1 (15% chance), jackpot x1 (0% chance) |

## Tiers (one pick per roll, weight in parentheses)

- **common**: sets/balls_basic (w30), sets/medicine_basic (w22), sets/exp_candy_small (w14), sets/berries (w8), relic_coin x2-6 (w6), sets/tumblestones (w5), sets/feathers (w4), sets/balls_specialty (w4), sets/type_gems (w3), cobblemon_utility:poketreat x1-3 (w3), cobbledgacha:gacha_coin x1-3 (w3), cobblemonrepel:repel (w3)
- **uncommon**: sets/balls_specialty (w16), ultra_ball x1-4 (w10), sets/medicine_strong (w12), sets/exp_candy_large (w10), sets/evolution_stones (w10), sets/vitamins (w8), sets/type_items (w6), sets/evolution_items (w5), sets/held_training (w4), sets/balls_ancient (w4), sets/berries (w3), sets/raid (w3), sets/gacha (w3), sets/tumblestones (w2), relic_coin_pouch (w2), blank_tm (w2), cobblemonrepel:super_repel (w2), cobblemon_utility:ballsynchronizer (w1), cobblemon_utility:woodencap (w1), cobblemon_utility:voidfeather (w1)
- **rare**: sets/held_competitive (w14), sets/mints (w12), sets/evolution_items (w10), sets/vitamins (w8), sets/exp_candy_large (w8), sets/silver_caps (w6), sets/tera_shards (w6), sets/gimmick_materials (w6), sets/evolution_stones (w6), rare_candy x1-3 (w6), pp_up (w5), ability_capsule (w5), sets/fossils (w4), ultra_ball x4-8 (w4), max_revive x1-2 (w3), sets/compasses (w2), cobblemonrepel:max_repel (w2), cobblemon_utility:transmutationorb (w1), cobblemon_utility:ridersrelic (w1), cobblemonraiddens:catching_charm (w1)
- **epic**: sets/mega_stones (w14), sets/held_competitive_top (w8), sets/z_crystals (w8), ability_patch (w6), sets/mints (w6), pp_max (w5), sets/gimmick_key_items (w5), sets/legendary_relics (w5), cobblemon_utility:goldencap (w4), sets/shining_caps (w4), sets/evolution_stone_blocks (w4), exp_candy_xl x2-4 (w4), rare_candy x2-5 (w4), master_ball (w2), relic_coin_sack (w2), cobblemon_utility:shinycard (w1), cobblemon_utility:mastercandy (w1)
- **village_common**: sets/balls_basic (w30), sets/medicine_basic (w22), sets/exp_candy_small (w14), sets/berries (w8), sets/tumblestones (w5), sets/feathers (w4), sets/balls_specialty (w4), sets/type_gems (w3), cobblemon_utility:poketreat x1-3 (w3), cobblemonrepel:repel (w3)
- **village_uncommon**: sets/balls_specialty (w16), ultra_ball x1-4 (w10), sets/medicine_strong (w12), sets/exp_candy_large (w10), sets/evolution_stones (w10), sets/vitamins (w8), sets/type_items (w6), sets/evolution_items (w5), sets/held_training (w4), sets/balls_ancient (w4), sets/berries (w3), sets/raid (w3), sets/tumblestones (w2), blank_tm (w2), cobblemonrepel:super_repel (w2), cobblemon_utility:ballsynchronizer (w1), cobblemon_utility:woodencap (w1), cobblemon_utility:voidfeather (w1)
- **jackpot**: legendarymonuments:azure_flute (w1), legendarymonuments:red_chain (w1), legendarymonuments:titan_key (w1), legendarymonuments:time_globe (w1), legendarymonuments:space_globe (w1), legendarymonuments:antimatter_globe (w1), cobblemon_utility:cobblemax (w1), ancient_origin_ball (w1), cobblemon_utility:shinycard (w1), master_ball (w2), legendarymonuments:vortex_stone (w2), legendarymonuments:rainbow_feather (w2), legendarymonuments:truthbottle (w2), legendarymonuments:idealsbottle (w2), legendarymonuments:herosword (w2), legendarymonuments:heroshield (w2), legendarymonuments:medallion_of_renewal (w2), legendarymonuments:newmoon_whistle (w2), legendarymonuments:proof_of_conquest_m (w2), legendarymonuments:proof_of_conquest_a (w2), legendarymonuments:proof_of_conquest_u (w2), legendarymonuments:curry_of_justice (w2), cobblemon_utility:mastercandy (w2), mega_showdown:mewtwonite_x (w2), mega_showdown:mewtwonite_y (w2), mega_showdown:red_orb (w2), mega_showdown:blue_orb (w2), legendarymonuments:lightstone (w3), legendarymonuments:darkstone (w3), legendarymonuments:celestica_flute (w3), legendarymonuments:entei_treat (w3), legendarymonuments:raikou_treat (w3), legendarymonuments:suicune_treat (w3), legendarymonuments:latias_treat (w3), legendarymonuments:latios_treat (w3), legendarymonuments:temple_key (w3), cobblemon_utility:goldencap (w3), legendarymonuments:old_sea_map (w4), legendarymonuments:liberty_pass (w4), legendarymonuments:tablet_of_reawakening (w4), cobblemonraiddens:catching_charm (w4), ability_patch (w5), legendarymonuments:medallion_of_renewal_fragment (w6)

## Item sets

- **balls_basic** (3): poke_ball x3-8 (w10), great_ball x2-5 (w8), premier_ball x1-4 (w3)
- **balls_specialty** (20): quick_ball x1-3 (w4), dusk_ball x1-3 (w4), timer_ball x1-3 (w3), net_ball x1-3 (w3), repeat_ball x1-3 (w3), dive_ball x1-3 (w2), nest_ball x1-3 (w2), heal_ball x1-3 (w2), luxury_ball x1-3 (w2), level_ball x1-3 (w2), lure_ball x1-3 (w2), moon_ball x1-3 (w2), friend_ball x1-3 (w2), fast_ball x1-3 (w2), heavy_ball x1-3 (w2), love_ball x1-3 (w1), dream_ball x1-3 (w1), beast_ball x1-3 (w1), safari_ball x1-3 (w1), sport_ball x1-3 (w1)
- **balls_ancient** (9): ancient_poke_ball x1-3 (w3), ancient_great_ball x1-3 (w3), ancient_ultra_ball x1-3 (w2), ancient_feather_ball x1-3 (w2), ancient_wing_ball x1-3 (w2), ancient_jet_ball x1-3 (w1), ancient_heavy_ball x1-3 (w2), ancient_leaden_ball x1-3 (w2), ancient_gigaton_ball x1-3 (w1)
- **medicine_basic** (10): potion x2-4 (w10), super_potion x1-3 (w8), revive x1-2 (w4), ether x1-2 (w3), full_heal x1-2 (w3), antidote x1-3 (w2), paralyze_heal x1-3 (w2), burn_heal x1-3 (w2), awakening x1-3 (w2), ice_heal x1-3 (w2)
- **medicine_strong** (9): hyper_potion x1-3 (w8), max_potion x1-2 (w5), full_restore x1-2 (w3), full_heal x1-3 (w5), revive x1-3 (w6), max_revive (w3), elixir x1-2 (w3), max_ether x1-2 (w2), max_elixir (w1)
- **exp_candy_small** (3): exp_candy_xs x2-6 (w10), exp_candy_s x1-4 (w8), exp_candy_m x1-2 (w3)
- **exp_candy_large** (4): exp_candy_m x1-4 (w8), exp_candy_l x1-3 (w6), exp_candy_xl x1-2 (w3), rare_candy x1-2 (w4)
- **vitamins** (13): hp_up x1-2 (w2), protein x1-2 (w2), iron x1-2 (w2), calcium x1-2 (w2), zinc x1-2 (w2), carbos x1-2 (w2), health_mochi x1-2 (w1), muscle_mochi x1-2 (w1), resist_mochi x1-2 (w1), genius_mochi x1-2 (w1), clever_mochi x1-2 (w1), swift_mochi x1-2 (w1), fresh_start_mochi (w1)
- **feathers** (6): health_feather x2-5 (w1), muscle_feather x2-5 (w1), resist_feather x2-5 (w1), genius_feather x2-5 (w1), clever_feather x2-5 (w1), swift_feather x2-5 (w1)
- **mints** (21): adamant_mint (w1), bold_mint (w1), brave_mint (w1), calm_mint (w1), careful_mint (w1), gentle_mint (w1), hasty_mint (w1), impish_mint (w1), jolly_mint (w1), lax_mint (w1), lonely_mint (w1), mild_mint (w1), modest_mint (w1), naive_mint (w1), naughty_mint (w1), quiet_mint (w1), rash_mint (w1), relaxed_mint (w1), sassy_mint (w1), serious_mint (w1), timid_mint (w1)
- **evolution_stones** (10): fire_stone x1-2 (w1), water_stone x1-2 (w1), thunder_stone x1-2 (w1), leaf_stone x1-2 (w1), moon_stone x1-2 (w1), sun_stone x1-2 (w1), shiny_stone x1-2 (w1), dusk_stone x1-2 (w1), dawn_stone x1-2 (w1), ice_stone x1-2 (w1)
- **evolution_stone_blocks** (10): fire_stone_block (w1), water_stone_block (w1), thunder_stone_block (w1), leaf_stone_block (w1), moon_stone_block (w1), sun_stone_block (w1), shiny_stone_block (w1), dusk_stone_block (w1), dawn_stone_block (w1), ice_stone_block (w1)
- **evolution_items** (41): link_cable (w4), kings_rock (w1), metal_coat (w1), dragon_scale (w1), upgrade (w1), dubious_disc (w1), protector (w1), electirizer (w1), magmarizer (w1), reaper_cloth (w1), razor_claw (w1), razor_fang (w1), prism_scale (w1), oval_stone (w1), deep_sea_scale (w1), deep_sea_tooth (w1), sachet (w1), whipped_dream (w1), sweet_apple (w1), tart_apple (w1), syrupy_apple (w1), galarica_cuff (w1), galarica_wreath (w1), black_augurite (w1), peat_block (w1), auspicious_armor (w1), malicious_armor (w1), cracked_pot (w1), chipped_pot (w1), unremarkable_teacup (w1), masterpiece_teacup (w1), metal_alloy (w1), scroll_of_darkness (w1), scroll_of_waters (w1), strawberry_sweet (w1), love_sweet (w1), berry_sweet (w1), clover_sweet (w1), flower_sweet (w1), star_sweet (w1), ribbon_sweet (w1)
- **held_competitive** (59): leftovers (w3), life_orb (w3), choice_band (w3), choice_scarf (w3), choice_specs (w3), focus_sash (w3), assault_vest (w3), rocky_helmet (w2), heavy_duty_boots (w2), eviolite (w2), expert_belt (w2), weakness_policy (w2), loaded_dice (w2), covert_cloak (w2), clear_amulet (w2), air_balloon (w2), mega_showdown:booster_energy (w2), mega_showdown:adrenaline_orb (w1), light_clay (w1), black_sludge (w1), shell_bell (w1), scope_lens (w1), wide_lens (w1), zoom_lens (w1), quick_claw (w1), muscle_band (w1), wise_glasses (w1), throat_spray (w1), mirror_herb (w1), power_herb (w1), white_herb (w1), mental_herb (w1), red_card (w1), eject_button (w1), eject_pack (w1), blunder_policy (w1), safety_goggles (w1), protective_pads (w1), punching_glove (w1), utility_umbrella (w1), terrain_extender (w1), room_service (w1), ability_shield (w1), flame_orb (w1), toxic_orb (w1), focus_band (w1), big_root (w1), binding_band (w1), grip_claw (w1), shed_shell (w1), damp_rock (w1), heat_rock (w1), icy_rock (w1), smooth_rock (w1), metronome (w1), bright_powder (w1), iron_ball (w1), lagging_tail (w1), sticky_barb (w1)
- **held_competitive_top** (14): leftovers (w1), life_orb (w1), choice_band (w1), choice_scarf (w1), choice_specs (w1), focus_sash (w1), assault_vest (w1), rocky_helmet (w1), heavy_duty_boots (w1), eviolite (w1), weakness_policy (w1), loaded_dice (w1), covert_cloak (w1), mega_showdown:booster_energy (w1)
- **held_training** (11): lucky_egg (w2), exp_share (w2), destiny_knot (w2), everstone (w2), power_anklet (w1), power_band (w1), power_belt (w1), power_bracer (w1), power_lens (w1), power_weight (w1), soothe_bell (w1)
- **type_items** (21): black_belt (w1), black_glasses (w1), charcoal_stick (w1), dragon_fang (w1), hard_stone (w1), magnet (w1), miracle_seed (w1), mystic_water (w1), never_melt_ice (w1), poison_barb (w1), sharp_beak (w1), silk_scarf (w1), silver_powder (w1), soft_sand (w1), spell_tag (w1), twisted_spoon (w1), fairy_feather (w1), electric_seed (w1), grassy_seed (w1), misty_seed (w1), psychic_seed (w1)
- **type_gems** (18): bug_gem x1-3 (w1), dark_gem x1-3 (w1), dragon_gem x1-3 (w1), electric_gem x1-3 (w1), fairy_gem x1-3 (w1), fighting_gem x1-3 (w1), fire_gem x1-3 (w1), flying_gem x1-3 (w1), ghost_gem x1-3 (w1), grass_gem x1-3 (w1), ground_gem x1-3 (w1), ice_gem x1-3 (w1), normal_gem x1-3 (w1), poison_gem x1-3 (w1), psychic_gem x1-3 (w1), rock_gem x1-3 (w1), steel_gem x1-3 (w1), water_gem x1-3 (w1)
- **berries** (8): sitrus_berry x1-4 (w4), lum_berry x1-3 (w3), oran_berry x2-5 (w3), leppa_berry x1-3 (w2), chesto_berry x1-3 (w1), salac_berry (w1), liechi_berry (w1), petaya_berry (w1)
- **pp** (2): pp_up (w3), pp_max (w1)
- **silver_caps** (12): cobblemon_utility:hpsilvercap (w2), cobblemon_utility:atksilvercap (w2), cobblemon_utility:defsilvercap (w2), cobblemon_utility:spatksilvercap (w2), cobblemon_utility:spdefsilvercap (w2), cobblemon_utility:speedsilvercap (w2), cobblemon_utility:shininghpsilvercap (w1), cobblemon_utility:shiningatksilvercap (w1), cobblemon_utility:shiningdefsilvercap (w1), cobblemon_utility:shiningspatksilvercap (w1), cobblemon_utility:shiningspdefsilvercap (w1), cobblemon_utility:shiningspeedsilvercap (w1)
- **shining_caps** (6): cobblemon_utility:shininghpsilvercap (w1), cobblemon_utility:shiningatksilvercap (w1), cobblemon_utility:shiningdefsilvercap (w1), cobblemon_utility:shiningspatksilvercap (w1), cobblemon_utility:shiningspdefsilvercap (w1), cobblemon_utility:shiningspeedsilvercap (w1)
- **fossils** (15): armor_fossil (w1), claw_fossil (w1), cover_fossil (w1), dome_fossil (w1), helix_fossil (w1), jaw_fossil (w1), old_amber_fossil (w1), plume_fossil (w1), root_fossil (w1), sail_fossil (w1), skull_fossil (w1), fossilized_bird (w1), fossilized_dino (w1), fossilized_drake (w1), fossilized_fish (w1)
- **tumblestones** (3): tumblestone x2-6 (w3), sky_tumblestone x2-5 (w2), black_tumblestone x2-5 (w2)
- **ores** (34): fire_stone_ore x1-3 (w3), water_stone_ore x1-3 (w3), thunder_stone_ore x1-3 (w3), leaf_stone_ore x1-3 (w3), moon_stone_ore x1-3 (w3), sun_stone_ore x1-3 (w3), shiny_stone_ore x1-3 (w3), dusk_stone_ore x1-3 (w3), dawn_stone_ore x1-3 (w3), ice_stone_ore x1-3 (w3), deepslate_fire_stone_ore x1-3 (w3), deepslate_water_stone_ore x1-3 (w3), deepslate_thunder_stone_ore x1-3 (w3), deepslate_leaf_stone_ore x1-3 (w3), deepslate_moon_stone_ore x1-3 (w3), deepslate_sun_stone_ore x1-3 (w3), deepslate_shiny_stone_ore x1-3 (w3), deepslate_dusk_stone_ore x1-3 (w3), deepslate_dawn_stone_ore x1-3 (w3), deepslate_ice_stone_ore x1-3 (w3), nether_fire_stone_ore x1-2 (w2), dripstone_moon_stone_ore x1-2 (w2), terracotta_sun_stone_ore x1-2 (w2), mega_showdown:keystone_ore (w2), mega_showdown:mega_meteorid_fire_ore (w1), mega_showdown:mega_meteorid_water_ore (w1), mega_showdown:mega_meteorid_thunder_ore (w1), mega_showdown:mega_meteorid_leaf_ore (w1), mega_showdown:mega_meteorid_moon_ore (w1), mega_showdown:mega_meteorid_sun_ore (w1), mega_showdown:mega_meteorid_shiny_ore (w1), mega_showdown:mega_meteorid_dusk_ore (w1), mega_showdown:mega_meteorid_dawn_ore (w1), mega_showdown:mega_meteorid_ice_ore (w1)
- **mega_stones** (92): mega_showdown:abomasite (w1), mega_showdown:absolite (w1), mega_showdown:absolite_z (w1), mega_showdown:aerodactylite (w1), mega_showdown:aggronite (w1), mega_showdown:alakazite (w1), mega_showdown:altarianite (w1), mega_showdown:ampharosite (w1), mega_showdown:audinite (w1), mega_showdown:banettite (w1), mega_showdown:barbaracite (w1), mega_showdown:baxcalibrite (w1), mega_showdown:beedrillite (w1), mega_showdown:blastoisinite (w1), mega_showdown:blazikenite (w1), mega_showdown:cameruptite (w1), mega_showdown:chandelurite (w1), mega_showdown:charizardite_x (w1), mega_showdown:charizardite_y (w1), mega_showdown:chesnaughtite (w1), mega_showdown:chimechite (w1), mega_showdown:clefablite (w1), mega_showdown:crabominite (w1), mega_showdown:delphoxite (w1), mega_showdown:diancite (w1), mega_showdown:dragalgite (w1), mega_showdown:dragoninite (w1), mega_showdown:drampanite (w1), mega_showdown:eelektrossite (w1), mega_showdown:emboarite (w1), mega_showdown:excadrite (w1), mega_showdown:falinksite (w1), mega_showdown:feraligite (w1), mega_showdown:floettite (w1), mega_showdown:froslassite (w1), mega_showdown:galladite (w1), mega_showdown:garchompite (w1), mega_showdown:garchompite_z (w1), mega_showdown:gardevoirite (w1), mega_showdown:gengarite (w1), mega_showdown:glalitite (w1), mega_showdown:glimmoranite (w1), mega_showdown:golisopite (w1), mega_showdown:golurkite (w1), mega_showdown:greninjite (w1), mega_showdown:gyaradosite (w1), mega_showdown:hawluchanite (w1), mega_showdown:heracronite (w1), mega_showdown:houndoominite (w1), mega_showdown:kangaskhanite (w1), mega_showdown:latiasite (w1), mega_showdown:latiosite (w1), mega_showdown:lopunnite (w1), mega_showdown:lucarionite (w1), mega_showdown:lucarionite_z (w1), mega_showdown:malamarite (w1), mega_showdown:manectite (w1), mega_showdown:mawilite (w1), mega_showdown:medichamite (w1), mega_showdown:meganiumite (w1), mega_showdown:meowsticite (w1), mega_showdown:metagrossite (w1), mega_showdown:mewtwonite_x (w1), mega_showdown:mewtwonite_y (w1), mega_showdown:pidgeotite (w1), mega_showdown:pinsirite (w1), mega_showdown:pyroarite (w1), mega_showdown:raichunite_x (w1), mega_showdown:raichunite_y (w1), mega_showdown:sablenite (w1), mega_showdown:salamencite (w1), mega_showdown:sceptilite (w1), mega_showdown:scizorite (w1), mega_showdown:scolipite (w1), mega_showdown:scovillainite (w1), mega_showdown:scraftinite (w1), mega_showdown:sharpedonite (w1), mega_showdown:skarmorite (w1), mega_showdown:slowbronite (w1), mega_showdown:staraptite (w1), mega_showdown:starminite (w1), mega_showdown:steelixite (w1), mega_showdown:swampertite (w1), mega_showdown:tyranitarite (w1), mega_showdown:venusaurite (w1), mega_showdown:victreebelite (w1), zamega:darkranite (w1), zamega:heatranite (w1), zamega:magearnite (w1), zamega:tatsugirinite (w1), zamega:zeraorite (w1), zamega:zygardite (w1)
- **z_crystals** (35): mega_showdown:aloraichium_z (w1), mega_showdown:buginium_z (w1), mega_showdown:darkinium_z (w1), mega_showdown:decidium_z (w1), mega_showdown:dragonium_z (w1), mega_showdown:eevium_z (w1), mega_showdown:electrium_z (w1), mega_showdown:fairium_z (w1), mega_showdown:fightinium_z (w1), mega_showdown:firium_z (w1), mega_showdown:flyinium_z (w1), mega_showdown:ghostium_z (w1), mega_showdown:grassium_z (w1), mega_showdown:groundium_z (w1), mega_showdown:icium_z (w1), mega_showdown:incinium_z (w1), mega_showdown:kommonium_z (w1), mega_showdown:lunalium_z (w1), mega_showdown:lycanium_z (w1), mega_showdown:marshadium_z (w1), mega_showdown:mewnium_z (w1), mega_showdown:mimikium_z (w1), mega_showdown:normalium_z (w1), mega_showdown:pikanium_z (w1), mega_showdown:pikashunium_z (w1), mega_showdown:poisonium_z (w1), mega_showdown:primarium_z (w1), mega_showdown:psychium_z (w1), mega_showdown:rockium_z (w1), mega_showdown:snorlium_z (w1), mega_showdown:solganium_z (w1), mega_showdown:steelium_z (w1), mega_showdown:tapunium_z (w1), mega_showdown:ultranecrozium_z (w1), mega_showdown:waterium_z (w1)
- **tera_shards** (19): mega_showdown:bug_tera_shard x2-6 (w1), mega_showdown:dark_tera_shard x2-6 (w1), mega_showdown:dragon_tera_shard x2-6 (w1), mega_showdown:electric_tera_shard x2-6 (w1), mega_showdown:fairy_tera_shard x2-6 (w1), mega_showdown:fighting_tera_shard x2-6 (w1), mega_showdown:fire_tera_shard x2-6 (w1), mega_showdown:flying_tera_shard x2-6 (w1), mega_showdown:ghost_tera_shard x2-6 (w1), mega_showdown:grass_tera_shard x2-6 (w1), mega_showdown:ground_tera_shard x2-6 (w1), mega_showdown:ice_tera_shard x2-6 (w1), mega_showdown:normal_tera_shard x2-6 (w1), mega_showdown:poison_tera_shard x2-6 (w1), mega_showdown:psychic_tera_shard x2-6 (w1), mega_showdown:rock_tera_shard x2-6 (w1), mega_showdown:steel_tera_shard x2-6 (w1), mega_showdown:water_tera_shard x2-6 (w1), mega_showdown:stellar_tera_shard x2-6 (w1)
- **gimmick_materials** (7): mega_showdown:keystone (w4), mega_showdown:mega_stone (w4), mega_showdown:wishing_star (w3), mega_showdown:dynamax_candy x1-3 (w3), mega_showdown:max_mushroom x1-2 (w2), mega_showdown:zygarde_cell x1-3 (w2), mega_showdown:blank_z (w2)
- **gimmick_key_items** (5): mega_showdown:mega_bracelet (w3), mega_showdown:z_ring (w2), mega_showdown:dynamax_band (w2), mega_showdown:tera_orb (w2), mega_showdown:max_soup (w1)
- **raid** (4): cobblemonraiddens:cheer_attack x1-3 (w2), cobblemonraiddens:cheer_defense x1-3 (w2), cobblemonraiddens:cheer_heal x1-3 (w2), cobblemonraiddens:raid_shard (w2)
- **gacha** (11): cobbledgacha:gacha_coin x1-3 (w6), cobbledgacha:gacha_coin_2 (w1), cobbledgacha:gacha_coin_3 (w1), cobbledgacha:gacha_coin_4 (w1), cobbledgacha:gacha_coin_5 (w1), cobbledgacha:gacha_coin_6 (w1), cobbledgacha:gacha_coin_7 (w1), cobbledgacha:gacha_coin_8 (w1), cobbledgacha:gacha_coin_9 (w1), cobbledgacha:gacha_coin_10 (w1), cobbledgacha:koban_coin x1-3 (w2)
- **repels** (3): cobblemonrepel:repel (w3), cobblemonrepel:super_repel (w2), cobblemonrepel:max_repel (w1)
- **compasses** (6): mega_compass:mega_compass (w1), mega_compass:observatory_compass (w1), mega_compass:wishing_weald_compass (w1), mega_compass:archaeological_compass (w1), mega_compass:mega_site_compass (w1), mega_compass:megaroid_compass (w1)
- **legendary_relics** (5): legendarymonuments:disc_of_the_first_song_fragment (w3), legendarymonuments:medallion_of_renewal_fragment (w3), legendarymonuments:lightstone_shard (w2), legendarymonuments:darkstone_shard (w2), legendarymonuments:golem_scrap x1-3 (w2)
- **coins** (2): relic_coin x1-3 (w10), relic_coin_pouch (w1)

## Touched tables (211)

| Table | Profile | Artifacts pool replicated |
|---|---|---|
| `cobblemon:injection/chests/abandoned_mineshaft` | underground |  |
| `cobblemon:injection/chests/ancient_city` | treasure |  |
| `cobblemon:injection/chests/bastion_bridge` | underground |  |
| `cobblemon:injection/chests/bastion_hoglin_stable` | underground |  |
| `cobblemon:injection/chests/bastion_other` | underground |  |
| `cobblemon:injection/chests/bastion_treasure` | treasure |  |
| `cobblemon:injection/chests/end_city_treasure` | treasure |  |
| `cobblemon:injection/chests/igloo_chest` | adventure |  |
| `cobblemon:injection/chests/jungle_temple` | adventure |  |
| `cobblemon:injection/chests/nether_bridge` | underground |  |
| `cobblemon:injection/chests/pillager_outpost` | adventure |  |
| `cobblemon:injection/chests/shipwreck_supply` | basic |  |
| `cobblemon:injection/chests/simple_dungeon` | underground |  |
| `cobblemon:injection/chests/stronghold_corridor` | underground |  |
| `cobblemon:injection/chests/village_house` | basic |  |
| `cobblemon:injection/chests/woodland_mansion` | treasure |  |
| `minecraft:chests/ancient_city_ice_box` | basic | yes |
| `minecraft:chests/buried_treasure` | treasure | yes |
| `minecraft:chests/desert_pyramid` | adventure | yes |
| `minecraft:chests/ruined_portal` | adventure | yes |
| `minecraft:chests/shipwreck_map` | basic |  |
| `minecraft:chests/shipwreck_treasure` | treasure | yes |
| `minecraft:chests/stronghold_crossing` | underground |  |
| `minecraft:chests/stronghold_library` | treasure |  |
| `minecraft:chests/underwater_ruin_big` | adventure | yes |
| `minecraft:chests/underwater_ruin_small` | basic |  |
| `minecraft:chests/trial_chambers/corridor` | underground |  |
| `minecraft:chests/trial_chambers/entrance` | underground |  |
| `minecraft:chests/trial_chambers/intersection` | underground |  |
| `minecraft:chests/trial_chambers/intersection_barrel` | underground |  |
| `minecraft:chests/trial_chambers/supply` | underground |  |
| `minecraft:chests/trial_chambers/reward` | vault |  |
| `minecraft:chests/trial_chambers/reward_ominous` | vault_ominous |  |
| `minecraft:chests/village/village_armorer` | basic | yes |
| `minecraft:chests/village/village_butcher` | basic | yes |
| `minecraft:chests/village/village_cartographer` | basic |  |
| `minecraft:chests/village/village_fisher` | basic |  |
| `minecraft:chests/village/village_fletcher` | basic |  |
| `minecraft:chests/village/village_mason` | basic |  |
| `minecraft:chests/village/village_shepherd` | basic |  |
| `minecraft:chests/village/village_tannery` | basic | yes |
| `minecraft:chests/village/village_temple` | basic | yes |
| `minecraft:chests/village/village_toolsmith` | basic | yes |
| `minecraft:chests/village/village_weaponsmith` | basic | yes |
| `cobblemon:villages/village_pokecenters` | basic |  |
| `cobblemon:shipwreck_coves/fishing_boats/fishing_boat` | basic |  |
| `cobblemon:shipwreck_coves/vanilla_chests/cove1_barrel` | basic |  |
| `cobblemon:shipwreck_coves/vanilla_chests/cove2_barrel` | basic |  |
| `cobblemon:shipwreck_coves/vanilla_chests/cove1_chest` | adventure |  |
| `cobblemon:shipwreck_coves/gilded_chests/lesser_treasure` | treasure |  |
| `cobblemon:shipwreck_coves/gilded_chests/big_treasure_blastburn` | treasure |  |
| `cobblemon:shipwreck_coves/gilded_chests/big_treasure_frenzyplant` | treasure |  |
| `cobblemon:shipwreck_coves/gilded_chests/big_treasure_hydrocannon` | treasure |  |
| `cobblemon:ruins/gilded_chests/ruins` | adventure |  |
| `cobblemon:ruins/vanilla_loot/vanilla_loot` | adventure |  |
| `cobblemon:ruins/gilded_chests/alluringvoice` | treasure |  |
| `cobblemon:ruins/gilded_chests/burningjealousy` | treasure |  |
| `cobblemon:ruins/gilded_chests/chillingwater` | treasure |  |
| `cobblemon:ruins/gilded_chests/coaching` | treasure |  |
| `cobblemon:ruins/gilded_chests/corrosivegas` | treasure |  |
| `cobblemon:ruins/gilded_chests/dracometeor` | treasure |  |
| `cobblemon:ruins/gilded_chests/dragoncheer` | treasure |  |
| `cobblemon:ruins/gilded_chests/gimmialluringvoice` | treasure |  |
| `cobblemon:ruins/gilded_chests/grassyglide` | treasure |  |
| `cobblemon:ruins/gilded_chests/hardpress` | treasure |  |
| `cobblemon:ruins/gilded_chests/lashout` | treasure |  |
| `cobblemon:ruins/gilded_chests/meteorbeam` | treasure |  |
| `cobblemon:ruins/gilded_chests/mistyexplosion` | treasure |  |
| `cobblemon:ruins/gilded_chests/poltergeist` | treasure |  |
| `cobblemon:ruins/gilded_chests/pounce` | treasure |  |
| `cobblemon:ruins/gilded_chests/psychicnoise` | treasure |  |
| `cobblemon:ruins/gilded_chests/risingvoltage` | treasure |  |
| `cobblemon:ruins/gilded_chests/scaleshot` | treasure |  |
| `cobblemon:ruins/gilded_chests/scorchingsands` | treasure |  |
| `cobblemon:ruins/gilded_chests/skydrop` | treasure |  |
| `cobblemon:ruins/gilded_chests/steelbeam` | treasure |  |
| `cobblemon:ruins/gilded_chests/supercellslam` | treasure |  |
| `cobblemon:ruins/gilded_chests/telekinesis` | treasure |  |
| `cobblemon:ruins/gilded_chests/temperflare` | treasure |  |
| `cobblemon:ruins/gilded_chests/trailblaze` | treasure |  |
| `cobblemon:ruins/gilded_chests/tripleaxel` | treasure |  |
| `cobblemon:ruins/gilded_chests/upperhand` | treasure |  |
| `mega_showdown:chests/observatory_barrel` | basic |  |
| `mega_showdown:chests/observatory_barrel_2` | basic |  |
| `mega_showdown:chests/observatory_barrel_3` | basic |  |
| `mega_showdown:chests/observatory_chest` | adventure |  |
| `mega_showdown:chests/observatory_dome_chest` | treasure |  |
| `mega_showdown:archaeological_site/archaeological_site_chest` | adventure |  |
| `mega_showdown:wishing_weald/wishing_weald_chest` | treasure |  |
| `legendarymonuments:chests/bell_tower_chest` | adventure |  |
| `legendarymonuments:chests/thalic_chest` | adventure |  |
| `legendarymonuments:chests/turnback_cave_chest` | adventure |  |
| `legendarymonuments:chests/calyrex_chest` | treasure |  |
| `legendarymonuments:chests/dragoeleki_chest` | treasure |  |
| `legendarymonuments:chests/heatran_cave_chest` | treasure |  |
| `legendarymonuments:chests/liberty_island_chest` | treasure |  |
| `legendarymonuments:chests/lugia_temple_chest` | treasure |  |
| `legendarymonuments:chests/regice_chest` | treasure |  |
| `legendarymonuments:chests/regigigas_chest` | treasure |  |
| `legendarymonuments:chests/regirock_chest` | treasure |  |
| `legendarymonuments:chests/registeel_chest` | treasure |  |
| `legendarymonuments:chests/swsh_temple_shield` | treasure |  |
| `legendarymonuments:chests/swsh_temple_sword` | treasure |  |
| `legendarymonuments:chests/turnback_cave_vault` | vault |  |
| `supplementaries:loot/galleon/chest` | adventure |  |
| `supplementaries:loot/galleon/key` | basic |  |
| `artifacts:chests/campsite_chest` | basic |  |
| `artifacts:chests/campsite_barrel` | basic |  |
| `bca:general/attic` | village |  |
| `bca:general/bedroom` | village |  |
| `bca:general/blacksmith` | village |  |
| `bca:general/easter_egg` | village |  |
| `bca:general/gardening` | village |  |
| `bca:general/ice_chest` | village |  |
| `bca:general/kitchen` | village |  |
| `bca:general/miner` | village |  |
| `bca:general/pokecenter` | village |  |
| `bca:general/potions` | village |  |
| `bca:general/sittingroom` | village |  |
| `bca:general/workshop` | village |  |
| `betterdungeons:spider_dungeon/chests/egg_room` | underground |  |
| `betterdeserttemples:chests/food_storage` | basic |  |
| `betterdeserttemples:chests/storage` | basic |  |
| `betterdeserttemples:chests/wardrobe` | basic |  |
| `betterdeserttemples:chests/library` | adventure |  |
| `betterdeserttemples:chests/lab` | adventure |  |
| `betterdeserttemples:chests/pot` | adventure |  |
| `betterdeserttemples:chests/statue` | adventure |  |
| `betterdeserttemples:chests/tomb` | treasure |  |
| `betterdeserttemples:chests/tomb_pharaoh` | treasure |  |
| `betterdeserttemples:chests/pharaoh_hidden` | treasure |  |
| `betterdungeons:skeleton_dungeon/chests/common` | underground |  |
| `betterdungeons:skeleton_dungeon/chests/middle` | underground |  |
| `betterdungeons:small_dungeon/chests/loot_piles` | underground |  |
| `betterdungeons:small_nether_dungeon/chests/common` | underground |  |
| `betterdungeons:zombie_dungeon/chests/common` | underground |  |
| `betterdungeons:zombie_dungeon/chests/tombstone` | underground |  |
| `betterdungeons:zombie_dungeon/chests/special` | treasure |  |
| `betterjungletemples:chests/campsite` | basic |  |
| `betterjungletemples:chests/treasure` | treasure |  |
| `betterfortresses:chests/extra` | underground |  |
| `betterfortresses:chests/hall` | underground |  |
| `betterfortresses:chests/keep` | underground |  |
| `betterfortresses:chests/obsidian` | underground |  |
| `betterfortresses:chests/quarters` | underground |  |
| `betterfortresses:chests/storage` | underground |  |
| `betterfortresses:chests/beacon` | treasure |  |
| `betterfortresses:chests/puzzle` | treasure |  |
| `betterfortresses:chests/worship` | treasure |  |
| `betteroceanmonuments:chests/upper_side_chamber` | treasure |  |
| `betterstrongholds:chests/armoury` | underground |  |
| `betterstrongholds:chests/common` | underground |  |
| `betterstrongholds:chests/mess` | underground |  |
| `betterstrongholds:chests/prison_lg` | underground |  |
| `betterstrongholds:chests/trap` | underground |  |
| `betterstrongholds:chests/crypt` | treasure |  |
| `betterstrongholds:chests/grand_library` | treasure |  |
| `betterstrongholds:chests/treasure` | treasure |  |
| `betterstrongholds:chests/cmd_yung` | treasure |  |
| `betterwitchhuts:chests/hut_0` | adventure |  |
| `yungsextras:desert/chillzone` | adventure |  |
| `yungsextras:desert/ruins` | adventure |  |
| `ctov:chests/village/village_badlands_house` | basic |  |
| `ctov:chests/village/village_beach_house` | basic |  |
| `ctov:chests/village/village_dark_forest_house` | basic |  |
| `ctov:chests/village/village_farm` | basic |  |
| `ctov:chests/village/village_forager` | basic |  |
| `ctov:chests/village/village_jungle_house` | basic |  |
| `ctov:chests/village/village_library` | basic |  |
| `ctov:chests/village/village_mountain_house` | basic |  |
| `ctov:chests/village/village_mushroom_house` | basic |  |
| `ctov:chests/village/village_swamp_house` | basic |  |
| `explorify:chest/dark_forest_settlement` | adventure |  |
| `terralith:desert_outpost` | adventure |  |
| `terralith:igloo` | adventure |  |
| `terralith:lodge_drinkables` | adventure |  |
| `terralith:witch_hut` | adventure |  |
| `terralith:mage/barracks` | adventure |  |
| `terralith:mage/extras` | adventure |  |
| `terralith:mage/treasure` | adventure |  |
| `terralith:ruin/glacial/junk` | adventure |  |
| `terralith:ruin/glacial/main_cs` | adventure |  |
| `terralith:spire/common` | adventure |  |
| `terralith:spire/junk` | adventure |  |
| `terralith:spire/rare` | adventure |  |
| `terralith:spire/treasure` | treasure |  |
| `terralith:underground/chest` | adventure |  |
| `terralith:underground/giant_bee_hive` | adventure |  |
| `terralith:village/desert/archer` | basic |  |
| `terralith:village/desert/butcher` | basic |  |
| `terralith:village/desert/cartographer` | basic |  |
| `terralith:village/desert/junk` | basic |  |
| `terralith:village/desert/smith` | basic |  |
| `terralith:village/desert/treasure` | treasure |  |
| `terralith:village/fortified/archer` | basic |  |
| `terralith:village/fortified/attic` | basic |  |
| `terralith:village/fortified/cartographer` | basic |  |
| `terralith:village/fortified/fisherman` | basic |  |
| `terralith:village/fortified/food` | basic |  |
| `terralith:village/fortified/generic` | basic |  |
| `terralith:village/fortified/generic_low` | basic |  |
| `terralith:village/fortified/library` | basic |  |
| `terralith:village/fortified/mason` | basic |  |
| `terralith:village/fortified/smith` | basic |  |
| `terralith:village/fortified/tavern_downstairs` | basic |  |
| `terralith:village/fortified/tavern_upstairs` | basic |  |
| `terralith:village/fortified/treasure` | treasure |  |

## Item id fixes

In 1.21.1 a single unknown item id makes a whole loot table fail to load. These tables are overridden with their original
content and only the ids below replaced (`cobblemon:tomato_berry` -> `cobblemon:tamato_berry`, `cobblemon:black_apricorn_sprout` -> `cobblemon:black_apricorn_seed`, `cobblemon:blue_apricorn_sprout` -> `cobblemon:blue_apricorn_seed`).

| Table | Source jar | Wrong ids | Also gets our pool |
|---|---|---|---|
| `legendarymonuments:chests/tower_spawner_dark` | legendarymonuments-fabric-1.21.1-8.2-Keep-Fighting | `cobblemon:black_apricorn_sprout` | no (not placed as a structure chest) |
| `legendarymonuments:chests/tower_spawner_water` | legendarymonuments-fabric-1.21.1-8.2-Keep-Fighting | `cobblemon:blue_apricorn_sprout`, `cobblemon:tomato_berry` | no (not placed as a structure chest) |
| `legendarymonuments:spawners/dojo/dark_tower_spawner` | legendarymonuments-fabric-1.21.1-8.2-Keep-Fighting | `cobblemon:black_apricorn_sprout` | no (not placed as a structure chest) |
| `legendarymonuments:spawners/dojo/water_tower_spawner` | legendarymonuments-fabric-1.21.1-8.2-Keep-Fighting | `cobblemon:blue_apricorn_sprout`, `cobblemon:tomato_berry` | no (not placed as a structure chest) |

## Created tables (referenced by CTOV/Terralith structures but missing from the mods)

Each rolls its target table once; `+ profiles/basic` is added only when the target does not already carry our pool.

| Created table | Rolls | Structure piece | Why |
|---|---|---|---|
| `ctov:pillager_outpost/halloween/tower` | `minecraft:chests/pillager_outpost` | pillager_outpost/dark_forest/tower | outpost tower chest; vanilla pillager outpost table |
| `ctov:village/beach/farm` | `ctov:chests/village/village_farm` | village/beach/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/christmas/farm` | `ctov:chests/village/village_farm` | village/christmas/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/desert/` | `ctov:chests/village/village_library` | village/mesa_fortified/jobsite/library (barrel) | truncated id placed in a library building; CTOV library chest table |
| `ctov:village/desert/farm` | `ctov:chests/village/village_farm` | village/desert, desert_oasis/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/desert/mason` | `minecraft:chests/village/village_mason` | village/desert/jobsite/woodworker | id names the mason profession; vanilla mason chest |
| `ctov:village/desert_fortified/bakery` | `ctov:chests/village/village_bakery` | village/desert_oasis/jobsite/bakery | CTOV's own bakery chest table |
| `ctov:village/halloween/farm` | `ctov:chests/village/village_farm` | village/halloween/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/jungle/farm` | `ctov:chests/village/village_farm` | village/jungle_tree/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/mesa/farm` | `ctov:chests/village/village_farm` | village/mesa, mesa_fortified/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/mesa/smith` | `ctov:chests/village/village_smith` | village/mesa_fortified/jobsite/imengineer | id names smith; CTOV smith table (one of armorer/fletcher/toolsmith/weaponsmith) |
| `ctov:village/mountain/farm` | `ctov:chests/village/village_farm` | village/mountain/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/mushroom/farm` | `ctov:chests/village/village_farm` | village/mushroom/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/plains/farm` | `ctov:chests/village/village_farm` | village/plains/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/savanna/farm` | `ctov:chests/village/village_farm` | village/savanna/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/snowy/farm` | `ctov:chests/village/village_farm` | village/snowy_igloo/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/snowy/library` | `ctov:chests/village/village_library` | village/snowy_igloo/jobsite/hunter_trainer | id names library; CTOV library chest table (books, paper) |
| `ctov:village/swamp/farm` | `ctov:chests/village/village_farm` | village/swamp_fortified/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/swamp/leatherworker` | `minecraft:chests/village/village_tannery` | village/swamp/jobsite/leatherworker | leatherworker = vanilla tannery chest |
| `ctov:village/taiga/farm` | `ctov:chests/village/village_farm` | village/taiga, taiga_fortified/jobsite/orchard | orchard jobsite; CTOV's own farm chest table (crops, emeralds) |
| `ctov:village/taiga/library` | `ctov:chests/village/village_library` | village/taiga/jobsite/hunter_trainer | id names library; CTOV library chest table (books, paper) |
| `terralith:village/desert/leatherworker` | `minecraft:chests/village/village_tannery` | village/desert/houses/tanner1 (barrel) | tanner house; vanilla tannery chest (Terralith has no desert tannery table) |

References to namespaces of mods that are not installed (CTOV compat pieces, e.g. `wares:`, `archers:`,
`iceandfire:`) are left alone.

## Skipped because they already roll into a touched table

- `ctov:chests/village/village_bakery` -> `ctov:chests/village/village_farm`
- `ctov:chests/village/village_smith` -> `minecraft:chests/village/village_weaponsmith`
- `explorify:chest/supply_cache` -> `minecraft:chests/village/village_tannery`
- `terralith:village/desert/fisherman` -> `terralith:village/fortified/fisherman`
- `terralith:village/desert/food` -> `terralith:village/fortified/food`
- `terralith:village/desert/generic` -> `terralith:village/fortified/generic`
- `terralith:village/desert/generic_low` -> `terralith:village/fortified/generic_low`
- `terralith:village/desert/library` -> `terralith:village/fortified/library`
- `terralith:village/desert/mason` -> `terralith:village/fortified/mason`
- `terralith:village/desert/shepherd` -> `terralith:village/desert/food`

Not touched: `minecraft:chests/spawn_bonus_chest` (keeps Cobblemon's injection), `jungle_temple_dispenser`,
trial chamber reward sub-tables (reached through `reward` / `reward_ominous`), archaeology, pots, entity, fishing and block tables.
