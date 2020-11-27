/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_enemy_smart)){
	player_score = player_score + 1;
	instance_destroy(obj_player);
	instance_create_depth(player_x, player_y, 0, obj_player);
	instance_create_depth(enemy_x, enemy_y, 0, obj_enemy_smart);
}
if (!instance_exists(obj_player)){
	enemy_score = enemy_score + 1;
	instance_destroy(obj_enemy_smart);
	instance_create_depth(player_x, player_y, 0, obj_player);
	instance_create_depth(enemy_x, enemy_y, 0, obj_enemy_smart);
}