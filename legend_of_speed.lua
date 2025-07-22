local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
-- create tab window
local Window = Fluent:CreateWindow({
    Title = "ZinSY Hub - Speed",
    SubTitle = "by truongvinh244",
    TabWidth = 124,
    Size = _G.SizeDevice,
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.Delete,
})
local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "home" }),
    Pet = Window:AddTab({ Title = "Pet", Icon = "animal" }),
    Event = Window:AddTab({ Title = "Event", Icon = "box" }),
    Server = Window:AddTab({ Title = "Server", Icon = "server" }),
    Quest = Window:AddTab({ Title = "Quest", Icon = "cherry"}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}
local FluentOption = Fluent.Options
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
local HoopsTab = Tabs.Farm:AddSection("Hoops Tab")
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
-- OrbsTab
local OrbsTab = Tabs.Farm:AddSection("Orbs Tab")

local OrbDropdown = OrbsTab:AddDropdown("OrbDropdown", {
    Title = "Dropdown Orb",
    Values = {"Blue Orb", "Orange Orb", "Yellow Orb", "Red Orb", "Gem"},
    Multi = true,
    Default = 1,
})
OrbDropdown:SetValue("here")
OrbDropdown:OnChanged(function(Value)
    _G.OrbDropdown = Value
end)

local AutoTPOrbs = OrbsTab:AddToggle("AutoTPOrbs", {
    Title = "Auto TP Orbs",
    Description = "TP Tới Quả Cầu Phát Sáng Đã Chọn",
    Default = false })
AutoTPOrbs:OnChanged(function(Value)
    _G.AutoTPOrbsGf = Value
end)
FluentOption.AutoTPOrbs:SetValue(false)
task.spawn(function()
    while wait(0.2) do
        if _G.AutoTPOrbsGf then
            for _, OrbSE in ipairs(_G.OrbDropdown) do
                for _, OrbTP in ipairs(cityFolder:GetChildren()) do
                    if OrbTP.Name == OrbSE then
                        pcall(function()
                            local pos = OrbTP:GetChildren()[2]
                            if pos and pos:IsA("BasePart") then
                                hrp.CFrame = CFrame.new(pos.Position)
                            end
                        end)
                        wait(0.11)
                    end
                end
            end
        end
    end
end)

-- SpawmTab
local SpawmTab = Tabs.Farm:AddSection("Spawm Tab")
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
-- PetsTab
local PetsTab = Tabs.Pet:AddSection("Pets Tab")
function buypet(name)
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal",name)
end
local PetDropdown = PetsTab:AddDropdown("PetDropdown", {
    Title = "Dropdown Pet",
    Values = {"Red Crystal", "Blue Crystal", "Purple Crystal", "Yellow Crystal", "Lightning Crystal","Snow Crystal"},
    Multi = false,
    Default = 1,
})
PetDropdown:SetValue("here")
PetDropdown:OnChanged(function(Value)
    _G.PetDropdown = Value
end)
PetsTab:AddButton({
    Title = "Open Pet",
    Description = "Mua Pet Chọn Ở Dropdown",
    Callback = function()
        buypet(_G.PetDropdown)
    end
})
-- servertab
local ServerTab = Tabs.Server:AddSection("Server")
ServerTab:AddButton({
    Title = "Rejoin Server",
    Description = "Tham Gia Lại Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
local FixLagTab = Tabs.Settings:AddSection("Fix Lag")
FixLagTab:AddButton({
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


-- nhiệm vụ
local QuestTab = Tabs.Quest:AddSection("Event")


-- done loading
wait(12)
Fluent:Notify({
    Title = "ZinSY Hub - Notification",
    Content = "Loading Done !",
    SubContent = "Có Thể Nhấn Nút Delete Để Ẩn Hoặc Hiện Giao Diện",
    Duration = 12
})