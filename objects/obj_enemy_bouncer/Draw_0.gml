/// @description Insert description here
// You can write your code in this editor
if (attacking)
	angle=pi*2/3+pi*1/9;
else
	angle=pi*2/3-pi*1/9;

draw_circle(x,y,16,1);
dir = direction/180*pi;
p1x = x+cos(dir)*16;
p1y = y-sin(dir)*16;

p2x = x+cos(dir+angle)*16;
p2y = y-sin(dir+angle)*16;

p3x = x+cos(dir-angle)*16;
p3y = y-sin(dir-angle)*16;

draw_line(p1x,p1y,p2x,p2y);
draw_line(p2x,p2y,x,y);
draw_line(p3x,p3y,x,y);
draw_line(p3x,p3y,p1x,p1y);

draw_set_color(c_white);