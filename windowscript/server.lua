-- Window Down/Up
RegisterCommand("wind", function(source, args)

    local window = args[1]
    if not args[1] then
        TriggerClientEvent("SeatDAWA", source)
    else
        TriggerClientEvent("CarWindowS", -1, source, window)
    end
end, false)



