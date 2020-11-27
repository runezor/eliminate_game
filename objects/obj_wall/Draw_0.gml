/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
if (drawLeft)
	draw_line(x, y, x, y+32);
if (drawRight)
	draw_line(x+32, y, x+32, y+32);
if (drawTop)
	draw_line(x, y, x+32, y);
if (drawBottom)
	draw_line(x, y+32, x+32, y+32);