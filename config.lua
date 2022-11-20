Config = {}

Config.MinPolice = 1 -- Minimal Police to Start the Robbery
Config.RobberyCooldown = 60 -- Cooldown timer for Robbery Reset (in Minute)
Config.EntityCooldown = 15 -- Cooldown timer to Remove the NPC and Vehicle after The Player rob the vehicle. (in Minute)

Config.ShowBlipStartRobbery = true  -- Set to True to Set the Blip on the Map | False to Hide the Blip
Config.BlipDetails = {title = "Drugs Robbery", colour = 2, id = 51} -- Blip Name - Blip Color - Blip ID (https://wiki.gtanet.work/index.php?title=Blips)

Config.StartRobbery = {x = 13.07706451416, y = -1835.8533935547, z = 24.701089859009} -- Coordinate to Start the Robbery

Config.UseStartRobberyNPC = true -- True to Add NPC on the Start Robbery Location | False without the NPC
Config.StartRobberyNPC = {x = 13.819369316101, y = -1835.7052001953, z = 24.69842338562, heading = 100.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2} -- Coordinate of the Ped on the Start Robbery Coordinate | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Name - Ped Hash (https://wiki.rage.mp/index.php?title=Peds) 

Config.ItemPerPack = 5 -- Ecstasy amount per Pack
Config.ZipBagsName = "water" -- Zip Bags Item Spawn Name 
Config.ZipBagsCount = 1 -- Zip Bags amount to Pack the Ecstasy
Config.FinalItemName = "xtc_packed" -- Packed Ecstasy Item Spawn Name 
Config.FinalItemCount = 1 -- How many pack do you get after Packing the Ecstasy

Config.TargetRobbery = {

	Location_1 = { -- Leave this Line Unchanged
		Vehicle_Data = {x = 1096.2995605469, y = -2447.3166503906, z = 30.229444503784, heading = 171.0, vehicle = "rumpo"}, -- Coordinate of the Vehicle | Coordinate X - Coordinate Y - Coordinate Z - Vehicle Heading - Vehicle Spawn Name
		NPC_1_Data = {x = 1098.52734375, y = -2447.6843261719, z = 30.320808410645, heading = 249.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_2_Data = {x = 1095.8189697266, y = -2450.2319335938, z = 30.216596603394, heading = 170.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_3_Data = {x = 1094.7779541016, y = -2446.6977539063, z = 30.099571228027, heading = 86.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		
		RobCarDuration = 5000, -- Rob Car Duration
		ItemRewardName = "item_xtc", -- Rob Car Item Reward (The Ecstasy Item Spawn Name)
		RandomItemReward = false, -- Set True to Randomize the Total Ecstasy you get from the Rob Car Progress following by MinItemRewardAmount and MaxItemRewardAmount| False to set to certain amount on ItemRewardAmount
		MinItemRewardAmount = 1, -- Minimal Ecstasy amount for the Random amount
		MaxItemRewardAmount = 3, -- Maximal Ecstasy amount for the Random amount
		ItemRewardAmount = 1, -- Total Ecstasy you get from the Rob Car Progress if RandomItemReward set to False
	},
	Location_2 = { -- Leave this Line Unchanged
		Vehicle_Data = {x = 1096.2995605469, y = -2447.3166503906, z = 30.229444503784, heading = 171.0, vehicle = "rumpo"}, -- Coordinate of the Vehicle | Coordinate X - Coordinate Y - Coordinate Z - Vehicle Heading - Vehicle Spawn Name
		NPC_1_Data = {x = 1098.52734375, y = -2447.6843261719, z = 30.320808410645, heading = 249.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_2_Data = {x = 1095.8189697266, y = -2450.2319335938, z = 30.216596603394, heading = 170.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_3_Data = {x = 1094.7779541016, y = -2446.6977539063, z = 30.099571228027, heading = 86.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		
		RobCarDuration = 5000, -- Rob Car Duration 
		ItemRewardName = "item_xtc", -- Rob Car Item Reward (The Ecstasy Item Spawn Name) 
		RandomItemReward = false, -- Set True to Randomize the Total Ecstasy you get from the Rob Car Progress following by MinItemRewardAmount and MaxItemRewardAmount| False to set to certain amount on ItemRewardAmount 
		MinItemRewardAmount = 1, -- Minimal Ecstasy amount for the Random amount
		MaxItemRewardAmount = 3, -- Maximal Ecstasy amount for the Random amount
		ItemRewardAmount = 1, -- Total Ecstasy you get from the Rob Car Progress if RandomItemReward set to False
	},
	Location_3 = { -- Leave this Line Unchanged
		Vehicle_Data = {x = 1096.2995605469, y = -2447.3166503906, z = 30.229444503784, heading = 171.0, vehicle = "rumpo"}, -- Coordinate of the Vehicle | Coordinate X - Coordinate Y - Coordinate Z - Vehicle Heading - Vehicle Spawn Name
		NPC_1_Data = {x = 1098.52734375, y = -2447.6843261719, z = 30.320808410645, heading = 249.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_2_Data = {x = 1095.8189697266, y = -2450.2319335938, z = 30.216596603394, heading = 170.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		NPC_3_Data = {x = 1094.7779541016, y = -2446.6977539063, z = 30.099571228027, heading = 86.0, weapon = "WEAPON_PISTOL", health = 200.0, PedName = "u_m_m_aldinapoli", PedHash = 0xF0EC56E2}, -- Coordinate of the Ped 1 | Coordinate X - Coordinate Y - Coordinate Z - Ped Heading - Ped Weapon Spawn Name - Ped Health - Ped Hash
		
		RobCarDuration = 5000, -- Rob Car Duration 
		ItemRewardName = "item_xtc", -- Rob Car Item Reward (The Ecstasy Item Spawn Name) 
		RandomItemReward = false, -- Set True to Randomize the Total Ecstasy you get from the Rob Car Progress following by MinItemRewardAmount and MaxItemRewardAmount| False to set to certain amount on ItemRewardAmount 
		MinItemRewardAmount = 1, -- Minimal Ecstasy amount for the Random amount
		MaxItemRewardAmount = 3, -- Maximal Ecstasy amount for the Random amount
		ItemRewardAmount = 1, -- Total Ecstasy you get from the Rob Car Progress if RandomItemReward set to False 
	},
}

-- Notification
Config.Notification1 = "Press E to get the target location."
Config.Notification2 = "You already start the Progress, go to the Target Location."
Config.Notification3 = "Go to the Target Location to get the Ecstasy."
Config.Notification4 = "I do not have any Target, someone already did the job."
Config.Notification5 = "Press E to Hijack the Vehicle."
Config.Notification6 = "Robbery Success!"
Config.Notification7 = "Not enough Police to start the Robbery!"
Config.Notification8 = "You do not have enough ~y~"