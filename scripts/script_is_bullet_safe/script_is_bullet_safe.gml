function script_is_bullet_safe(argument0, argument1, argument2) {
	global.bs_xpos = argument0
	global.bs_ypos = argument1
	global.bs_t = argument2

	global.bs_safe = true

	global.bs_r = 32

	with obj_bullet {
		if (target == targetType.enemy){
			dir = direction/180*pi;
			newPosx = x+cos(dir)*global.bs_t*speed;
			newPosy = y-sin(dir)*global.bs_t*speed;
			if ((global.bs_xpos-newPosx)*(global.bs_xpos-newPosx)+(global.bs_ypos-newPosy)*(global.bs_ypos-newPosy)<global.bs_r*global.bs_r){
				global.bs_safe = false;
			}
		}
	}

	return global.bs_safe;


}
