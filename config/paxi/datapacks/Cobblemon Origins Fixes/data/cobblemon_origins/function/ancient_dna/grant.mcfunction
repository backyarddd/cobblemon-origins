# Ancient DNA reward (cobblemon_origins:ancient_dna/<series> advancements, one per Radical Cobblemon Trainers series).
# Runs once per player and series as the reward of that advancement, which needs the series' Elite Four and final boss
# beaten. give drops the item at the player's feet when the inventory is full.
# Vanilla commands only: on Arclight a plain line with a mod command fails the whole function.
give @s lumymon:ancient_dna 1
tellraw @s ["",{"text":"You received ","color":"light_purple"},{"text":"Ancient DNA","color":"yellow"},{"text":"! Put it and a Cloning Catalyst in a Restoration Tank to revive Mewtwo, or craft it into an Origin Fossil for Mew.","color":"light_purple"}]
