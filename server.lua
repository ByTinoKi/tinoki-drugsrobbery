ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local robberyAvailable = false
local timerRobbery = Config.RobberyCooldown*60000

ESX.RegisterServerCallback('xtc:getRobbery', function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	if robberyAvailable then 
		cb(false)
		xPlayer.showNotification(Config.Notification4)
	elseif not robberyAvailable then 
		local xPlayers = ESX.GetPlayers()

		totalPolice = 0

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' then
				totalPolice = totalPolice + 1
			end
		end
		
		if totalPolice >= Config.MinPolice then 
			cb(true)
			robberyAvailable = true
		else 
			cb(false)
			xPlayer.showNotification(Config.Notification7)
		end 
	end 
end)

RegisterServerEvent('xtc:startRobbery')
AddEventHandler('xtc:startRobbery', function(stats)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	
	TriggerClientEvent("xtc:startRobbery", src, stats)
end) 

RegisterServerEvent('xtc:finishRobbery')
AddEventHandler('xtc:finishRobbery', function(ItemRewardName, RandomItemReward, MinItemRewardAmount, MaxItemRewardAmount, ItemRewardAmount)
	local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
	
	if RandomItemReward then 
		totalRandom = math.Random(MinItemRewardAmount, MaxItemRewardAmount)
		xPlayer.addInventoryItem(ItemRewardName, totalRandom)
	else 
		xPlayer.addInventoryItem(ItemRewardName, ItemRewardAmount)
	end 
	xPlayer.showNotification(Config.Notification6)
end) 

local ItemDataName = Config.TargetRobbery.Location_1.ItemRewardName

ESX.RegisterUsableItem(ItemDataName, function(source)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local xItem1 = xPlayer.getInventoryItem(ItemDataName).count 
	local xItem2 = xPlayer.getInventoryItem(Config.ZipBagsName).count 
	
	if xItem1 >= Config.ItemPerPack then 
		if xItem2 >= Config.ZipBagsCount then 
			xPlayer.removeInventoryItem(ItemDataName, Config.ItemPerPack)
			xPlayer.removeInventoryItem(Config.ZipBagsName, Config.ZipBagsCount)
			xPlayer.addInventoryItem(Config.FinalItemName, Config.FinalItemCount)
		else 
			xPlayer.showNotification(Config.Notification8..""..Config.ZipBagsName)
		end 
	else 
		xPlayer.showNotification(Config.Notification8..""..ItemDataName)
	end 
end)

Citizen.CreateThread(function()
	while true do 
		if robberyAvailable then 
			timerRobbery = timerRobbery - 1
			if timerRobbery < 1 then 
				timerRobbery = Config.RobberyCooldown*60000
				robberyAvailable = false 
			end 
		end
		Citizen.Wait(1000)
	end 
end)

