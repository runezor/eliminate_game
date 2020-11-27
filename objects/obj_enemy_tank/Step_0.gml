/// @description Insert description here
// You can write your code in this editor
// Bullet
event_inherited();

if (collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true)==noone){
	agitated = true;
}

if (agitated = true){
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
	
	
mp_potential_step(obj_player.x,obj_player.y,spd,false);
}