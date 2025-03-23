-- Window Down/Up
RegisterCommand("wind", function(source,args)
    local window = args[1]
    if not args[1] then
        TriggerClientEvent("SeatDAWA",source)
    else
        TriggerClientEvent("CarWindowS",-1,source,window)
    end
end,false)

------------------------------------------------------------------------------
local GetPlayerPed = GetPlayerPed
local GetVehiclePedIsIn = GetVehiclePedIsIn
------------------------------------------------------------------------------
RegisterNetEvent('windowscript:sync')
AddEventHandler('windowscript:sync',function(window)
    local src = source
    local pPed = GetPlayerPed(src)
    local pVehicle = GetVehiclePedIsIn(pPed,false)
    if pVehicle ~= 0 then
        TriggerClientEvent("CarWindowS",-1,src,window)
    end
end)