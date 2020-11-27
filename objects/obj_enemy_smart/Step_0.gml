/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (instance_exists(obj_player) && collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true)==noone){
	agitated = true;
}

if (agitated = true){
	if (plan_charge==0){
		toGo = script_avoid_bullets(x,y, true);
		path = toGo[0];
		path_len = toGo[1];
		plan_charge = plan_time;
	}
	else
	{
		plan_charge = plan_charge-1;
	}
	path = toGo[0];
	path_len = toGo[1];
	
	if (path_len!=-1 && push_force<=0){
		pos = path[path_len];
		while(point_distance(x,y,pos[0], pos[1])<spd && path_len>0){
			path_len=path_len-1;
			pos = path[path_len];
		}
	
		if (path_len==0 && point_distance(x,y,pos[0], pos[1])<spd){
				x = pos[0];
				y = pos[1];
				speed=0;
		}
		else
		{
				if (collision_line(x,y,pos[0],pos[1],obj_obstacle,false,true)==noone){
					move_towards_point(pos[0],pos[1],spd);
				}
				else
				{
					speed=0;
				}
			
		}
	}
	

	
	// Bullet
	dir = -point_direction(x, y, obj_player.x, obj_player.y)/180*pi;

	if (bullet_charge==0){
		if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true)==noone){
			script_shoot_bullet_slug(dir, targetType.player);
			bullet_charge = bullet_time;
		}
	}
	if (bullet_charge>0){
		bullet_charge = bullet_charge - 1;
	}
}

