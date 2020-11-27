function script_collision_ray(argument0, argument1, argument2, argument3, argument4, argument5) {
	xpos = argument0
	ypos = argument1
	targetx = argument2
	targety = argument3
	r = argument4
	targetr = argument5

	dir = point_direction(xpos, ypos, targetx,targety);

	collision = false;

	dir1 = (dir+90)/180*pi;
	collision = collision || (collision_line(xpos+cos(dir1)*r, ypos-sin(dir1)*r, targetx+cos(dir1)*targetr, targety-sin(dir1)*targetr, obj_wall, false, true)!=noone);
	dir2 = (dir-90)/180*pi;
	collision = collision || (collision_line(xpos+cos(dir2)*r, ypos-sin(dir2)*r, targetx+cos(dir2)*targetr, targety-sin(dir2)*targetr, obj_wall, false, true)!=noone);

	return collision;


}
