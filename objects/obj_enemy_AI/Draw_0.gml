/// @description Insert description here
// You can write your code in this editor
if (debug){
	if(debug_clear_shot){
		
		playerX = max(0,floor((obj_player.x-draw_box_size)/grid_density));
		playerY = max(0,floor((obj_player.y-draw_box_size)/grid_density));
		
		for(var i=playerX; i < playerX+draw_box_size/grid_density*2; i++){
			for(var j=playerY; j < playerY+draw_box_size/grid_density*2; j++){
				draw_set_alpha(0.2);
				if (!sight[i,j]){
					draw_set_color(c_red);
				}
				else
				{
					draw_set_color(c_green);
				}
		
				draw_rectangle(i*grid_density, j*grid_density, i*grid_density+grid_density,j*grid_density+grid_density, false);
		
			}
		}
	}
	
if (debug_bullet_safe){
	for(t=0; t<1; t=t+5){
		for(var i=0; i < window_w; i++){
			for(var j=0; j < window_h; j++){
				draw_set_alpha(0.5/(t/5+1));
				if (!script_is_bullet_safe(i*grid_density+grid_density/2,j*grid_density+grid_density/2,t)){
					draw_set_color(c_red);
					draw_rectangle(i*grid_density, j*grid_density, i*grid_density+grid_density,j*grid_density+grid_density, false);
				}
			}
		}
	}
}

draw_set_alpha(1);


}