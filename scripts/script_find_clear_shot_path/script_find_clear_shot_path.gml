function script_find_clear_shot_path(argument0, argument1) {
	//Uses enemy_ai data to plan a path
	q = ds_queue_create();
	r = 16;
	grid_density = obj_enemy_AI.grid_density;
	max_dist=16;

	xVal = round((argument0-grid_density/2)/grid_density)*grid_density+grid_density/2;
	yVal = round((argument1-grid_density/2)/grid_density)*grid_density+grid_density/2;
	ds_queue_enqueue(q, [xVal, yVal, 0]);

	found = false;

	for(var i=0; i < obj_enemy_AI.window_w; i++){
		for(var j=0; j < obj_enemy_AI.window_h; j++){
			pred[i, j]=noone;
		}
	}

	pred[(xVal-grid_density/2)/grid_density,(yVal-grid_density/2)/grid_density]=true;

	t =0;

	while(ds_queue_size(q)>0 && found==false && t<max_dist){
		coord = ds_queue_dequeue(q);
		xPos = round((coord[0]-grid_density/2)/grid_density);
		yPos = round((coord[1]-grid_density/2)/grid_density);
		t = coord[2];
	
		if (obj_enemy_AI.sight[xPos, yPos]==true && collision_circle(coord[0], coord[1], r,obj_obstacle,false,true)==noone){
			found = true;
		}
	
		//Go up
		if (yPos>0 && pred[xPos, yPos-1]==noone && collision_circle(coord[0], coord[1]-grid_density, r,obj_obstacle,false,true)==noone){
			pred[xPos, yPos-1] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0],coord[1]-grid_density, t+1]);
		}
		//Go down
		if (yPos<obj_enemy_AI.window_h-1 && pred[xPos, yPos+1]==noone && collision_circle(coord[0], coord[1]+grid_density,r,obj_obstacle,false,true)==noone){
			pred[xPos, yPos+1] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0],coord[1]+grid_density, t+1]);
		}
		//Go left
		if (xPos>0 && pred[xPos-1, yPos]==noone  && collision_circle(coord[0]-grid_density, coord[1],r, obj_obstacle,false,true)==noone){
			pred[xPos-1, yPos] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0]-grid_density,coord[1], t+1]);
		}
		//Go right
		if (xPos<obj_enemy_AI.window_w-1 && pred[xPos+1, yPos]==noone  && collision_circle(coord[0]+grid_density, coord[1],r,obj_obstacle,false,true)==noone){
			pred[xPos+1, yPos] = [xPos, yPos];
			ds_queue_enqueue(q, [coord[0]+grid_density,coord[1], t+1]);
		}
	}

	if (found == false){
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
