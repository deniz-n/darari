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
		local sleep = 2500
		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
				if isWhitelisted(string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))) then
					sleep = 5
					if IsControlJustPressed(0, 303) then
						print("Pressed")
						TriggerServerEvent("VerkocumDarari", Config.maxDistance, "arapkorna", Config.Volume)
					end
				end
		Citizen.Wait(sleep)
	end
end)
