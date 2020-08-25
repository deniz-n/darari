ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('Darariririri')
AddEventHandler('Darariririri', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(PlayerPedId())
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

--Citizen.CreateThread(function()
--	while true do
--		local sleep = 2000
--		local playerPed = PlayerPedId()
--		local cars = GetVehiclePedIsIn(playerPed, false)
--		local CurrentVehicle = GetVehiclePedIsUsing(playerPed)
--        local model = GetEntityModel(CurrentVehicle)
--        local modelName = GetDisplayNameFromVehicleModel(model)
--		for i = 1, #Config.WhitelistCars, 1 do
--			local xdxd = Config.WhitelistCars[i]
--			if IsPedInAnyVehicle(playerPed, true) then
--				if modelName == xdxd and cars then
--					print("wl car")
--					sleep = 5
--					if IsControlJustPressed(0, 303) then
--						print("u basıldı")
--						TriggerServerEvent("VerkocumDarari", Config.maxDistance, "arapkorna",Config.Volume)
--					end
--				end
--			end
--		end
--	Citizen.Wait(sleep)
--	end
--end)

function isWhitelisted(car)
    for i=1, #Config.WhitelistedCars,1 do
        if Config.WhitelistedCars[i] == car then
            return true
        end
    end
        return false
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while true do
		local playerPed = PlayerPedId()
		local veh = GetVehiclePedIsIn(playerPed)
		local props = ESX.Game.GetVehicleProperties(veh)
			if IsControlJustPressed(0, 303) then
				print("Pressed")
				if isWhitelisted(string.lower(GetDisplayNameFromVehicleModel(props.model))) then
					print("Whitelisted")
					TriggerServerEvent("VerkocumDarari", Config.maxDistance, "arapkorna", Config.Volume)
				else
					exports['mythic_notify']:SendAlert('error', 'Bu araçta havalı korna yok.', 4500)
				end
			end
		Citizen.Wait(5)
	end
end)