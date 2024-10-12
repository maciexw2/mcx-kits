RegisterNetEvent("mcx-kits:receiveItems", function(items)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchScalar(
        "SELECT received FROM users WHERE identifier = @identifier",
        {["@identifier"] = identifier},
        function(received)
            if not received then
                MySQL.Async.execute(
                    'UPDATE users SET received = 1 WHERE identifier = @identifier', 
                    {['@identifier'] = identifier}
                )

                if items == 1 then
                    for k, v in pairs(Config.Items1) do
                        xPlayer.addInventoryItem(k, v.quantity)
                    end
                else
                    for k, v in pairs(Config.Items2) do
                        xPlayer.addInventoryItem(k, v.quantity)
                    end
                end
            end
        end
    )
end)

ESX.RegisterServerCallback("mcx-kits:check", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchScalar(
        "SELECT received FROM users WHERE identifier = @identifier",
        {["@identifier"] = identifier},
        function(received)
            cb(received)
        end
    )
end)
