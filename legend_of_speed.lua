local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
-- close ui
function closeui()
    local player = game.Players.LocalPlayer
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")
    local UICorner = Instance.new("UICorner")
    ScreenGui.Parent = player:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton.BorderSizePixel = 0
    ImageButton.Position = UDim2.new(0.0304, 0, 0.128, 0)
    ImageButton.Size = UDim2.new(0, 40, 0, 40)
    ImageButton.Image = "rbxassetid://96036361413632"
    ImageButton.Draggable = true
    ImageButton.Active = true
    ImageButton.Selectable = true
    UICorner.Parent = ImageButton
    ImageButton.MouseButton1Down:Connect(function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Delete, false, game)
    end)
end
-- xác định người chơi
if _G.ModDevice == "PC" then
    _G.SizeDevice = UDim2.fromOffset(712, 512)
    closeui()
elseif _G.ModDevice == "Tablet" then
    _G.SizeDevice = UDim2.fromOffset(589, 470)
    closeui()
else
    _G.SizeDevice = UDim2.fromOffset(510, 325)
    closeui()
end
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
    Farm = Window:AddTab({ Title = "Farm", Icon = "" }),
    Pet = Window:AddTab({ Title = "Pet", Icon = "pet" }),
    Server = Window:AddTab({ Title = "Server", Icon = "server" }),
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

-- done loading
wait(12)
Fluent:Notify({
    Title = "ZinSY Hub - Notification",
    Content = "Loading Done !",
    SubContent = "Script Của Bạn Đã Chạy Thành Công",
    Duration = 12
})