/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_circle(x, y, 16, true);
draw_line(x-8,y-4,x+8,y-4);


dir = -point_direction(x,y,mouse_x,mouse_y)/180*pi;

w = pi/16;
len = 12;
//canon side 1
dirS1=dir+w;
draw_line(x+cos(dirS1)*16,y+sin(dirS1)*16,x+cos(dirS1)*16+cos(dir)*len,y+sin(dirS1)*16+sin(dir)*len);
//canon side 2
dirS2=dir-w;
draw_line(x+cos(dirS2)*16,y+sin(dirS2)*16,x+cos(dirS2)*16+cos(dir)*len,y+sin(dirS2)*16+sin(dir)*len);
//canon front
draw_line(x+cos(dirS1)*16+cos(dir)*len,y+sin(dirS1)*16+sin(dir)*len, x+cos(dirS2)*16+cos(dir)*len,y+sin(dirS2)*16+sin(dir)*len);