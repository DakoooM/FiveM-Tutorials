SetEntityHeading(entity, heading)
SetEntityHealth(entity, heading)
SetEntityVisible(entity, toggle, unk)

IsPedJumping(ped)
IsPedRunning(ped)
IsPedArmed(ped, 1)

IsControlJustPressed()

ESX = nil
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(5)
    end
end)

CreateThread(function()
    local PlayerPed = PlayerPedId()
    while true do
        Wait(1)
        if IsPedJumping(PlayerPed) then
            ESX.ShowNotification("Le joueur saute")
            print("player jumping")
        elseif IsPedRunning(PlayerPed) then
            ESX.ShowNotification("Le joueur court")
            print("player running")
        elseif IsPedArmed(PlayerPed, 4) then
            ESX.ShowNotification("Le joueur est armée")
            print("player armed")
        end
    end
end)