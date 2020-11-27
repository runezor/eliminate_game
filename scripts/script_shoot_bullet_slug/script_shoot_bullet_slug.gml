function script_shoot_bullet_slug(argument0, argument1) {
	dir = argument0
	inst = instance_create_depth(x+cos(dir)*16,y+sin(dir)*16,0,obj_bullet_slug);
	inst.direction = -dir/pi*180;
	inst.target = argument1;
	bullet_charge = bullet_time;


}
