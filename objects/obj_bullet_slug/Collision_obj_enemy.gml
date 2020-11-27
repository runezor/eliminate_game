/// @description Insert description here
// You can write your code in this editor
if (target==targetType.enemy){
	other.Health = other.Health - 20;
	other.push_force=10;
	other.push_dir=direction;
	instance_destroy();
}