local isUI = false


RegisterCommand('kit', function()
    ESX.TriggerServerCallback('mcx-kits:check', function(received)
        if received then 
            ESX.ShowNotification("Nie można odebrać 2 raz zestawu!")
        else 
            toggleUI(true) 
        end
    end)
end)


function toggleUI(open)
    if open == true then 
        SendNUIMessage({
            action = 'SHOW_UI',
        })
        SetNuiFocus(true, true)
    else 
        SendNUIMessage({
            action = 'HIDE_UI',
        })
        SetNuiFocus(false, false)
    end
end

RegisterNUICallback('closeui', function ()
    toggleUI(false)
end)

RegisterNuiCallback('1', function ()
    TriggerServerEvent('mcx-kits:receiveItems', 1)
    Citizen.Wait(2000)
    ESX.ShowNotification('Odebrano zestaw!')
    toggleUI(false)

end)
RegisterNuiCallback('2', function ()
    TriggerServerEvent('mcx-kits:receiveItems', 2)
    Citizen.Wait(2000)
    ESX.ShowNotification('Odebrano zestaw!')
    toggleUI(false)
end)