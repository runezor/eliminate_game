/// @description Insert description here
// You can write your code in this editor
other.Health = other.Health - damage;
instance_create_depth(x,y,0,anim_enemy_bouncer_death);
instance_destroy();