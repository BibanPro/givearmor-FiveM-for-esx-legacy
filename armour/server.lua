ESX = exports["es_extended"]:getSharedObject()

RegisterCommand("armour", function(source, args, rawCommand, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    local target = tonumber(args[1])
    local armour_amount = tonumber(args[2])
    if armour_amount == nil or armour_amount < 0 or armour_amount > 100 then
        TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "Veuillez saisir une valeur numérique comprise entre 0 et 100.")
        return
    end
    if group == "admin" or group == "mod" then -- Vérifie si l'utilisateur appartient à un groupe admin ou mod
        if target ~= nil then
            TriggerClientEvent("addArmour", target, armour_amount)
        else
            TriggerClientEvent("addArmour", source, armour_amount)
        end
    else
        TriggerClientEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, "Vous n'avez pas les permissions nécessaires pour utiliser cette commande.")
    end
end)
