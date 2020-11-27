/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true)==noone){
	agitated = true;
}

if (agitated = true && push_force==0){
	
	dir = point_direction(x,y,obj_player.x,obj_player.y);
	if (attacking){
	}
	else
	{
		if (!script_collision_ray(x,y,obj_player.x,obj_player.y,16, 14)){
			if (abs(dir-direction)<=turn_spd){
				attacking = true;
				direction = dir;
				speed = spd;
			}
			else
			{
				direction = direction + turn_spd;
			}
		}
		else
		{
				direction = direction + turn_spd;
		}
		
	}
}
else
{
		direction = direction + turn_spd_idle;
}

