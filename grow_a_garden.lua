local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
-- create tab window
local Window = Fluent:CreateWindow({
    Title = "ZinSY Hub - Grow",
    SubTitle = "by truongvinh244",
    TabWidth = 124,
    Size = UDim2.fromOffset(712, 512),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.Delete,
})
local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "home" }),
    AFK = Window:AddTab({ Title = "AFK", Icon = "cherry" }),
    Server = Window:AddTab({ Title = "Server", Icon = "server" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}
local FluentOption = Fluent.Options

-- local
local eggFolder = workspace:WaitForChild("NPCS"):WaitForChild("Pet Stand"):WaitForChild("EggLocations")
-- Create Script
local PetsTab = Tabs.AFK:AddSection("Farm Tab")
local MultiDropdown = PetsTab:AddDropdown("MultiDropdown", {
    Title = "Egg Selection",
    Description = "Chọn Egg Muốn Mua",
    Values = {"Common Egg", "Uncommon Egg", "Rare Egg", "Legendary Egg", "Mythical Egg", "Bug Egg"},
    Multi = true,
    Default = {"Mythical Egg", "Bug Egg"},
})
MultiDropdown:SetValue({
    five = true
})
MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        table.insert(Values, Value)
    end
    _G.Eggs = Values
end)
local AutoBuyEggs = PetsTab:AddToggle("AutoBuyEggs", {
    Title = "Auto Buy Eggs",
    Description = "Mua Eggs Tự Động",
    Default = false })
AutoBuyEggs:OnChanged(function(Value)
    _G.AutoBuyEggsGf = Value
end)
task.spawn(function()
    while wait(1) do
        local demPet = 0
        if _G.AutoBuyEggsGf then
            wait(1)
                for _, eggModel in ipairs(eggFolder:GetChildren()) do
                    wait(1)
                    for _, eggName in ipairs(_G.Eggs) do
                    if eggModel:IsA("Model") then
                        demPet += 1
                        wait(2)
                        if eggModel.Name == eggName then
                            local mua = {[1] = demPet}
                            game:GetService("ReplicatedStorage").GameEvents.BuyPetEgg:FireServer(unpack(mua))
                        end
                    end
                end
            end
        end
        wait(600)
    end
end)

local ServerTab = Tabs.Server:AddSection("Server Tab")
ServerTab:AddButton({
    Title = "Rejoin Server",
    Description = "Tham Gia Lại Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})