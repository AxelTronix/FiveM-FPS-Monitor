


RegisterServerEvent("Frame:Log")
AddEventHandler("Frame:Log", function(amount,amount1,amount2)
    local src = source
    FrameLogged(amount,amount1,amount2,GetPlayerName(src))
end)


logging_webhook = ""

function FrameLogged(low,avg,high,name,time)
    Wait(200)
        local embed = {
            {
                ["color"] = 25087,
                ["title"] = "Frame Logged",
                ["description"] = "``User:`` " ..name,
                ["fields"] = {
                    {
                        ["name"] = "Lowest Frame",
                        ["value"] = low,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "AVG Frames",
                        ["value"] = avg,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Highest Frame",
                        ["value"] = high,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Time",
                        ["value"] = os.date("%c"),
                        ["inline"] = true
                    },
                    
                },
                ["footer"] = {
                    ["text"] = "©️ All rights reserved by Tronix",
                },
            }
        }
        PerformHttpRequest(logging_webhook, function(err, text, headers) end, 'POST', json.encode({username = "Discord Logs", embeds = embed}), { ['Content-Type'] = 'application/json' })
end
