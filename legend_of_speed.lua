local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
-- create tab window
local Window = Fluent:CreateWindow({
    Title = "ZinSY Hub - Speed",
    SubTitle = "by truongvinh244",
    TabWidth = 160,
    Size = UDim2.fromOffset(610, 452),
    Acrylic = true,
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local FluentOption = Fluent.Options
Fluent:Notify({
    Title = "ZinSY Hub - Notification",
    Content = "Loading Done !",
    SubContent = "Script Của Bạn Đã Chạy Thành Công",
    Duration = 8
})
-- close ui

-- local 
local hoopsFolder = workspace:WaitForChild("Hoops")
local cityFolder = workspace:WaitForChild("orbFolder"):WaitForChild("City")
local player = game.Players.LocalPlayer
local hrp = player.Character:WaitForChild("HumanoidRootPart")
-- func local
player.CharacterAdded:Connect(function(char)
    hrp = char:WaitForChild("HumanoidRootPart")
end)
-- main func

-- Create Script
-- HoopsTab
local HoopsTab = Tabs.Main:AddSection("Hoops Tab")
local AutoTPHoops = HoopsTab:AddToggle("AutoTPHoops", {
    Title = "Auto TP Hoops",
    Description = "TP Tới Vòng Nhảy", 
    Default = false })
AutoTPHoops:OnChanged(function(Value)
    _G.AutoTPHoopsGf = Value
end)
FluentOption.AutoTPHoops:SetValue(false)
task.spawn(function()
    while wait(0.2) do
        if _G.AutoTPHoopsGf then
            for hoopsx, hoops1 in ipairs(hoopsFolder:GetChildren()) do
                pcall(function()
                    hrp.CFrame = CFrame.new(hoops1.Position)
                end)
                wait(0.1)
            end
        end
    end
end)
-- OrbsTabs
local OrbsTab = Tabs.Main:AddSection("Orbs Tab")
local AutoTPOrbs = OrbsTab:AddToggle("AutoTPOrbs", {
    Title = "Auto TP Orbs",
    Description = "TP Tới Quả Cầu Phát Sáng",
    Default = false })
AutoTPOrbs:OnChanged(function(Value)
    _G.AutoTPOrbsGf = Value
end)
FluentOption.AutoTPOrbs:SetValue(false)
task.spawn(function()
    while wait(0.2) do
        if _G.AutoTPOrbsGf then
            for orbx, orb1 in ipairs(cityFolder:GetChildren()) do
                pcall(function()
                    hrp.CFrame = CFrame.new(orb1:GetChildren()[2].Position)
                end)
                wait(0.1)
            end
        end
    end
end)
local AutoTPGems = OrbsTab:AddToggle("AutoTPGems", {
    Title = "Auto TP Gems",
    Description = "TP Tới Kim Cương",
    Default = false })
AutoTPGems:OnChanged(function(Value)
    _G.AutoTPGemsGf = Value
end)
FluentOption.AutoTPGems:SetValue(false)
task.spawn(function()
    while wait(0.2) do
        if _G.AutoTPGemsGf then
            for gemx, gem1 in ipairs(cityFolder:GetChildren()) do
                if gem1.Name == "Gem" then
                    pcall(function()
                        local pos = gem1:GetChildren()[2]
                        if pos and pos:IsA("BasePart") then
                            hrp.CFrame = CFrame.new(pos.Position)
                        end
                    end)
                    wait(0.11)
                end
            end
        end
    end
end)

-- SpawmTab
local SpawmTab = Tabs.Main:AddSection("Spawm Tab")
local AutoTPSpawm = SpawmTab:AddToggle("AutoTPSpawm", {
    Title = "Auto TP Spawm",
    Description = "TP Tới Spawm Khi Tắt Orb Và Hoops",
    Default = false })
AutoTPSpawm:OnChanged(function(Value)
    _G.AutoTPSpawmGf = Value
end)
FluentOption.AutoTPSpawm:SetValue(false)
task.spawn(function()
    while wait(0.2) do
        if _G.AutoTPSpawmGf then
            hrp.CFrame = CFrame.new(-586, 4.2,408)
            wait(0.5)
        end
    end
end)

local ServerTab = Tabs.Settings:AddSection("Server")
ServerTab:AddButton({
    Title = "Rejoin Server",
    Description = "Tham Gia Lại Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
ServerTab:AddButton({
    Title = "Fix Lag",
    Description = "Giảm Lag",
    Callback = function()
        Fluent:Notify({
            Title = "ZinSY Hub - Notification",
            Content = "Error !",
            SubContent = "Fix Lag Đang Được Phát Triển",
            Duration = 8
        })
    end
})