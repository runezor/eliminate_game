function script_avoid_bullets(argument0, argument1, argument2) {
	//Uses enemy_ai data to plan a path
	q = ds_queue_create();
	r = 16;
	grid_density = obj_enemy_AI.grid_density;
	grid_time_move = grid_density/obj_enemy_smart.spd;

	xVal = round((argument0-grid_density/2)/grid_density)*grid_density+grid_density/2;
	yVal = round((argument1-grid_density/2)/grid_density)*grid_density+grid_density/2;
	shy_distance = 128;

	aim_for_player = argument2;

	ds_queue_enqueue(q, [xVal, yVal, 0]);

	found = false;

	for(var i=0; i < obj_enemy_AI.window_w; i++){
		for(var j=0; j < obj_enemy_AI.window_h; j++){
			pred[i, j]=noone;
		}
	}

	pred[(xVal-grid_density/2)/grid_density,(yVal-grid_density/2)/grid_density]=true;

	while(ds_queue_size(q)>0 && found==false){
		coord = ds_queue_dequeue(q);
		xPos = round((coord[0]-grid_density/2)/grid_density);
		yPos = round((coord[1]-grid_density/2)/grid_density);
		t = coord[2];
	
		//if (obj_enemy_AI.sight[xPos, yPos]==true && collision_circle(coord[0], coord[1], r,obj_obstacle,false,true)==noone && point_distance(coord[0], coord[1], obj_player.x, obj_player.y)>shy_distance){
		if ((obj_enemy_AI.sight[xPos, yPos]==true || aim_for_player == false) && collision_circle(coord[0], coord[1], r,obj_obstacle,false,true)==noone && collision_circle(coord[0], coord[1], shy_distance, obj_player, false, true)==noone){
			var found = true;
			for(var tt=0; tt<20; tt=tt+2){
				found = found && script_is_bullet_safe(coord[0], coord[1], t+tt);
			}
		}
	
		//Go up
		if (yPos>0 && pred[xPos, yPos-1]==noone && collision_circle(coord[0], coord[1]-grid_density, r,obj_obstacle,false,true)==noone && script_is_bullet_safe(coord[0], coord[1]-grid_density, t+1)){
			pred[xPos, yPos-1] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0],coord[1]-grid_density, t+grid_time_move]);
		}
		//Go down
		if (yPos<obj_enemy_AI.window_h-1 && pred[xPos, yPos+1]==noone && collision_circle(coord[0], coord[1]+grid_density,r,obj_obstacle,false,true)==noone && script_is_bullet_safe(coord[0], coord[1]+grid_density, t+1)){
			pred[xPos, yPos+1] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0],coord[1]+grid_density, t+grid_time_move]);
		}
		//Go left
		if (xPos>0 && pred[xPos-1, yPos]==noone  && collision_circle(coord[0]-grid_density, coord[1], r, obj_obstacle,false,true)==noone && script_is_bullet_safe(coord[0]-grid_density, coord[1], t+1)){
			pred[xPos-1, yPos] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0]-grid_density,coord[1], t+grid_time_move]);
		}
		//Go right
		if (xPos<obj_enemy_AI.window_w-1 && pred[xPos+1, yPos]==noone  && collision_circle(coord[0]+grid_density, coord[1],r,obj_obstacle,false,true)==noone && script_is_bullet_safe(coord[0]+grid_density, coord[1], t+1)){
			pred[xPos+1, yPos] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0]+grid_density,coord[1], t+grid_time_move]);
		}
	}

	if (found == false){
		if (aim_for_player){
			return script_avoid_bullets(argument0,argument1,false);
		}
		xPos = (xVal-grid_density/2)/grid_density;
		yPos = (yVal-grid_density/2)/grid_density;
	}

	i = 0;
	returning[i]=[xPos*grid_density+grid_density/2, yPos*grid_density+grid_density/2];
	pre = pred[xPos, yPos];
	while(pre!=true){
		i++;
		returning[i]=[xPos*grid_density+grid_density/2, yPos*grid_density+grid_density/2];
		xPos = pre[0];
		yPos = pre[1];
		pre = pred[xPos,yPos];
	}

	return [returning, i];



}
