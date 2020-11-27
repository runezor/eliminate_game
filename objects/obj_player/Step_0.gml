/// @description Insert description here
// You can write your code in this editor
event_inherited();

var xdir = 0;
var ydir = 0;
var spd = 6;

if (keyboard_check(ord("W"))){
	ydir = -1;
}
if (keyboard_check(ord("A"))){
	xdir = -1;
}
if (keyboard_check(ord("S"))){
	ydir = 1;
}
if (keyboard_check(ord("D"))){
	xdir = 1;
}

if (xdir!=0 || ydir!=0){
	xdir = xdir / (xdir*xdir+ydir*ydir);
	ydir = ydir / (xdir*xdir+ydir*ydir);
}


//x coordinate
newX = x + xdir*spd;
inst = collision_circle(newX, y, 15, obj_wall, false, false);
if inst == noone
	x = newX;
else
{		
	for (i = 0; i < spd; i += 1)
	{
		if (collision_circle(x+xdir, y, 15, obj_wall, false, false)==noone)
			x = x + xdir;
	}
}


newY = y + ydir*spd;
inst = collision_circle(x, newY, 15, obj_wall, false, false);
if inst == noone
	y = newY;
else
{
	for (i = 0; i < spd; i += 1)
	{
		if (collision_circle(x, y+ydir, 15, obj_wall, false, false)==noone)
			y = y + ydir;
	}
}

// Bullet
dir = -point_direction(x, y, mouse_x, mouse_y)/180*pi;

if (mouse_check_button(mb_left)){
	if (bullet_charge==0){
		script_shoot_bullet_slug(dir, targetType.enemy);
		bullet_charge = bullet_time;
	}
}

if (bullet_charge>0){
	bullet_charge = bullet_charge - 1;
}