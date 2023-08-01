/datum/equipment_preset/rmc
	name = "RMC"
	faction = FACTION_TWE
	rank = FACTION_TWE
	idtype = /obj/item/card/id/rmc
	faction_group = FACTION_LIST_MARINE_TWE
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	var/human_versus_human = FALSE
	var/headset_type = /obj/item/device/radio/headset/distress/rmc

/datum/equipment_preset/rmc/New()
	. = ..()
	access = get_weyland_pmc_access()


/datum/equipment_preset/rmc/load_name(mob/living/carbon/human/new_human, randomise)
	// PLACEHOLDER PLEASE REPLACE
	new_human.gender = pick(MALE,FEMALE)
	var/random_name
	var/first_name
	var/last_name
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	if(new_human.gender == MALE)
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_male_rmc)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_female_rmc)]"
	if(prob(25))
		last_name = "[capitalize(randomly_generate_japanese_word(rand(2, 4)))]"
	else
		last_name = "[pick(last_names_rmc)]"
	random_name = "[first_name] [last_name]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(25,35)
	new_human.h_style = "Shaved Head"
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/rmc/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_RMC
	return ..()


//*****************************************************************************************************/
/datum/equipment_preset/rmc/rmc_standard
	name = "Three World Empire RMC (Standard)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_TWE_COMMANDO
	rank = JOB_TWE_COMMANDO
	paygrade = "TC1"
	skills = /datum/skills/pmc // PLACEHOLDER PLEASE REPLACE

/datum/equipment_preset/rmc/rmc_standard/load_gear(mob/living/carbon/human/new_human)

	var/choice = rand(1,5)
	new_human.equip_to_slot_or_del(new headset_type, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/rmc, WEAR_BODY)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/rmc, WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/rmc/light, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/rmc, WEAR_HANDS)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/rmc/beret, WEAR_HEAD)
	else
		if(prob(50))
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/rmc/helmet, WEAR_HEAD)
		else
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/rmc/helmet/variant, WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/veteran/rmc/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/rmc, WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest, WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/splint, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/extinguisher/mini, WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/lightpack, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/rmc, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/baton, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/mod88, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full, WEAR_R_STORE)

	switch(choice)
		if(1,2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39/elite, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/rmc_m39, WEAR_L_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/ap, WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/nsg23, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/nsg_ap, WEAR_L_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nsg23/extended, WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/nsg23/extended, WEAR_IN_BACK)
		if(4,5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41a/elite, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/rmc_rifle, WEAR_L_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ap, WEAR_IN_BACK)

/datum/equipment_preset/rmc/rmc_standard/get_antag_clothing_equipment()
	return list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Boots", 0, /obj/item/clothing/shoes/veteran/rmc/knife, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_MANDATORY),
		list("Fatigues", 0, /obj/item/clothing/under/marine/veteran/rmc, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Gloves", 0, /obj/item/clothing/gloves/marine/veteran/rmc, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_MANDATORY),
		list("Headset", 0, /obj/item/device/radio/headset/distress/rmc/hvh, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),
		list("MRE", 0,  /obj/item/storage/box/MRE, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Combat Pack", 0, /obj/item/storage/backpack/lightpack, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_MANDATORY),
		list("Armored Balaclava", 0, /obj/item/clothing/mask/gas/rmc, MARINE_CAN_BUY_MASK, VENDOR_ITEM_MANDATORY),
		list("Tactical Cap", 0, /obj/item/clothing/head/helmet/marine/veteran/rmc, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_MANDATORY),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Standard Armor", 0, /obj/item/clothing/suit/storage/marine/veteran/rmc, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_RECOMMENDED),
		list("Light Armor", 0, /obj/item/clothing/suit/storage/marine/veteran/rmc/light, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig (Full)", 0, /obj/item/storage/belt/knifepouch, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/large_holster/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M44 Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig (Empty)", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Explosive Pouch", 0, /obj/item/storage/pouch/explosive, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Bayonet Sheath (Full)", 0, /obj/item/storage/pouch/bayonet, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Small Document Pouch", 0, /obj/item/storage/pouch/document/small, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Magazine Pouch", 0, /obj/item/storage/pouch/magazine/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol/large, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("ATTACHMENT (CHOOSE 1)", 0, null, null, null),
		list("Angled Grip", 0, /obj/item/attachable/angledgrip, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Extended Barrel", 0, /obj/item/attachable/extended_barrel, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Laser Sight", 0, /obj/item/attachable/lasersight, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Red-Dot Sight", 0, /obj/item/attachable/reddot, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Reflex Sight", 0, /obj/item/attachable/reflex, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Suppressor", 0, /obj/item/attachable/suppressor, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
		list("Vertical Grip", 0, /obj/item/attachable/verticalgrip, MARINE_CAN_BUY_ATTACHMENT, VENDOR_ITEM_REGULAR),
	)

/datum/equipment_preset/rmc/rmc_standard/get_antag_gear_equipment()
	return list(
		list("ENGINEERING SUPPLIES", 0, null, null, null),
		list("Entrenching Tool", 2, /obj/item/tool/shovel/etool, null, VENDOR_ITEM_RECOMMENDED),
		list("Sandbags x25", 5, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_RECOMMENDED),

		list("SPECIAL AMMUNITION", 0, null, null, null), //rmcs can get TWO HEAP magazines, maximum.
		list("M41A HEAP magazine (10x24mm)", 20, /obj/item/ammo_magazine/rifle/heap, null, VENDOR_ITEM_REGULAR),
		list("M39 HEAP magazine (10x20mm)", 20, /obj/item/ammo_magazine/smg/m39/heap, null, VENDOR_ITEM_REGULAR),
		list("NSG23 HEAP magazine (10x24mm)", 20, /obj/item/ammo_magazine/rifle/nsg23/heap, null, VENDOR_ITEM_REGULAR),

		list("ATTACHMENTS", 0, null, null, null),
		list("Angled Grip", 10, /obj/item/attachable/angledgrip, null, VENDOR_ITEM_REGULAR),
		list("Extended Barrel", 10, /obj/item/attachable/extended_barrel, null, VENDOR_ITEM_REGULAR),
		list("Laser Sight", 10, /obj/item/attachable/lasersight, null, VENDOR_ITEM_REGULAR),
		list("Red-Dot Sight", 10, /obj/item/attachable/reddot, null, VENDOR_ITEM_REGULAR),
		list("Reflex Sight", 10, /obj/item/attachable/reflex, null, VENDOR_ITEM_REGULAR),
		list("Suppressor", 10, /obj/item/attachable/suppressor, null, VENDOR_ITEM_REGULAR),
		list("Vertical Grip", 10, /obj/item/attachable/verticalgrip, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("Smoke Grenade", 5, /obj/item/explosive/grenade/smokebomb, null, VENDOR_ITEM_REGULAR),
		list("M12 Blast Grenade", 15, /obj/item/explosive/grenade/high_explosive/rmc, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("Brown Webbing Vest", 10, /obj/item/clothing/accessory/storage/black_vest/brown_vest, null, VENDOR_ITEM_RECOMMENDED),
		list("Black Webbing Vest", 10, /obj/item/clothing/accessory/storage/black_vest, null, VENDOR_ITEM_RECOMMENDED),
		list("Entrenching Tool", 2, /obj/item/tool/shovel/etool, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 10, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 10, /obj/item/clothing/accessory/storage/holster, null, VENDOR_ITEM_REGULAR),
		list("Webbing", 10, /obj/item/clothing/accessory/storage/webbing, null, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 10, /obj/item/clothing/accessory/storage/droppouch, null, VENDOR_ITEM_REGULAR),
	)
