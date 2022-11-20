local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerData.job = job
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

local robberyInProgress = false 
local robberyAvailable
local xtc_data
local SpawnedCar
local TargetNPC_1, TargetNPC_2, TargetNPC_3
local RobberyCoords = {x = 0.0, y = 0.0, z = 0.0}

Citizen.CreateThread(function()
	if Config.ShowBlipStartRobbery then 
		blip = AddBlipForCoord(Config.StartRobbery.x, Config.StartRobbery.y, Config.StartRobbery.z)
		SetBlipSprite(blip, Config.BlipDetails.id)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, Config.BlipDetails.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.BlipDetails.title)
		EndTextCommandSetBlipName(blip)
	end
	
	if Config.UseStartRobberyNPC then 
		RequestModel(GetHashKey(Config.StartRobberyNPC.PedName))
		while not HasModelLoaded(GetHashKey(Config.StartRobberyNPC.PedName)) do
			Wait(1)
		end
		StartRobberyNPC =  CreatePed(4, Config.StartRobberyNPC.PedHash, Config.StartRobberyNPC.x, Config.StartRobberyNPC.y, Config.StartRobberyNPC.z - 1, 3374176, false, true)
		SetEntityHeading(StartRobberyNPC, Config.StartRobberyNPC.heading)
		FreezeEntityPosition(StartRobberyNPC, true)
		SetEntityInvincible(StartRobberyNPC, true)
		SetBlockingOfNonTemporaryEvents(StartRobberyNPC, true)
	end 
	
	while true do
		local waitThread1 = 1000
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		
		local dist1 = GetDistanceBetweenCoords(coords, Config.StartRobbery.x, Config.StartRobbery.y, Config.StartRobbery.z, true)
		
		if dist1 < 2.0 then 
			waitThread1 = 1 
			ESX.ShowHelpNotification(Config.Notification1)
			DrawMarker(1, Config.StartRobbery.x, Config.StartRobbery.y, Config.StartRobbery.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
			if IsControlJustReleased(0, Keys['E']) then
				if not robberyInProgress then
					ESX.TriggerServerCallback('xtc:getRobbery', function(robberyAvailable)
						if robberyAvailable then 
							local randomNumber = math.random(1, 3)
							if randomNumber == 1 then 
								ESX.ShowNotification(Config.Notification3)
								TriggerServerEvent("xtc:startRobbery", 1)
							elseif randomNumber == 2 then 
								ESX.ShowNotification(Config.Notification3)
								TriggerServerEvent("xtc:startRobbery", 2)
							elseif randomNumber == 3 then 
								ESX.ShowNotification(Config.Notification3)
								TriggerServerEvent("xtc:startRobbery", 3)
							end
							robberyInProgress = true 
						end 
					end)
				else 
					ESX.ShowNotification(Config.Notification2)
				end 
			end 
		end 
		
		if robberyInProgress then 
			waitThread1 = 1 
			local dist2 = GetDistanceBetweenCoords(coords, RobberyCoords.x, RobberyCoords.y, RobberyCoords.z, true)
			
			if dist2 < 50.0 then 
				TaskCombatPed(TargetNPC_1, PlayerPedId(), 0, 16)
				TaskCombatPed(TargetNPC_2, PlayerPedId(), 0, 16)
				TaskCombatPed(TargetNPC_3, PlayerPedId(), 0, 16)
				if dist2 < 3.0 then 
					ESX.ShowHelpNotification(Config.Notification5)
					DrawMarker(1, RobberyCoords.x, RobberyCoords.y, RobberyCoords.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 4.0, 4.0, 0.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
					if IsControlJustReleased(0, Keys['E']) then
						TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_WELDING', 0, true)
						Citizen.Wait(xtc_data.RobCarDuration)
						ClearPedTasksImmediately(PlayerPedId())
						robberyInProgress = false 
						RemoveBlip(blip)
						TriggerServerEvent("xtc:finishRobbery", xtc_data.ItemRewardName, xtc_data.RandomItemReward, xtc_data.MinItemRewardAmount, xtc_data.MaxItemRewardAmount, xtc_data.ItemRewardAmount)
						Citizen.Wait(Config.EntityCooldown*60000)
						DeleteEntity(SpawnedCar)
						DeleteEntity(TargetNPC_1)
						DeleteEntity(TargetNPC_2)
						DeleteEntity(TargetNPC_3)
					end
				end
			end
		end 
		Citizen.Wait(waitThread1) 
	end 
end) 

RegisterNetEvent('xtc:startRobbery')
AddEventHandler('xtc:startRobbery', function(stats)
	if stats == 1 then 
		xtc_data = Config.TargetRobbery.Location_1
	elseif stats == 2 then 
		xtc_data = Config.TargetRobbery.Location_2
	elseif stats == 3 then 
		xtc_data = Config.TargetRobbery.Location_3
	end 
	
	blip = AddBlipForCoord(xtc_data.Vehicle_Data.x, xtc_data.Vehicle_Data.y, xtc_data.Vehicle_Data.z)
	SetBlipSprite  (blip, 225)
	SetBlipDisplay (blip, 4)
	SetBlipScale   (blip, 1.0)
	SetBlipCategory(blip, 3)
	SetBlipColour  (blip, 1)
	SetBlipFlashTimer(blip, 3000)
	SetBlipFlashes(blip, true)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Target")
	EndTextCommandSetBlipName(blip)
	SetBlipRoute(blip , true)
	
	RequestModel(GetHashKey(xtc_data.NPC_1_Data.PedName))
	while not HasModelLoaded(GetHashKey(xtc_data.NPC_1_Data.PedName)) do
		Wait(1)
	end
	RequestModel(GetHashKey(xtc_data.NPC_2_Data.PedName))
	while not HasModelLoaded(GetHashKey(xtc_data.NPC_2_Data.PedName)) do
		Wait(1)
	end
	RequestModel(GetHashKey(xtc_data.NPC_3_Data.PedName))
	while not HasModelLoaded(GetHashKey(xtc_data.NPC_3_Data.PedName)) do
		Wait(1)
	end
	
	TargetNPC_1 =  CreatePed(4, xtc_data.NPC_1_Data.PedHash, xtc_data.NPC_1_Data.x, xtc_data.NPC_1_Data.y, xtc_data.NPC_1_Data.z - 1, 3374176, false, true)
	SetEntityHeading(TargetNPC_1, xtc_data.NPC_1_Data.heading)
	SetBlockingOfNonTemporaryEvents(TargetNPC_1, true)
	GiveWeaponToPed(TargetNPC_1, xtc_data.NPC_1_Data.weapon, 100 , false , false)
	SetCurrentPedWeapon(TargetNPC_1, xtc_data.NPC_1_Data.weapon,true)
	SetEntityHealth(TargetNPC_1, xtc_data.NPC_1_Data.health)
	SetPedRelationshipGroupHash(TargetNPC_1, GetHashKey("HATES_PLAYER"))
	
	TargetNPC_2 =  CreatePed(4, xtc_data.NPC_2_Data.PedHash, xtc_data.NPC_2_Data.x, xtc_data.NPC_2_Data.y, xtc_data.NPC_2_Data.z - 1, 3374176, false, true)
	SetEntityHeading(TargetNPC_2, xtc_data.NPC_2_Data.heading)
	SetBlockingOfNonTemporaryEvents(TargetNPC_2, true)
	GiveWeaponToPed(TargetNPC_2, xtc_data.NPC_2_Data.weapon, 100 , false , false)
	SetCurrentPedWeapon(TargetNPC_2, xtc_data.NPC_2_Data.weapon,true)
	SetEntityHealth(TargetNPC_2, xtc_data.NPC_2_Data.health)
	SetPedRelationshipGroupHash(TargetNPC_2, GetHashKey("HATES_PLAYER"))
	
	TargetNPC_3 =  CreatePed(4, xtc_data.NPC_3_Data.PedHash, xtc_data.NPC_3_Data.x, xtc_data.NPC_3_Data.y, xtc_data.NPC_3_Data.z - 1, 3374176, false, true)
	SetEntityHeading(TargetNPC_3, xtc_data.NPC_3_Data.heading)
	SetBlockingOfNonTemporaryEvents(TargetNPC_3, true)
	GiveWeaponToPed(TargetNPC_3, xtc_data.NPC_3_Data.weapon, 100 , false , false)
	SetCurrentPedWeapon(TargetNPC_3, xtc_data.NPC_3_Data.weapon,true)
	SetEntityHealth(TargetNPC_3, xtc_data.NPC_3_Data.health)
	SetPedRelationshipGroupHash(TargetNPC_3, GetHashKey("HATES_PLAYER"))
	
	CarHash = GetHashKey(xtc_data.Vehicle_Data.vehicle)
	RequestModel(CarHash)
	while not HasModelLoaded(CarHash) do
		Wait(0)
	end
	SpawnedCar = CreateVehicle(CarHash, xtc_data.Vehicle_Data.x, xtc_data.Vehicle_Data.y, xtc_data.Vehicle_Data.z, xtc_data.Vehicle_Data.heading, true, false)
	SetVehicleHasBeenOwnedByPlayer(SpawnedCar, true)
	SetVehicleOnGroundProperly(SpawnedCar)
	SetVehicleDoorsLocked(SpawnedCar, 2)
	Citizen.Wait(500)
	FreezeEntityPosition(SpawnedCar, true)
	RobberyCoords.x = xtc_data.Vehicle_Data.x
	RobberyCoords.y = xtc_data.Vehicle_Data.y
	RobberyCoords.z = xtc_data.Vehicle_Data.z - 1
end)
