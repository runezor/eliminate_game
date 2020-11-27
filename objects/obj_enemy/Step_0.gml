/// @description Insert description here
// You can write your code in this editor
if Health<=0
	instance_destroy();
	
if push_force>0{
	x=x+cos(push_dir/180*pi)*push_force/mass;
	y=y-sin(push_dir/180*pi)*push_force/mass;
	push_force = push_force-1;
}
else
{
	push_force = 0;
}

if (!instance_exists(obj_player)){
	agitated = false;
}