RegisterCommand("discord", function()
    SetNuiFocus(true, true)  
    SendNUIMessage({ type = "openUI" }) 
end, false)

RegisterNUICallback("closeUI", function(data, cb)
    SetNuiFocus(false, false) 
    SendNUIMessage({ type = "closeUI" }) 
    cb("ok")
end)

RegisterNUICallback("copyClipboard", function(data, cb)
    local url = data.url  -- Get the copied URL
    lib.setClipboard(url)
    SendNUIMessage({
        type = "showNotification",
        message = "Link copied to clipboard!"
    })

    cb("ok")
end)
