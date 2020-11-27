/// @description Insert description here
// You can write your code in this editor
grid_density = 32;
window_w = room_width/grid_density;
window_h = room_height/grid_density;
view_box_size = 200;
draw_box_size = 400;
debug = false;
debug_clear_shot=false;
debug_bullet_safe=false;

for(var i=0; i < window_w; i++){
	for(var j=0; j < window_h; j++){
		sight[i, j]=noone;
	}
}

updateFreq = 10;
updateStep = 0;

//For cleanup
old_player_x = obj_player.x;
old_player_y = obj_player.y;