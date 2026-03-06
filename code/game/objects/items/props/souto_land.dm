//souto land props

/obj/structure/prop/souto_land
	name = "placeholder"
	desc = "Welcome to souto land! This prop shouldn't be used, so please gitlab this and notify a mapper!"
	icon = 'icons/obj/structures/souto_land.dmi'
	density = FALSE
	unacidable = TRUE
	unslashable = TRUE
	breakable = FALSE //can't destroy these
	flags_atom = NOINTERACT

/obj/structure/prop/souto_land/ex_act(severity, direction)
	return

/obj/structure/prop/souto_land/streamer
	name = "orange streamers"
	gender = PLURAL
	desc = "They flutter softly. Poignant."
	icon_state = "streamers"
	layer = ABOVE_MOB_LAYER

/obj/structure/prop/souto_land/pole
	name = "streamer pole"
	desc = "It connects streamer to streamer."
	icon_state = "post"
	layer = ABOVE_MOB_LAYER

/*
Isaacs Lament Props
*/

/obj/structure/prop/souto_land/streamer/curtain_metal
	desc = "It connects streamer to streamer."
	icon_state = "streamers_curtain_metal"

/obj/structure/prop/souto_land/streamer/curtain_wood
	desc = "It connects streamer to streamer."
	icon_state = "streamers_curtain_wood"

/obj/structure/prop/souto_land/streamer/colorable
	icon_state = "streamers_colorable"

/obj/structure/prop/souto_land/streamer/colored_alt
	icon_state = "streamers_colored"

/obj/structure/prop/souto_land/streamer/colored_alt
	icon_state = "streamers_colored_alt"

/obj/structure/prop/souto_land/pole/plain
	icon_state = "post_plain"

/obj/structure/prop/souto_land/pole/colorable
	icon_state = "post_colorable"

/obj/structure/prop/souto_land/pole/colored
	icon_state = "post_colored"

/obj/structure/prop/souto_land/pole/colored_alt
	icon_state = "post_colored_alt"
