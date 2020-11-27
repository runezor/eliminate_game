/// @description Insert description here
// You can write your code in this editor
if (updateStep==updateFreq){
	if (instance_exists(obj_player)){
		script_enemy_AI_update_area(old_player_x, old_player_y, sight, true);
		old_player_x = obj_player.x;
		old_player_y = obj_player.y;
		script_enemy_AI_update_area(obj_player.x, obj_player.y, sight, false);
	}
	updateStep = 0;
}
else
{
	updateStep = updateStep + 1;
}