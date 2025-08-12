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
-- Select Monter
tableMon = {"Bandit","Monkey","Gorilla","Pirate","Brute","Desert Bandit","Desert Officer","Snow Bandit","Snowman","Chief Petty Officer","Sky Bandit","Dark Master","Prisoner", "Dangerous Prisoner","Toga Warrior","Gladiator","Military Soldier","Military Spy","Fishman Warrior","Fishman Commando","God's Guard","Shanda","Royal Squad","Royal Soldier","Galley Pirate","Galley Captain"}
-- Select Area
AreaList = {'Jungle', 'Buggy', 'Desert', 'Snow', 'Marine', 'Sky', 'Prison', 'Colosseum', 'Magma', 'Fishman', 'Sky Island', 'Fountain'}
-- Level Check
function CheckLevel()
    local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Lv == 1 or Lv <= 9 or SelectMonster == "Bandit" or SelectArea == '' then -- Bandit
        Ms = "Bandit"
        NameQuest = "BanditQuest1"
        QuestLv = 1
        NameMon = "Bandit"
        CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
        CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
    elseif Lv == 10 or Lv <= 14 or SelectMonster == "Monkey" or SelectArea == 'Jungle' then -- Monkey
        Ms = "Monkey"
        NameQuest = "JungleQuest"
        QuestLv = 1
        NameMon = "Monkey"
        CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
    elseif Lv == 15 or Lv <= 29 or SelectMonster == "Gorilla" or SelectArea == 'Jungle' then -- Gorilla
        Ms = "Gorilla"
        NameQuest = "JungleQuest"
        QuestLv = 2
        NameMon = "Gorilla"
        CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
    elseif Lv == 30 or Lv <= 39 or SelectMonster == "Pirate" or SelectArea == 'Buggy' then -- Pirate
        Ms = "Pirate"
        NameQuest = "BuggyQuest1"
        QuestLv = 1
        NameMon = "Pirate"
        CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
        CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
    elseif Lv == 40 or Lv <= 59 or SelectMonster == "Brute" or SelectArea == 'Buggy' then -- Brute
        Ms = "Brute"
        NameQuest = "BuggyQuest1"
        QuestLv = 2
        NameMon = "Brute"
        CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
        CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
    elseif Lv == 60 or Lv <= 74 or SelectMonster == "Desert Bandit" or SelectArea == 'Desert' then -- Desert Bandit
        Ms = "Desert Bandit"
        NameQuest = "DesertQuest"
        QuestLv = 1
        NameMon = "Desert Bandit"
        CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
        CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
    elseif Lv == 75 or Lv <= 89 or SelectMonster == "Desert Officer" or SelectArea == 'Desert' then -- Desert Officer
        Ms = "Desert Officer"
        NameQuest = "DesertQuest"
        QuestLv = 2
        NameMon = "Desert Officer"
        CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
        CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
    elseif Lv == 90 or Lv <= 99 or SelectMonster == "Snow Bandit" or SelectArea == 'Snow' then -- Snow Bandit
        Ms = "Snow Bandit"
        NameQuest = "SnowQuest"
        QuestLv = 1
        NameMon = "Snow Bandit"
        CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
        CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
    elseif Lv == 100 or Lv <= 119 or SelectMonster == "Snowman" or SelectArea == 'Snow' then -- Snowman
        Ms = "Snowman"
        NameQuest = "SnowQuest"
        QuestLv = 2
        NameMon = "Snowman"
        CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
        CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif Lv == 120 or Lv <= 149 or SelectMonster == "Chief Petty Officer" or SelectArea == 'Marine' then -- Chief Petty Officer
        Ms = "Chief Petty Officer"
        NameQuest = "MarineQuest2"
        QuestLv = 1
        NameMon = "Chief Petty Officer"
        CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
        CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
    elseif Lv == 150 or Lv <= 174 or SelectMonster == "Sky Bandit" or SelectArea == 'Sky' then -- Sky Bandit
        Ms = "Sky Bandit"
        NameQuest = "SkyQuest"
        QuestLv = 1
        NameMon = "Sky Bandit"
        CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
        CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
    elseif Lv == 175 or Lv <= 189 or SelectMonster == "Dark Master" or SelectArea == 'Sky' then -- Dark Master
        Ms = "Dark Master"
        NameQuest = "SkyQuest"
        QuestLv = 2
        NameMon = "Dark Master"
        CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
        CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
    elseif Lv == 190 or Lv <= 209 or SelectMonster == "Prisoner" or SelectArea == 'Prison' then -- Prisoner
        Ms = "Prisoner"
        NameQuest = "PrisonerQuest"
        QuestLv = 1
        NameMon = "Prisoner"
        CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
        CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, -0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
    elseif Lv == 210 or Lv <= 249 or SelectMonster == "Dangerous Prisoner" or SelectArea == 'Prison' then -- Dangerous Prisoner
        Ms = "Dangerous Prisoner"
        NameQuest = "PrisonerQuest"
        QuestLv = 2
        NameMon = "Dangerous Prisoner"
        CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, -0.999846935, 0, 0.0175017118)
        CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, -0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
    elseif Lv == 250 or Lv <= 274 or SelectMonster == "Toga Warrior" or SelectArea == 'Colosseum' then -- Toga Warrior
        Ms = "Toga Warrior"
        NameQuest = "ColosseumQuest"
        QuestLv = 1
        NameMon = "Toga Warrior"
        CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
        CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
    elseif Lv == 275 or Lv <= 299 or SelectMonster == "Gladiator" or SelectArea == 'Colosseum' then -- Gladiator
        Ms = "Gladiator"
        NameQuest = "ColosseumQuest"
        QuestLv = 2
        NameMon = "Gladiator"
        CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
        CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
    elseif Lv == 300 or Lv <= 324 or SelectMonster == "Military Soldier" or SelectArea == 'Magma' then -- Military Soldier
        Ms = "Military Soldier"
        NameQuest = "MagmaQuest"
        QuestLv = 1
        NameMon = "Military Soldier"
        CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
        CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
    elseif Lv == 325 or Lv <= 374 or SelectMonster == "Military Spy" or SelectArea == 'Magma' then -- Military Spy
        Ms = "Military Spy"
        NameQuest = "MagmaQuest"
        QuestLv = 2
        NameMon = "Military Spy"
        CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
        CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, -0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
    elseif Lv == 375 or Lv <= 399 or SelectMonster == "Fishman Warrior" or SelectArea == 'Fishman' then -- Fishman Warrior
        Ms = "Fishman Warrior"
        NameQuest = "FishmanQuest"
        QuestLv = 1
        NameMon = "Fishman Warrior"
        CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
        CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
        if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    elseif Lv == 400 or Lv <= 449 or SelectMonster == "Fishman Commando" or SelectArea == 'Fishman' then -- Fishman Commando
        Ms = "Fishman Commando"
        NameQuest = "FishmanQuest"
        QuestLv = 2
        NameMon = "Fishman Commando"
        CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
        CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
        if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
    elseif Lv == 10 or Lv <= 474 or SelectMonster == "God's Guard" or SelectArea == 'Sky Island' then -- God's Guard
        Ms = "God's Guard"
        NameQuest = "SkyExp1Quest"
        QuestLv = 1
        NameMon = "God's Guard"
        CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
        CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
        if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
        end
    elseif Lv == 475 or Lv <= 524 or SelectMonster == "Shanda" or SelectArea == 'Sky Island' then -- Shanda
        Ms = "Shanda"
        NameQuest = "SkyExp1Quest"
        QuestLv = 2
        NameMon = "Shanda"
        CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
        CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
        if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
        end
    elseif Lv == 525 or Lv <= 549 or SelectMonster == "Royal Squad" or SelectArea == 'Sky Island' then -- Royal Squad
        Ms = "Royal Squad"
        NameQuest = "SkyExp2Quest"
        QuestLv = 1
        NameMon = "Royal Squad"
        CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
        CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
    elseif Lv == 550 or Lv <= 624 or SelectMonster == "Royal Soldier" or SelectArea == 'Sky Island' then -- Royal Soldier
        Ms = "Royal Soldier"
        NameQuest = "SkyExp2Quest"
        QuestLv = 2
        NameMon = "Royal Soldier"
        CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
        CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
    elseif Lv == 625 or Lv <= 649 or SelectMonster == "Galley Pirate" or SelectArea == 'Fountain' then -- Galley Pirate
        Ms = "Galley Pirate"
        NameQuest = "FountainQuest"
        QuestLv = 1
        NameMon = "Galley Pirate"
        CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
    elseif Lv >= 650 or SelectMonster == "Galley Captain" or SelectArea == 'Fountain' then -- Galley Captain
        Ms = "Galley Captain"
        NameQuest = "FountainQuest"
        QuestLv = 2
        NameMon = "Galley Captain"
        CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
    end
end
-- Check Boss
function CheckBossQuest()
    if SelectBoss == "The Gorilla King" then
        BossMon = "The Gorilla King"
        NameBoss = 'The Gorrila King'
        NameQuestBoss = "JungleQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$2,000\n7,000 Exp."
        CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
        CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
    elseif SelectBoss == "Bobby" then
        BossMon = "Bobby"
        NameBoss = 'Bobby'
        NameQuestBoss = "BuggyQuest1"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$8,000\n35,000 Exp."
        CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
        CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
    elseif SelectBoss == "The Saw" then
        BossMon = "The Saw"
        NameBoss = 'The Saw'
        CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
    elseif SelectBoss == "Yeti" then
        BossMon = "Yeti"
        NameBoss = 'Yeti'
        NameQuestBoss = "SnowQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$10,000\n180,000 Exp."
        CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
        CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
    elseif SelectBoss == "Mob Leader" then
        BossMon = "Mob Leader"
        NameBoss = 'Mob Leader'
        CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
    elseif SelectBoss == "Vice Admiral" then
        BossMon = "Vice Admiral"
        NameBoss = 'Vice Admiral'
        NameQuestBoss = "MarineQuest2"
        QuestLvBoss = 2
        RewardBoss = "Reward:\n$10,000\n180,000 Exp."
        CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
        CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
    elseif SelectBoss == "Saber Expert" then
        NameBoss = 'Saber Expert'
        BossMon = "Saber Expert"
        CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
    elseif SelectBoss == "Warden" then
        BossMon = "Warden"
        NameBoss = 'Warden'
        NameQuestBoss = "ImpelQuest"
        QuestLvBoss = 1
        RewardBoss = "Reward:\n$6,000\n850,000 Exp."
        CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Chief Warden" then
        BossMon = "Chief Warden"
        NameBoss = 'Chief Warden'
        NameQuestBoss = "ImpelQuest"
        QuestLvBoss = 2
        RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
        CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Swan" then
        BossMon = "Swan"
        NameBoss = 'Swan'
        NameQuestBoss = "ImpelQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
        CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
    elseif SelectBoss == "Magma Admiral" then
        BossMon = "Magma Admiral"
        NameBoss = 'Magma Admiral'
        NameQuestBoss = "MagmaQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
        CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
        CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
    elseif SelectBoss == "Fishman Lord" then
        BossMon = "Fishman Lord"
        NameBoss = 'Fishman Lord'
        NameQuestBoss = "FishmanQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
        CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
        CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
    elseif SelectBoss == "Wysper" then
        BossMon = "Wysper"
        NameBoss = 'Wysper'
        NameQuestBoss = "SkyExp1Quest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
        CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
        CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
    elseif SelectBoss == "Thunder God" then
        BossMon = "Thunder God"
        NameBoss = 'Thunder God'
        NameQuestBoss = "SkyExp2Quest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
        CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
        CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
    elseif SelectBoss == "Cyborg" then
        BossMon = "Cyborg"
        NameBoss = 'Cyborg'
        NameQuestBoss = "FountainQuest"
        QuestLvBoss = 3
        RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
        CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
        CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
    elseif SelectBoss == "Ice Admiral" then
        BossMon = "Ice Admiral"
        NameBoss = 'Ice Admiral'
        CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
    elseif SelectBoss == "Greybeard" then
        BossMon = "Greybeard"
        NameBoss = 'Greybeard'
        CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
    end
end
-- Check Material
function CheckMaterial()
    if SelectMaterial == "Leather + ScrapMetal" then
        MMon = "Brute"
        MPos = CFrame.new(-1145,15,4350)
        SP = "Default"
    elseif SelectMaterial == "Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698,845,-1912)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7859.09814, 5544.19043, -381.476196))
        end
    elseif SelectMaterial == "Magma Ore" then
        MMon = "Military Spy"
        MPos = CFrame.new(-5815,84,8820)
        SP = "Default"
    elseif SelectMaterial == "Fish Tail" then
        MMon = "Fishman Warrior"
        MPos = CFrame.new(61123,19,1569)
        SP = "Default"
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
        end
    end 
end
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
