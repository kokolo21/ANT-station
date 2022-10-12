/mob/living/carbon/alien/larva/ant_larva/evolve()
	set name = "Evolve"
	set desc = "Evolve into a fully grown Ant."
	set category = "Alien"

	if(stat != CONSCIOUS)
		return

	if(handcuffed || legcuffed)
		to_chat(src, "<span class='warning'>You cannot evolve when you are cuffed.</span>")

	if(amount_grown >= max_grown)	//TODO ~Carn
		//green is impossible to read, so i made these blue and changed the formatting slightly
		to_chat(src, "<span class='boldnotice'>You are growing into a beautiful ant! It is time to choose a caste.</span>")
		to_chat(src, "<span class='notice'>There are three to choose from:</span>")
		to_chat(src, "<B>Hunters</B> <span class='notice'>are strong and agile, able to hunt away from the hive and rapidly move through ventilation shafts. Hunters generate plasma slowly and have low reserves.</span>")
		to_chat(src, "<B>Sentinels</B> <span class='notice'>are tasked with protecting the hive and are deadly up close and at a range. They are not as physically imposing nor fast as the hunters.</span>")
		to_chat(src, "<B>Drones</B> <span class='notice'>are the working class, offering the largest plasma storage and generation. They are the only caste which may evolve again, turning into the dreaded alien queen.</span>")
		var/alien_caste = alert(src, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")

		var/mob/living/carbon/alien/humanoid/new_ant
		switch(alien_caste)
			if("Hunter")
				new_ant = new /mob/living/carbon/alien/humanoid/hunter(loc)
			if("Sentinel")
				new_ant = new /mob/living/carbon/alien/humanoid/sentinel(loc)
			if("Drone")
				new_ant = new /mob/living/carbon/alien/humanoid/ant/drone(loc)
		if(mind)
			mind.transfer_to(new_ant)
		else
			new_ant.key = key
		new_ant.mind.name = new_ant.name
		qdel(src)
		return
	else
		to_chat(src, "<span class='warning'>You are not fully grown.</span>")
		return
