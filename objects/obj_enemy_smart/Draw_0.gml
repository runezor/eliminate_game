/// @description Insert description here
// You can write your code in this editor
draw_circle(x,y,16,true);

if (agitated=true){
	draw_line(x-8,y-6,x-4,y-2);
	draw_line(x+8,y-6,x+4,y-2);
	
	if (obj_enemy_AI.debug){
	xVal = x;
	yVal = y;
	for(var i=path_len; i>-1; i--){
		poss = path[i];
		draw_arrow(xVal, yVal, poss[0], poss[1], 8);
		xVal = poss[0];
		yVal = poss[1];
	}}
}
else
{
	draw_line(x-8,y-4,x-4,y-4);
	draw_line(x+8,y-4,x+4,y-4);
}