-- Script Made By Terry L
print("Script Made By : Terry L")
-- Car Window order:
-- Front right : 0
-- Front left : 1
-- Back Left : 2
-- Back Right : 3

------------------------------FUNCTIONS---------------------------------------
function ShowAboveRadarMessage(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end

RegisterNetEvent('showNotify')
AddEventHandler('showNotify', function(notify)
    ShowAboveRadarMessage(notify)
end)

------------------------------------------------------------------------------



------------------------------------------------------------------------------
local window0 = true
local window1 = true
local window2 = true
local window3 = true

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/wind', 'All, front, back, fr, fl, br, bl')
end)



-- Window Down
RegisterNetEvent("CarWindowS")
AddEventHandler("CarWindowS", function(sender, window)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(sender))
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
        if ( GetPedInVehicleSeat(playerCar, -1) == playerPed ) then
            if ( window == "fl" and window0 == true)  then
                RollDownWindow(playerCar, 0)
                window0 = false
            elseif ( window == "fl" and window0 == false) then
                RollUpWindow(playerCar, 0)
                window0 = true
            elseif ( window == "fr" and window1 == true) then
                RollDownWindow(playerCar, 1)
                window1 = false
            elseif ( window == "fr" and window1 == false) then
                RollUpWindow(playerCar, 1)
                window1 = true
            elseif ( window == "bl" and window2 == true) then
                RollDownWindow(playerCar, 2)
                window2 = false
            elseif ( window == "bl" and window2 == false) then
                RollUpWindow(playerCar, 2)
                window2 = true
            elseif ( window == "br" and window3 == true) then
                RollDownWindow(playerCar, 3)
                window3 = false
            elseif ( window == "br" and window3 == false) then
                RollUpWindow(playerCar, 3)
                window3 = true
            elseif ( window == "front" and (window0 and window1)== true) then
                RollDownWindow(playerCar, 0)
                RollDownWindow(playerCar, 1)
                window0 = false
                window1 = false
            elseif ( window == "front" and (window0 and window1) == false) then
                RollUpWindow(playerCar, 0)
                RollUpWindow(playerCar, 1)
                window0 = true
                window1 = true
            elseif ( window == "back" and (window2 and window3) == true) then
                RollDownWindow(playerCar, 2)
                RollDownWindow(playerCar, 3)
                window2 = false
                window3 = false
            elseif ( window == "back" and (window2 and window3) == false) then
                RollUpWindow(playerCar, 2)
                RollUpWindow(playerCar, 3)
                window2 = true
                window3 = true
            elseif ( window == "all" and ( window0 and window1 and window2 and window3 ) == true ) then
                RollDownWindow(playerCar, 0)
                RollDownWindow(playerCar, 1)
                RollDownWindow(playerCar, 2)
                RollDownWindow(playerCar, 3)
                window0 = false
                window1 = false
                window2 = false
                window3 = false
            elseif ( window == "all" and ( window0 and window1 and window2 and window3 ) == false ) then
                RollUpWindow(playerCar, 0)
                RollUpWindow(playerCar, 1)
                RollUpWindow(playerCar, 2)
                RollUpWindow(playerCar, 3)
                window0 = true
                window1 = true
                window2 = true
                window3 = true
            end
        elseif ( GetPedInVehicleSeat(playerCar, 0) == playerPed ) then
            if ( window == "fr" ) and  ( window1 == true ) then
                RollDownWindow(playerCar, 1)
                window1 = false
            elseif ( window == "fr" ) and ( window1 == false ) then
                RollUpWindow(playerCar, 1)
                window1 = true
            elseif window == "fl" or "br" or "bl" then
                TriggerEvent('showNotify', "~r~You can't roll this window down", GetPlayerName(source))
            end
        elseif ( GetPedInVehicleSeat(playerCar, 1) == playerPed ) then
            if ( window == "bl" ) and ( window2 == true ) then
                RollDownWindow(playerCar, 2)
                window2 = false
            elseif ( window == "bl" ) and ( window2 == false ) then
                RollUpWindow(playerCar, 2)
                window2 = true
            elseif window == "fl" or "br" or "fr" then
                TriggerEvent('showNotify', "~r~You can't roll this window down", GetPlayerName(source))
            end
        elseif ( GetPedInVehicleSeat(playerCar, 2) == playerPed ) then
            if ( window == "br" ) and ( window3 == true ) then
                RollDownWindow(playerCar, 3)
                window3 = false
            elseif ( window == "br" ) and ( window3 == false )  then
                RollUpWindow(playerCar, 3)
                window3 = true
            elseif window == "fl" or "bl" or "fr" then
                TriggerEvent('showNotify', "~r~You can't roll this window down", GetPlayerName(source))
            end
        end
    end
end)

-- Seat Detector And Window Advisor
RegisterNetEvent("SeatDAWA")
AddEventHandler("SeatDAWA", function(sender)
    TriggerEvent('showNotify', "~r~Please select a window", GetPlayerName(source))
end)

