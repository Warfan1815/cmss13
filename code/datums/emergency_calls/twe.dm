//TWE RMC. Friendly to USCM, hostile to xenos.
/datum/emergency_call/RMC
	name = "TWE Royal Marine Commandos (Squad)"
	mob_max = 5
	probability = 5
	shuttle_id = "Distress_PMC" // PLACEHOLDER PLEASE REPLACE
	name_of_spawn = /obj/effect/landmark/ert_spawns/distress_pmc // PLACEHOLDER PLEASE REPLACE
	item_spawn = /obj/effect/landmark/ert_spawns/distress_pmc/item // PLACEHOLDER PLEASE REPLACE

	max_medics = 1
	max_heavies = 1
	var/max_pointmen = 1
	var/pointmen = 0


/datum/emergency_call/RMC/New()
	//PLACEHOLDER PLEASE REPLACE
	..()
	arrival_message = "[MAIN_SHIP_NAME], this is USCSS Royce responding to your distress call. We are boarding. Any hostile actions will be met with lethal force."
	objectives = "Secure the Corporate Liaison and the [MAIN_SHIP_NAME]'s Commanding Officer, and eliminate any hostile threats. Do not damage Wey-Yu property."


/datum/emergency_call/RMC/create_member(datum/mind/M, turf/override_spawn_loc)
	var/turf/spawn_loc = override_spawn_loc ? override_spawn_loc : get_spawn_point()

	if(!istype(spawn_loc))
		return //Didn't find a useable spawn point.

	var/mob/living/carbon/human/mob = new(spawn_loc)
	M.transfer_to(mob, TRUE)

	if(!leader && HAS_FLAG(mob.client.prefs.toggles_ert, PLAY_LEADER) && check_timelock(mob.client, JOB_SQUAD_LEADER, time_required_for_job))
		leader = mob
		to_chat(mob, SPAN_ROLE_HEADER("You are a Three World Empire RMC Squad Leader!"))
		arm_equipment(mob, /datum/equipment_preset/RMC/RMC_leader, TRUE, TRUE)
	else if(medics < max_medics && HAS_FLAG(mob.client.prefs.toggles_ert, PLAY_MEDIC) && check_timelock(mob.client, JOB_SQUAD_MEDIC, time_required_for_job))
		medics++
		to_chat(mob, SPAN_ROLE_HEADER("You are a Three World Empire RMC Medic!"))
		arm_equipment(mob, /datum/equipment_preset/RMC/RMC_medic, TRUE, TRUE)
	else if(heavies < max_heavies && HAS_FLAG(mob.client.prefs.toggles_ert, PLAY_HEAVY) && check_timelock(mob.client, JOB_SQUAD_SPECIALIST))
		heavies++
		to_chat(mob, SPAN_ROLE_HEADER("You are a Three World Empire RMC Sniper!"))
		arm_equipment(mob, /datum/equipment_preset/RMC/RMC_sniper, TRUE, TRUE)
	else if(pointmen < max_pointmen && HAS_FLAG(mob.client.prefs.toggles_ert, PLAY_HEAVY))
		pointmen++
		to_chat(mob, SPAN_ROLE_HEADER("You are a Three World Empire RMC Pointman!"))
		arm_equipment(mob, /datum/equipment_preset/RMC/RMC_pointman, TRUE, TRUE)
	else
		to_chat(mob, SPAN_ROLE_HEADER("You are a Three World Empire RMC Operator!"))
		arm_equipment(mob, /datum/equipment_preset/RMC/RMC_standard, TRUE, TRUE)

	print_backstory(mob)

	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(to_chat), mob, SPAN_BOLD("Objectives:</b> [objectives]")), 1 SECONDS)


/datum/emergency_call/RMC/print_backstory(mob/living/carbon/human/M)
	//PLACEHOLDER PLEASE REPLACE
	if(ishuman_strict(M))
		to_chat(M, SPAN_BOLD("You were born [pick(75;"in Europe", 15;"in Asia", 10;"on Mars")] to a [pick(75;"well-off", 15;"well-established", 10;"average")] family."))
		to_chat(M, SPAN_BOLD("Joining the ranks of Three World Empire has proven to be very profitable for you."))
		to_chat(M, SPAN_BOLD("While you are officially an employee, much of your work is off the books. You work as a skilled mercenary."))
		to_chat(M, SPAN_BOLD("You are [pick(50;"unaware of the xenomorph threat", 15;"acutely aware of the xenomorph threat", 10;"well-informed of the xenomorph threat")]"))
	else
		to_chat(M, SPAN_BOLD("You were brought online in a Three World Empire synthetic production facility, knowing only your engineers for the first few weeks for your pseudo-life."))
		to_chat(M, SPAN_BOLD("You were programmed with standard synthetic skills as per facility and geneva protocol."))
		to_chat(M, SPAN_BOLD("Throughout your service, you gained recognition as a capable unit and your model was given equipment upgrades which USCM models lack."))
		to_chat(M, SPAN_BOLD("You were given all available information about the xenomorph threat apart from classified data reserved for special employees."))
	to_chat(M, SPAN_BOLD("You are part of  Three World Empire Task Force Oberon that arrived in 2182 following the UA withdrawl of the Neroid Sector."))
	to_chat(M, SPAN_BOLD("Task-force Oberon is stationed aboard the USCSS Royce, a powerful Three World Empire cruiser that patrols the outer edges of the Neroid Sector. "))
	to_chat(M, SPAN_BOLD("Under the directive of Three World Empire board member Johan Almric, you act as private security for Three World Empire science teams."))
	to_chat(M, SPAN_BOLD("The USCSS Royce contains a crew of roughly two hundred RMCs, and one hundred scientists and support personnel."))
	to_chat(M, SPAN_BOLD("Ensure no damage is incurred against Three World Empire. Make sure the CL is safe."))
	to_chat(M, SPAN_BOLD("Deny Three World Empire's involvement and do not trust the UA/USCM forces."))
