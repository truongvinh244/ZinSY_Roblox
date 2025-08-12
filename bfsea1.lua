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
-- Local
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local currentTween
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
-- Function
function Tween(DiaDiem)
    if hrp then
        local targetPos = DiaDiem
        local baseSpeed = _G.TweenSpeedGG
        local slowDistance = 244
        local minSpeed = 144
        local function getSpeedByDistance(dist)
            if dist <= slowDistance then
                return minSpeed
            else
                return baseSpeed
            end
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
            end
        end)
    end
end
local function StopFlying()
    if currentTween then
        currentTween:Cancel()
        currentTween = nil
    end
end
-- Notifiy
function noti(tieude,phude,thoigian)
    Fluent:Notify({
        Title = "ZinSY Script",
        Content = tieude,
        SubContent = phude,
        Duration = thoigian 
    })
end

MainFarm = Tabs.Main:AddSection({Title = "Main Settings"})

island = {
    ["Jungle"] = Vector3.new(-1447.01001, 61.7109985, 14.45300293),
    ["Sky Island"] = Vector3.new(-4913.06689, 739.033997, -2580.4231),
    ["Sky Island 1"] = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"),
    ["Sky Island 2"] = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetLastSpawnPoint","Sky2"),
    ["Colosseum"] = Vector3.new(-1477.78198, 8.69700623, -2920.66309),
    ["Forzen Village"] = Vector3.new(1398.23303, 84.6360016, -1345.39697),
    ["Underwater City IN"] = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.852, 11.68, 1819.784)),
    ["Underwater City OUT"] = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.688, 6.737, -1926.214)),
}

local IslandList = MainFarm:AddDropdown("IslandList", {
    Title = "Island TP",
    Values = {"Jungle", "Sky Island", "Colosseum", "Forzen Village", "Underwater City IN", "Underwater City OUT"},
    Multi = false,
    Default = 1,
})
IslandList:SetValue("nil")
IslandList:OnChanged(function(Value)
    _G.Island = Value
end)


TweenIsland = MainFarm:AddToggle("TweenIsland", {Title = "TweenIsland", Default = false })
TweenIsland:OnChanged(function()
    _G.TweenIslandGG = Options.MyToggle.Value
end)
Options.MyToggle:SetValue(false)
task.spawn(function()
    if _G.TweenIslandGG then
        if _G.Island == "UnderWater City IN" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.688, 6.737, -1926.214))
        elseif _G.Island == "UnderWater City OUT" then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.688, 6.737, -1926.214))
        else
            Tween(island(_G.Island))
        end
    else
        StopFlying()
    end
end)

MainSettings = Tabs.Settings:AddSection({Title = "Main Settings",})
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
