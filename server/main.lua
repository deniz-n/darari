ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('VerkocumDarari')
AddEventHandler('VerkocumDarari', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('Darariririri', -1, source, maxDistance, soundFile, soundVolume)
end)
