ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("dakom:acheter")
AddEventHandler("dakom:acheter", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local aretirer = 100
    xPlayer.removeMoney(aretirer)
end)

RegisterNetEvent("dakom:donner")
AddEventHandler("dakom:donner", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local adonner = 500
    xPlayer.addMoney(adonner)
end)