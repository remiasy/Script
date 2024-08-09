repeat
    wait()
until game:IsLoaded()
function Postman()
    local Req = request
    local Http = game:GetService("HttpService")
    local Request = Req({
        Url = "http://localhost:8000/user/" .. game.Players.LocalPlayer.Name,
        Method = "GET",
    })
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Lnw Script",
        Text = Request.StatusCode,
        Duration = 0.1,
    })
end

task.spawn(function()
    while task.wait(1.5) do
        pcall(function()
            Postman()
        end)
    end
end)
