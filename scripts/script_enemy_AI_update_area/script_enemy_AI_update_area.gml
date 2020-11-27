function script_enemy_AI_update_area(argument0, argument1, argument2, argument3) {
	pX = argument0;
	pY = argument1;
	sight = argument2;
	cleanup = argument3;


	grid_density = obj_enemy_AI.grid_density;

	playerX = max(0,floor((argument0-obj_enemy_AI.view_box_size)/grid_density));
	playerY = max(0,floor((argument1-obj_enemy_AI.view_box_size)/grid_density));
		
	for(var i=playerX; i < playerX+view_box_size/grid_density*2; i++){
		for(var j=playerY; j < playerY+view_box_size/grid_density*2; j++){
			xPos = i*grid_density+grid_density/2;
			yPos = j*grid_density+grid_density/2;
			if (!cleanup){
				if (point_distance(xPos,yPos, obj_player.x,obj_player.y)<640){
					sight[i, j]=!script_collision_ray(xPos, yPos, obj_player.x, obj_player.y,10,10);
				}
				else
				{
					sight[i, j] = false;
				}
			}
			else
			{
				sight[i, j] = false;
			}
		}
	}


}
