/// @description Insert description here
// You can write your code in this editor
if (attacking){
push_dir = point_direction(other.x,other.y,x,y);
push_force = bounce_force;
attacking = false;
speed = 0;
}