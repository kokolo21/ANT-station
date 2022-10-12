/mob/living/carbon/alien/humanoid/ant/update_icons()
	overlays.Cut()
	for(var/image/I in overlays_standing)
		overlays += I

	if(stat == DEAD)
		//If we mostly took damage from fire
		if(getFireLoss() > 125)
			icon_state = "ant[caste]_husked"
			pixel_y = 0
		else
			icon_state = "ant[caste]_dead"
			pixel_y = 0

	else if(stat == UNCONSCIOUS || IsWeakened())
		icon_state = "ant[caste]_unconscious"
		pixel_y = 0
	else if(leap_on_click)
		icon_state = "ant[caste]_pounce"

	else if(IS_HORIZONTAL(src))
		icon_state = "ant[caste]_sleep"
	else if(m_intent == MOVE_INTENT_RUN)
		icon_state = "ant[caste]_running"
	else
		icon_state = "ant[caste]_s"

	if(leaping)
		if(alt_icon == initial(alt_icon))
			var/old_icon = icon
			icon = alt_icon
			alt_icon = old_icon
		icon_state = "ant[caste]_leap"
		pixel_x = -32
		pixel_y = -32
	else
		if(alt_icon != initial(alt_icon))
			var/old_icon = icon
			icon = alt_icon
			alt_icon = old_icon
		pixel_x = get_standard_pixel_x_offset()
		pixel_y = get_standard_pixel_y_offset()