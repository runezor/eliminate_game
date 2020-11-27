# eliminate_game

This game uses Game Maker Studio 2.

## AI

### obj_enemy_smart
This AI uses BFS on a time-dependent graph to plan its bullet avoidance. This produces an enemy that is almost impossible to hit.

Player fighting obj_enemy_smart: https://streamable.com/dwjxss

obj_enemy_smart fighting simpler enemies: https://streamable.com/8rd7x2
The blue enemy has the same damage/shot rate/health/speed as the other enemies, but uses the bullet avoidance AI


## todo
- More rooms
- Better shot detection (currently enemies sometimes shoot shots that will just hit a wall)
- Better collision handling
