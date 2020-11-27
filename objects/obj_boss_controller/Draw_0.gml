/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_font(fn_score_small);
draw_text(224,64-28,"Player");
draw_text(room_width-224,64-28,"AI");
draw_set_font(fn_score_big);
draw_text(224,64,player_score);
draw_text(room_width-224,64,enemy_score);

y_start = 64+152;
h = 32
w = 256;
draw_rectangle(224-w/2,y_start,224+w/2,y_start+h,1);
draw_rectangle(224-w/2,y_start,224-w/2+obj_player.Health/100*w,y_start+h,false);
draw_rectangle(room_width-224-w/2,y_start,room_width-224-w/2+obj_enemy_smart.Health/40*w,y_start+h,false);
draw_rectangle(room_width-224-w/2,y_start,room_width-224+w/2,y_start+h,1);