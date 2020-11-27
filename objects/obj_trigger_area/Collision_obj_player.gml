/// @description Insert description here
// You can write your code in this editor
if (trigger_id!=undefined){
	var trig_id = trigger_id;

	with(obj_enemy){
		if (trigger_id!=undefined && trigger_id==trig_id){
			agitated = true;
		}
	}
	
	instance_destroy();
}