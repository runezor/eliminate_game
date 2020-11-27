/// @description Insert description here
// You can write your code in this editor
for(var i=0; i<4; i++){
	var shield_target = instance_id;
	var shield_position = 90*i;
	var shield = instance_create_depth(x,y,obj_shield_hover,0);
	with(shield){
		target = shield_target;
		position = shield_position;
	}
}