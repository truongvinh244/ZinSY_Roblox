local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "ZinSY Hub",
    SubTitle = "by truongvinh244",
    TabWidth = 170,
    Size = _G.SizeDevice,
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.Delete
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Shops = Window:AddTab({ Title = "Shops", Icon = "shopping_cart" }),
    Items = Window:AddTab({ Title = "Items", Icon = "inventory" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "place" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "more_horiz" }),
}
local Options = Fluent.Options
-- AntiBan
function AntiBan()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
    end
end
AntiBan()
-- AntiAFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(10)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
function noti(tieude,phude,thoigian)
    Fluent:Notify({
        Title = "ZinSY Script",
        Content = tieude,
        SubContent = phude,
        Duration = thoigian 
    })
end
-- tesst
local island = {
    ["Jungle"] = Vector3.new(-1447.01001, 61.7109985, 14.45300293),
    ["Sky Island"] = Vector3.new(-4913.06689, 739.033997, -2580.4231),
    ["Colosseum"] = Vector3.new(-1477.78198, 8.69700623, -2920.66309),
    ["Forzen Village"] = Vector3.new(1398.23303, 84.6360016, -1345.39697),
    ["Underwater City IN"] = "UnderwaterIn",
    ["Underwater City OUT"] = "UnderwaterOut",
}
local MainFarm = Tabs.Main:AddSection("Main Farm")
local IslandList = MainFarm:AddDropdown("IslandList", {
    Title = "Island TP",
    Values = {},
    Multi = false,
    Default = 1,
})
for name,_ in pairs(island) do
    table.insert(IslandList.Values, name)
end
IslandList:SetValue("nil")
IslandList:OnChanged(function(Value)
    _G.Island = Value
end)

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
local currentTween

function Tween(targetPos)
    if not hrp then return end
    local baseSpeed = _G.TweenSpeedGG or 300
    local slowDistance = 244
    local minSpeed = 144

    local function getSpeedByDistance(dist)
        return dist <= slowDistance and minSpeed or baseSpeed
    end

    local conn
    conn = RunService.Heartbeat:Connect(function()
        local dist = (hrp.Position - targetPos).Magnitude
        local currentSpeed = getSpeedByDistance(dist)
        local moveDir = (targetPos - hrp.Position).Unit
        hrp.CFrame = hrp.CFrame + moveDir * (currentSpeed * RunService.Heartbeat:Wait())
        if dist <= 5 then
            hrp.CFrame = CFrame.new(targetPos)
            conn:Disconnect()
            noti("Hoàn tất", "Đã đến nơi: " .. _G.Island, 3)
        end
    end)
end

function StopFlying()
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
end
local TweenIsland = MainFarm:AddToggle("TweenIsland", {Title = "TweenIsland", Default = false })
TweenIsland:OnChanged(function(Value)
    _G.TweenIslandGG = Value
    if Value then
        if _G.Island == "Underwater City IN" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.688, 6.737, -1926.214))
        elseif _G.Island == "Underwater City OUT" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(3864.688, 6.737, -1926.214))
        elseif island[_G.Island] then
            Tween(island[_G.Island])
        else
            noti("Lỗi", "Không tìm thấy đảo: " .. tostring(_G.Island), 3)
        end
    else
        StopFlying()
    end
end)
local MainSettings = Tabs.Settings:AddSection("Main Settings")
local TweenSpeed = MainSettings:AddSlider("TweenSpeed", {
    Title = "TweenSpeed",
    Description = "Chọn Tốc Độ Bay",
    Default = 300,
    Min = 50,
    Max = 375,
    Rounding = 1,
    Callback = function(Value)
        _G.TweenSpeedGG = Value
    end
})
