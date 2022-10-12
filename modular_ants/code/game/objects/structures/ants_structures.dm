/obj/effect/mob_spawn/ant_egg
	name = "ant egg"
	desc = "An ant-sized yellow egg, spawned from some unfathomable creature. A larva lurks inside."
	mob_name = "an ant larva"
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "large_egg"
	mob_type = /mob/living/carbon/alien/larva/ant_larva
	death = FALSE
	anchored = FALSE
	move_resist = MOVE_FORCE_NORMAL
	density = FALSE
	death_cooldown = 300 SECONDS
	important_info = "Do not leave Lavaland without admin permission. Do not attack the mining outpost without being provoked."
	description = "You are an ashwalker, a native inhabitant of Lavaland. Try to survive with nothing but spears and other tribal technology. Bring dead bodies back to your tendril to create more of your kind. You are free to attack miners and other outsiders."
	flavour_text = "Your tribe worships the Necropolis. The wastes are sacred ground, its monsters a blessed bounty. \
	You have seen lights in the distance... they foreshadow the arrival of outsiders that seek to tear apart the Necropolis and its domain. Fresh sacrifices for your nest."

/obj/effect/mob_spawn/ant_egg/special(mob/living/carbon/alien/larva/ant_larva/new_spawn)

	to_chat(new_spawn, "<b>Drag the corpses of men and beasts to your nest. It will absorb them to create more of your kind. Glory to the Necropolis!</b>")
	to_chat(new_spawn, "<span class='motd'>For more information, check the wiki page: ([GLOB.configuration.url.wiki_url]/index.php/Ash_Walker)</span>")

/obj/effect/mob_spawn/ant_egg/New()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("An ash walker egg is ready to hatch in \the [A.name].", source = src, action = NOTIFY_ATTACK, flashwindow = FALSE)
