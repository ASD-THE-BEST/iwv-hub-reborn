-- 1.0 change log : 스카이부대 추가(올킬), 팽부대 추가(올킬), ACS벽설치 v2추가

-- 1.1 change log : ACS all kill rewrite(안티치트 걸리던거 없애고 아예 새로), ACS소리테러,ACS화면테러

-- 1.2 change log : 작동 안하는 벽 설치해서 올킬 삭제 : 새로운 방식의 벽 설치 추가, UI 개선, 가독성 개선, ClickTP 툴 추가, ACS 핑핵 추가, 속도 추가, 점프파워 추가, Rejoin 추가, chatspammer 추가

-- [[2.0 change log : [+] 서울부대 : Select Loopkill,Loopkill all,SelectKill,AllKill(총 필요 없음),All LoopKill(총 필요 없음),Select LoopKill(총 X), Select Kill(총 X), [+] 팽 부대 : All LoopKill,Select Kill,Select LoopKill, [+] 성능 최적화들, [-] 서울부대가 ESP를 바꾸지도 않았는데 감지함(CoreGUI같은데 어떻게 감지? 최대한 고쳐봄)

-- 2.1 change log : 서울부대 안티치트 감지 삭제,팽부대 올루프킬추가(기능 더 추가할거 tysm chae.r1n_1023), 로컬스크립트 킥 방지 추가, 최적화들

-- 2.1.1 change log : FOV추가, 이제 standerd cheat 슬라이더는 실시간으로 바뀜,Auto Rejoin추가, 최적화들

-- 서울부대 안티치트 없애기 --
game.Players.LocalPlayer.CharacterAdded:Connect(function(c)
	if c:FindFirstChild("JyAntiCheat.lua [READ]") then
		c["JyAntiCheat.lua [READ]"]:Destroy()
	end
	if c:FindFirstChild("Anti") then
		c["Anti"]:Destroy()
	end
end)

if game.Players.LocalPlayer.Character then
	if game.Players.LocalPlayer.Character:FindFirstChild("JyAntiCheat.lua [READ]") then
		game.Players.LocalPlayer.Character["JyAntiCheat.lua [READ]"]:Destroy()
	end
	if game.Players.LocalPlayer.Character:FindFirstChild("Anti") then
		game.Players.LocalPlayer.Character["Anti"]:Destroy()
	end
end
-- main
version = "2.1.1"
local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()
getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "IWV Hub Reborn v" .. version,
	Icon = "code",
	ShowText = "IWV",
	Theme = "Amethyst",
	LoadingTitle = "IWV..",
	LoadingSubtitle = "by songminseo123",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "IWV Hub"
	},
	KeySystem = true,
	KeySettings = {
		Title = "IWV Hub Reborn v" .. version,
		Subtitle = "Disclaimer",
		Note = "Credit to IWV & community\nkey : 69",
		FileName = "Key",
		SaveKey = false,
		GrabKeyFromSite = false,
		Key = {
			[1] = "69"
		}
	}
})

if game:GetService("ReplicatedStorage"):FindFirstChild("line") then
	game:GetService("ReplicatedStorage"):FindFirstChild("line"):Destroy()
end

-- 로컬스크립트 안티킥 --
getgenv().iwvhubreborn = false

local iwv_love
iwv_love = hookmetamethod(game, "__namecall", function(a, ...)
	if getgenv().iwvhubreborn and typeof(getnamecallmethod()) == "string" and getnamecallmethod():lower() == "kick" then
		return 0
	end
	return iwv_love(a, ...)
end)
-- 끗 --
Players = game:GetService("Players")
Player = Players.LocalPlayer
ReplicatedStorage = game:GetService("ReplicatedStorage")

local dragInput, mousePos, framePos
local SpamTextttttt
local renderSteppedConnection
local colors = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(255, 165, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(0, 0, 255),
	Color3.fromRGB(128, 0, 128),
	Color3.fromRGB(0, 0, 0)
}
local ToggleFly, ToggleNoclip, ToggleESP, ToggleSpin, ToggleStaticCuff, ToggleTpKill
local ToggleWeaponSize, ToggleSwordAttack
isKeyValid = false
dragging = false
teleporting = false
isFlying = false
spinSpeed = 2
flySpeed = 2
Speedy = 35
defaultSpeeddddddd = Player.Character.Humanoid.WalkSpeed
ahh = false
Jumppy = 60
defaultJumppyyyyy = Player.Character.Humanoid.JumpPower
ahhh = false
mysoul = nil
spinning = false
Fov = 80
defaultFov = workspace.CurrentCamera.FieldOfView
ahhhh = false
noclip = false
userName = ""
espEnabled = false
espObjects = {}
CurrentValue = false
flyEnabled = false
noclipEnabled = false
spinEnabled = false
KillAuraEnabled = false
hahaha = nil
StaticCuffEnabled = false
TpKillEnabled = false
swordAttackEnabled = false
increaseSize = false
swordEquipEnabled = false
swordSizeIncreaseEnabled = false
aimAssistEnabled = false
currentTarget = nil
frame = nil
uiStroke = nil
baseSize = 100
sizeIncrement = 50
currentColorIndex = 1
fanggggggggggggggggggggggggg = nil
HWID = game:GetService("RbxAnalyticsService"):GetClientId()
HWIDiddy = nil
ahhhhh = false

local function findPlayerDisplayName(identifier)
	for _, player in ipairs(Players:GetPlayers()) do
		if string.find(string.lower(player.Name), string.lower(identifier)) then
			return player.Name
		end
	end
end

local function findPlayerDisplayName2(identifier)
	for _, player in ipairs(Players:GetPlayers()) do
		if string.find(string.lower(player.Name), string.lower(identifier)) then
			return player
		end
	end
end

-- 오토리조인 --
getgenv().autorj = false
game.GuiService.ErrorMessageChanged:Connect(function()
	if getgenv().autorj then
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
end)
-- 끗 --
------------------------ 강철 부대 ----------------------------
local function gangchulCuff()
	local ohString1 = "Cuff"
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		if player ~= game:GetService("Players").LocalPlayer and player then
			local CuffItem = player.Backpack:FindFirstChild(utf8.char(49688, 44049))
			if CuffItem then
				if not CuffItem:FindFirstChild("RemoteEvent") then
					local RemoteEvent = Instance.new("RemoteEvent")
					RemoteEvent.Name = "RemoteEvent"
					RemoteEvent.Parent = CuffItem
				end
				CuffItem.RemoteEvent:FireServer(ohString1, player.Character.HumanoidRootPart)
			end
		end
	end
end

local function gangchulUnCuff()
	local ohString1 = "UnCuff"
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		if player ~= game:GetService("Players").LocalPlayer and player then
			local CuffItem = player.Backpack:FindFirstChild(utf8.char(49688, 44049))
			if CuffItem then
				if not CuffItem:FindFirstChild("RemoteEvent") then
					local RemoteEvent = Instance.new("RemoteEvent")
					RemoteEvent.Name = "RemoteEvent"
					RemoteEvent.Parent = CuffItem
				end
				CuffItem.RemoteEvent:FireServer(ohString1, player.Character.HumanoidRootPart)
			end
		end
	end
end
--------------------------------------- 은신 기능 ----------------------------------------------------

function Transparency_toggle_bt(value)
	local ScriptStarted = false
	local Keybind = "H"
	local Transparency = true
	local NoClip = false
	local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
	local IsInvisible = false
	RealCharacter.Archivable = true
	local FakeCharacter = RealCharacter:Clone()
	local Part
	Part = Instance.new("Part", workspace)
	Part.Anchored = true
	Part.Size = Vector3.new(200, 1, 200)
	Part.CFrame = CFrame.new(0, -500, 0)
	Part.CanCollide = true
	FakeCharacter.Parent = workspace
	FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
	for i, v in pairs(RealCharacter:GetChildren()) do
		if v:IsA("LocalScript") then
			local clone = v:Clone()
			clone.Disabled = true
			clone.Parent = FakeCharacter
		end
	end
	if Transparency then
		for i, v in pairs(FakeCharacter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0.7
			end
		end
	end
	local CanInvis = true
	function RealCharacterDied()
		CanInvis = false
		RealCharacter:Destroy()
		RealCharacter = Player.Character
		CanInvis = true
		isinvisible = false
		FakeCharacter:Destroy()
		workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
		RealCharacter.Archivable = true
		FakeCharacter = RealCharacter:Clone()
		Part:Destroy()
		Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Size = Vector3.new(200, 1, 200)
		Part.CFrame = CFrame.new(9999, 9999, 9999)
		Part.CanCollide = true
		FakeCharacter.Parent = workspace
		FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		for i, v in pairs(RealCharacter:GetChildren()) do
			if v:IsA("LocalScript") then
				local clone = v:Clone()
				clone.Disabled = true
				clone.Parent = FakeCharacter
			end
		end
		if Transparency then
			for i, v in pairs(FakeCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.7
				end
			end
		end
		RealCharacter.Humanoid.Died:Connect(function()
			RealCharacter:Destroy()
			FakeCharacter:Destroy()
		end)
		Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	end
	RealCharacter.Humanoid.Died:Connect(function()
		RealCharacter:Destroy()
		FakeCharacter:Destroy()
	end)
	Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	local PseudoAnchor
	game:GetService("RunService").RenderStepped:Connect(
    function()
		if PseudoAnchor ~= nil then
			PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		end
		if NoClip then
			FakeCharacter.Humanoid:ChangeState(11)
		end
	end
    )
	PseudoAnchor = FakeCharacter.HumanoidRootPart
	local function Invisible()
		if IsInvisible == false then
			local StoredCF = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = StoredCF
			RealCharacter.Humanoid:UnequipTools()
			Player.Character = FakeCharacter
			workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
			PseudoAnchor = RealCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = false
				end
			end
			IsInvisible = true
		else
			local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = StoredCF
			FakeCharacter.Humanoid:UnequipTools()
			Player.Character = RealCharacter
			workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
			PseudoAnchor = FakeCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
			IsInvisible = false
		end
	end
	game:GetService("UserInputService").InputBegan:Connect(
    function(key, gamep)
		if gamep then
			return
		end
		if tostring(key.KeyCode):lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
			if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
				Invisible()
			end
		end

	end
    )
	local Sound = Instance.new("Sound", game:GetService("SoundService"))
	Sound.SoundId = "rbxassetid://232127604"
	Sound:Play()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		["Title"] = "Invisible Toggle Loaded",
		["Text"] = "Press " .. Keybind .. " to become change visibility.",
		["Duration"] = 20,
		["Button1"] = "Okay."
	})
end
--------------------------------------- 은신 기능 ----------------------------------------------------
function Transparency_toggle_bt_kill()
	local ScriptStarted = false
	local Keybind = "H"
	local Transparency = true
	local NoClip = false
	local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
	local IsInvisible = false
	RealCharacter.Archivable = true
	local FakeCharacter = RealCharacter:Clone()
	local Part
	Part = Instance.new("Part", workspace)
	Part.Anchored = true
	Part.Size = Vector3.new(200, 1, 200)
	Part.CFrame = CFrame.new(0, -1000, 0)
	Part.CanCollide = true
	FakeCharacter.Parent = workspace
	FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
	for i, v in pairs(RealCharacter:GetChildren()) do
		if v:IsA("LocalScript") then
			local clone = v:Clone()
			clone.Disabled = true
			clone.Parent = FakeCharacter
		end
	end
	if Transparency then
		for i, v in pairs(FakeCharacter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0.7
			end
		end
	end
	local CanInvis = true
	function RealCharacterDied()
		CanInvis = false
		RealCharacter:Destroy()
		RealCharacter = Player.Character
		CanInvis = true
		isinvisible = false
		FakeCharacter:Destroy()
		workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
		RealCharacter.Archivable = true
		FakeCharacter = RealCharacter:Clone()
		Part:Destroy()
		Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Size = Vector3.new(200, 1, 200)
		Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
		Part.CanCollide = true
		FakeCharacter.Parent = workspace
		FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		for i, v in pairs(RealCharacter:GetChildren()) do
			if v:IsA("LocalScript") then
				local clone = v:Clone()
				clone.Disabled = true
				clone.Parent = FakeCharacter
			end
		end
		if Transparency then
			for i, v in pairs(FakeCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.7
				end
			end
		end
		RealCharacter.Humanoid.Died:Connect(function()
			RealCharacter:Destroy()
			FakeCharacter:Destroy()
		end)
		Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	end
	RealCharacter.Humanoid.Died:Connect(function()
		RealCharacter:Destroy()
		FakeCharacter:Destroy()
	end)
	Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	local PseudoAnchor
	game:GetService("RunService").RenderStepped:Connect(
    function()
		if PseudoAnchor ~= nil then
			PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		end
		if NoClip then
			FakeCharacter.Humanoid:ChangeState(11)
		end
	end
    )
	PseudoAnchor = FakeCharacter.HumanoidRootPart
	local function Invisible()
		if IsInvisible == false then
			local StoredCF = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = StoredCF
			RealCharacter.Humanoid:UnequipTools()
			Player.Character = FakeCharacter
			workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
			PseudoAnchor = RealCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = false
				end
			end
			IsInvisible = true
		else
			local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = StoredCF
			FakeCharacter.Humanoid:UnequipTools()
			Player.Character = RealCharacter
			workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
			PseudoAnchor = FakeCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
			IsInvisible = false
		end
	end
	game:GetService("UserInputService").InputBegan:Connect(
    function(key, gamep)
		if gamep then
			return
		end
		if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
			if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
				Invisible()
			end
		end
	end
    )
	local Sound = Instance.new("Sound", game:GetService("SoundService"))
	Sound.SoundId = "rbxassetid://232127604"
	Sound:Play()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		["Title"] = "Invisible Toggle Loaded",
		["Text"] = "Press " .. Keybind .. " to become change visibility.",
		["Duration"] = 20,
		["Button1"] = "Okay."
	})
end
---------------------- 킬용 은신 ------------------------
---------------------- 특정 플레이어 날리기 --------------------
-- 메인 함수 정의
function Select_Fling_Player(username)
	local AllBool = false
	local function Message(_Title, _Text, Time)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = _Title,
			Text = _Text,
			Duration = Time
		})
	end
	local function GetPlayer(Name)
		Name = Name:lower()
		if Name == "all" or Name == "others" then
			AllBool = true
			return nil
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers, Player) then
				table.remove(GetPlayers, table.find(GetPlayers, Player))
			end
			return GetPlayers[math.random(#GetPlayers)]
		else
			for _, x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^" .. Name) or x.DisplayName:lower():match("^" .. Name) then
						return x
					end
				end
			end
		end
		return nil
	end
	local function SkidFling(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
		local TCharacter = TargetPlayer.Character
		local THumanoid
		local TRootPart
		local THead
		local Accessory
		local Handle
		if TCharacter and TCharacter:FindFirstChildOfClass("Humanoid") then
			THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
		end
		if THumanoid and THumanoid.RootPart then
			TRootPart = THumanoid.RootPart
		end
		if TCharacter and TCharacter:FindFirstChild("Head") then
			THead = TCharacter.Head
		end
		if TCharacter and TCharacter:FindFirstChildOfClass("Accessory") then
			Accessory = TCharacter:FindFirstChildOfClass("Accessory")
		end
		if Accessory and Accessory:FindFirstChild("Handle") then
			Handle = Accessory.Handle
		end
		if Character and Humanoid and RootPart then
			if RootPart.Velocity.Magnitude < 50 then
				getgenv().OldPos = RootPart.CFrame
			end
			if THumanoid and THumanoid.Sit and not AllBool then
				return Message("Error Occurred", "Targeting is sitting", 5)
			end
			if THead then
				workspace.CurrentCamera.CameraSubject = THead
			elseif not THead and Handle then
				workspace.CurrentCamera.CameraSubject = Handle
			elseif THumanoid and TRootPart then
				workspace.CurrentCamera.CameraSubject = THumanoid
			end
			if not TCharacter:FindFirstChildWhichIsA("BasePart") then
				return
			end
			local function FPos(BasePart, Pos, Ang)
				RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end
			local function SFBasePart(BasePart)
				local TimeToWait = 2
				local Time = tick()
				local Angle = 0
				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end
			workspace.FallenPartsDestroyHeight = 0 / 0
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			if TRootPart and THead then
				if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
					SFBasePart(THead)
				else
					SFBasePart(TRootPart)
				end
			elseif TRootPart and not THead then
				SFBasePart(TRootPart)
			elseif not TRootPart and THead then
				SFBasePart(THead)
			elseif not TRootPart and not THead and Accessory and Handle then
				SFBasePart(Handle)
			else
				return Message("Error Occurred", "Target is missing everything", 5)
			end
			BV:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid
			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				task.wait()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
			return Message("Error Occurred", "Random error", 5)
		end
	end

    -- Main logic to select player and fling
	local targetPlayer = GetPlayer(username)
	if targetPlayer and targetPlayer ~= Player then
		SkidFling(targetPlayer)
	else
		Message("Error Occurred", "Username Invalid or not found", 5)
	end
end
---------------------- ESP 기능 ------------------------
local CoreGui = game:GetService("CoreGui")
local espEnabled = false
local espTransparency = 0.3
local espObjects = {}

local function getRoot(character)
	return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head")
end

local function round(num, numDecimalPlaces)
	local mult = 10 ^ (numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

local function createESP(plr)
	if plr == Player then
		return
	end
	local function setupESP()
		local character = plr.Character
		if not character or not character:FindFirstChild("Humanoid") then
			return
		end
		local rootPart = getRoot(character)
		if not rootPart then
			return
		end
		local existingESP = espObjects[plr.UserId]
		if existingESP then
			existingESP:Destroy()
			espObjects[plr.UserId] = nil
		end
		local ESPholder = Instance.new("Folder")
		ESPholder.Name = plr.Name .. '_ESP'
		ESPholder.Parent = CoreGui
		espObjects[plr.UserId] = ESPholder

		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				local adornment = Instance.new("BoxHandleAdornment")
				adornment.Name = plr.Name
				adornment.Parent = ESPholder
				adornment.Adornee = part
				adornment.AlwaysOnTop = true
				adornment.ZIndex = 10
				adornment.Size = part.Size
				adornment.Transparency = espTransparency
				adornment.Color3 = plr.TeamColor.Color
			end
		end
		local head = character:FindFirstChild("Head")
		if head then
			local BillboardGui = Instance.new("BillboardGui")
			local TextLabel = Instance.new("TextLabel")
			BillboardGui.Adornee = head
			BillboardGui.Name = plr.Name
			BillboardGui.Parent = ESPholder
			BillboardGui.Size = UDim2.new(0, 100, 0, 150)
			BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
			BillboardGui.AlwaysOnTop = true
			TextLabel.Parent = BillboardGui
			TextLabel.BackgroundTransparency = 1
			TextLabel.Position = UDim2.new(0, 0, 0, -50)
			TextLabel.Size = UDim2.new(0, 100, 0, 100)
			TextLabel.Font = Enum.Font.SourceSansSemibold
			TextLabel.TextSize = 20
			TextLabel.TextColor3 = Color3.new(1, 1, 1)
			TextLabel.TextStrokeTransparency = 0
			TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
			TextLabel.Text = 'Name: ' .. plr.Name
			local function updateESP()
				if not ESPholder.Parent then
					return
				end
				if character and rootPart and character:FindFirstChildOfClass("Humanoid") then
					local playerRootPart = getRoot(Player.Character)
					if playerRootPart and rootPart then
						local distance = round((rootPart.Position - playerRootPart.Position).Magnitude, 1)
						local health = round(character:FindFirstChildOfClass('Humanoid').Health, 1)
						TextLabel.Text = 'Name: ' .. plr.Name .. ' | Health: ' .. health .. ' | Distance: ' .. distance
					end
				end
			end
			local espLoopFunc = game:GetService("RunService").RenderStepped:Connect(updateESP)
			local function onCharacterRemoving()
				espLoopFunc:Disconnect()
				if ESPholder.Parent then
					ESPholder:Destroy()
				end
			end

			local function onCharacterAdded(newCharacter)
				setupESP()
			end

			plr.CharacterRemoving:Connect(onCharacterRemoving)
			plr.CharacterAdded:Connect(onCharacterAdded)

			local function onTeamChanged()
				for _, adornment in pairs(ESPholder:GetChildren()) do
					if adornment:IsA("BoxHandleAdornment") then
						adornment.Color3 = plr.TeamColor.Color
					end
				end
			end
			plr:GetPropertyChangedSignal("TeamColor"):Connect(onTeamChanged)
		end
	end

	if plr.Character then
		setupESP()
	end

	plr.CharacterAdded:Connect(setupESP)
end

local function removeESPForPlayer(plr)
	local esp = espObjects[plr.UserId]
	if esp then
		esp:Destroy()
		espObjects[plr.UserId] = nil
	end
end

local function applyESP()
	for _, plr in pairs(Players:GetPlayers()) do
		createESP(plr)
	end
end

local function removeESP()
	for _, esp in pairs(espObjects) do
		if esp then
			esp:Destroy()
		end
	end
	espObjects = {}
end

Player.CharacterAdded:Connect(function()
	if espEnabled then
		applyESP()
	end
end)

Players.PlayerAdded:Connect(function(plr)
	if espEnabled then
		createESP(plr)
	end
end)

Players.PlayerRemoving:Connect(function(plr)
	removeESPForPlayer(plr)
end)

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(character)
		if espEnabled then
			createESP(plr)
		end
	end)
end)

if espEnabled then
	applyESP()
end
---------------------- ESP 기능 --------------------------
---------------------- FLY 기능 --------------------------
local function startFlying()
	if isFlying then
		return
	end
	isFlying = true
	local T = Player.Character.HumanoidRootPart
	local CONTROL = {
		F = 0,
		B = 0,
		L = 0,
		R = 0,
		Q = 0,
		E = 0
	}
	local lCONTROL = {
		F = 0,
		B = 0,
		L = 0,
		R = 0,
		Q = 0,
		E = 0
	}
	local SPEED = 0
	local function FLY()
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat
				wait()
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = flySpeed * 40
				elseif SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {
						F = CONTROL.F,
						B = CONTROL.B,
						L = CONTROL.L,
						R = CONTROL.R
					}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not isFlying
			CONTROL = {
				F = 0,
				B = 0,
				L = 0,
				R = 0,
				Q = 0,
				E = 0
			}
			lCONTROL = {
				F = 0,
				B = 0,
				L = 0,
				R = 0,
				Q = 0,
				E = 0
			}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Player.Character:FindFirstChildOfClass('Humanoid') then
				Player.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	local function onKeyPress(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 1
		elseif KEY:lower() == 's' then
			CONTROL.B = -1
		elseif KEY:lower() == 'a' then
			CONTROL.L = -1
		elseif KEY:lower() == 'd' then
			CONTROL.R = 1
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 1
		elseif KEY:lower() == 'q' then
			CONTROL.E = -1
		end
	end
	local function onKeyRelease(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end
	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
		if not processed and input.UserInputType == Enum.UserInputType.Keyboard then
			onKeyPress(input.KeyCode.Name)
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			onKeyRelease(input.KeyCode.Name)
		end
	end)
	FLY()
end

local function stopFlying()
	if not isFlying then
		return
	end
	isFlying = false
	if Player.Character:FindFirstChildOfClass('Humanoid') then
		Player.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
end

local function startSpinning()
	local character = Player.Character or Player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	for _, v in pairs(humanoidRootPart:GetChildren()) do
		if v:IsA("BodyAngularVelocity") then
			v:Destroy()
		end
	end
	local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
	bodyAngularVelocity.Name = "Spinning"
	bodyAngularVelocity.Parent = humanoidRootPart
	bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
	local angularVelocityMagnitude = math.rad(spinSpeed) * 300
	bodyAngularVelocity.AngularVelocity = Vector3.new(0, angularVelocityMagnitude, 0)
end

local function stopSpinning()
	local character = Player.Character
	if not character then
		return
	end
	for _, v in pairs(character.HumanoidRootPart:GetChildren()) do
		if v:IsA("BodyAngularVelocity") then
			v:Destroy()
		end
	end
end
---------------------- FLY 기능 ------------------------------
---------------------- Noclip 기능 ------------------------------

local function setNoclip(value)
	noclip = value
	if noclip then
		while noclip do
			if noclip and Player.Character then
				for _, child in pairs(Player.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide then
						child.CanCollide = false
					end
				end
			end
			task.wait(0.1)
		end
	else
		for _, child in pairs(Player.Character:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CanCollide = true
			end
		end
	end
end
---------------------- Noclip 기능 ------------------------------
----------------------- ACS CE -----------------------------

function ACS_ALL_KILL()
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		if p ~= Player and p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
			for _, g in pairs(Player.Backpack:GetChildren()) do
				if g:IsA("Tool") and g:FindFirstChild("ACS_Settings") then
					ReplicatedStorage.ACS_Engine.Events.Damage:InvokeServer(
					g,
					p.Character:FindFirstChildOfClass("Humanoid"),
					1,
					1,
					require(g.ACS_Settings),
					{
						camRecoilMod = {
							RecoilTilt = 1,
							RecoilUp = 1,
							RecoilLeft = 1,
							RecoilRight = 1
						},
						gunRecoilMod = {
							RecoilUp = 1,
							RecoilTilt = 1,
							RecoilLeft = 1,
							RecoilRight = 1
						},
						ZoomValue = 70,
						Zoom2Value = 70,
						AimRM = 1,
						SpreadRM = 1,
						DamageMod = 5,
						minDamageMod = 5,
						MinRecoilPower = 1,
						MaxRecoilPower = 1,
						RecoilPowerStepAmount = 1,
						MinSpread = 1,
						MaxSpread = 1,
						AimInaccuracyStepAmount = 1,
						AimInaccuracyDecrease = 1,
						WalkMult = 1,
						adsTime = 1,
						MuzzleVelocity = 1
					},
					nil,
					nil,
					ReplicatedStorage.ACS_Engine.Events.AcessId:InvokeServer(Player.UserId) .. "-" .. Player.UserId
				)
				end
			end
		end
	end
end

local ACS_mouseClick_Breach

function ACS_Click_Breach_ON(ACS_X, ACS_Y, ACS_Z)
	local Mouse = Player:GetMouse()
	local PlaceBlockRemote = ReplicatedStorage:WaitForChild("ACS_Engine"):WaitForChild("Events"):WaitForChild("Breach")
	if not ACS_mouseClick_Breach then  -- 이미 연결되어 있는지 확인
		ACS_mouseClick_Breach = Mouse.Button1Down:Connect(function()
			local clickPosition = Mouse.Hit.p
			Player.Character.ACS_Client.Kit.Fortifications.Value = 1000
			local x = tonumber(ACS_X) or 10
			local y = tonumber(ACS_Y) or 10
			local z = tonumber(ACS_Z) or 10
			local args = {
				[1] = 3,
				[2] = {
					Fortified = {
						Value = true
					},
					Destroyable = workspace
				},
				[3] = clickPosition,
				[4] = nil,
				[5] = {
					Size = Vector3.new(x, y, z),
					CFrame = CFrame.new(clickPosition)
				}
			}
			PlaceBlockRemote:InvokeServer(unpack(args))
		end)
		print("마우스 이벤트 활성화됨.")
	else
		print("이미 마우스 이벤트가 활성화되어 있습니다.")
	end
end

function ACS_Click_Breach_OFF()
	local Mouse = Player:GetMouse()

	local PlaceBlockRemote = ReplicatedStorage:WaitForChild("ACS_Engine"):WaitForChild("Events"):WaitForChild("Breach")
	if ACS_mouseClick_Breach then
		ACS_mouseClick_Breach:Disconnect()
		ACS_mouseClick_Breach = nil
		print("마우스 이벤트 비활성화됨.")
	else
		print("마우스 이벤트가 이미 비활성화되어 있습니다.")
	end
end

function ACS_Player_fli()
	local Mouse = Player:GetMouse()
    
    -- 블록 설치를 요청하는 원격 함수 가져오기
	local PlaceBlockRemote = ReplicatedStorage:WaitForChild("ACS_Engine"):WaitForChild("Events"):WaitForChild("Breach")

    -- 서버에 블록 설치 요청 보내기
	local args = {
		[1] = 3, -- 모드 (예: 설치 모드 ID)
		[2] = { -- BreachPlace 객체 생성
			Fortified = {
				Value = true
			},
			Destroyable = workspace
		},
		[3] = game:GetService("Workspace").Aerilo8860.HumanoidRootPart.Position, -- 유저 위치 사용
		[4] = nil,
		[5] = { -- Hit 객체 생성 (예시)
			Size = Vector3.new(100000, 100000, 100000),
			CFrame = CFrame.new(game:GetService("Workspace").Aerilo8860.HumanoidRootPart.Position)
		}
	}
	PlaceBlockRemote:InvokeServer(unpack(args))
end

local function ACS_Player_fli2()
	local a = game:GetService("Players").LocalPlayer
	local b = a:GetMouse()
	local c = ReplicatedStorage:WaitForChild("ACS_Engine"):WaitForChild("Events"):WaitForChild("Breach")
	b.Button1Down:Connect(function()
		local d = b.Hit.p
		a.Character.ACS_Client.Kit.Fortifications.Value = 1000
		c:InvokeServer(
        3,
        {
			Fortified = {
				Value = true
			},
			Destroyable = workspace
		},
        d,
        nil,
        {
			Size = Vector3.new(999999999999999, 9999999999999999999999, 99999999999999999999),
			CFrame = CFrame.new(d)
		}
    )
	end)
end



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local CEset = false
local CE_EX_target_Kill_sw = false
local CE_EX_target = nil
local explosiveEvent = nil
local mouseClickHandler = nil

-- 설정값을 포함하는 테이블 정의
local globalConfig = {
	C4BlastPressure = 10, -- 필요한 값으로 설정
	C4BlastRadius = 20, -- 필요한 값으로 설정
	C4DestroyJointRadius = 5, -- 필요한 값으로 설정
	C4ExplosionType = "ExplosionTypeExample", -- 필요한 값으로 설정
	C4DeletePart = false -- 필요한 값으로 설정
}

local Events = {}

function CEKill_ALL()
	for idx, plr in pairs(Players:GetPlayers()) do
		if plr ~= Players.LocalPlayer then
			Events["DamageEvent"]:FireServer(plr.Character:FindFirstChild("Humanoid"), 100000, "Torso", {
				'nil',
				'Auth',
				'nil',
				'nil'
			})
		end
	end
end

function CEsetup()
	local CResource = ReplicatedStorage:WaitForChild("CarbonResource", 3)
	Players.LocalPlayer.Character.Humanoid.Health = 0
	task.wait(0.3)
	for idx, remote in pairs(CResource.Events:GetChildren()) do
		Events[remote.Name] = remote
	end
	print(Events["DamageEvent"])
	CEset = true -- CEsetup이 완료되면 CEset을 true로 설정합니다.
end

local function setupMouseClickHandler()
	if CEset then
		-- CarbonResource와 Events 폴더를 가져옵니다.
		local explosiveEvent = Events["ExplosiveEvent"]

		-- 마우스 클릭 이벤트를 처리하는 함수
		local function handleMouseClick()
			local mouse = player:GetMouse()
			-- 클릭된 좌표를 월드 좌표로 변환합니다.
			local worldPosition = mouse.Hit.p
			if explosiveEvent then
				Events["ExplosiveEvent"]:FireServer("Xsi-On-Top", worldPosition, 50000, 10, 10, nil, nil, nil, nil, nil, nil, nil, "Auth")
			else
				warn("ExplosiveEvent not found in Events folder.")
			end
		end

		-- 마우스 클릭 이벤트를 처리합니다.
		mouseClickHandler = player:GetMouse().Button1Down:Connect(handleMouseClick)
	end
end

local function cancelMouseEvents()
	if mouseClickHandler then
		mouseClickHandler:Disconnect()
		mouseClickHandler = nil
	end
end

local function CE_EX_ALL_KILL()
    -- 모든 플레이어의 위치를 가져옵니다.
	if CEset then
		local allPlayers = Players:GetPlayers()
		for _, p in pairs(allPlayers) do
			if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
				local playerPosition = p.Character.HumanoidRootPart.Position
                -- ExplosiveEvent 발사 (전역 Events 사용)
				if Events["ExplosiveEvent"] then
					Events["ExplosiveEvent"]:FireServer("Xsi-On-Top", playerPosition, 50000, 10, 10, nil, nil, nil, nil, nil, nil, nil, "Auth")
				else
					warn("ExplosiveEvent not found in Events folder.")
				end
			end
		end
	end
end


local function CE_EX_Select_KILL()
	if CEset then 
        -- CarbonResource에서 Events 폴더를 찾습니다.
		local eventsFolder = ReplicatedStorage:FindFirstChild("CarbonResource") and ReplicatedStorage.CarbonResource:FindFirstChild("Events")
		local explosiveEvent = eventsFolder and eventsFolder:FindFirstChild("ExplosiveEvent")
		if not explosiveEvent then
			warn("ExplosiveEvent not found in Events folder.")
			return -- explosiveEvent가 없으면 함수를 종료합니다.
		end

        -- 무한 루프를 시작합니다.
		while CE_EX_target_Kill_sw do
            -- DisplayName을 기반으로 플레이어 객체를 찾습니다.
			local targetPlayer = nil
			for _, player in pairs(game.Players:GetPlayers()) do
				if player.Name == CE_EX_target then
					targetPlayer = player
					break
				end
			end
            
            -- 타겟 플레이어가 존재하고, 캐릭터가 있으며, HumanoidRootPart가 있는지 확인합니다.
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local playerPosition = targetPlayer.Character.HumanoidRootPart.Position

                -- explosiveEvent가 존재할 때만 FireServer를 호출합니다.
				explosiveEvent:FireServer(
                    nil, -- 첫 번째 인자는 명확하지 않으므로 nil로 설정
                    playerPosition, -- 플레이어의 위치를 사용
                    globalConfig.C4BlastPressure,
                    globalConfig.C4BlastRadius,
                    globalConfig.C4DestroyJointRadius,
                    globalConfig.C4ExplosionType,
                    globalConfig.C4DeletePart,
                    character,
                    nil,
                    nil,
                    nil,
                    nil,
                    "Auth", -- 인증 토큰, 원본 코드에 있는 값 사용
                    nil
                )
			else
				warn("Target player not found or does not have a character or HumanoidRootPart.")
				break -- 대상 플레이어나 HumanoidRootPart가 없으면 루프를 종료합니다.
			end
			wait(3)
		end
	end
end


----------------------- ACS CE -----------------------------
---------------------- 부대게임, 팽부대 시작 ------------------------------

-- 수갑을 소유한 플레이어를 찾는 함수
local function findPlayerWithCuffs()
	for _, player in ipairs(Players:GetPlayers()) do
		local backpack = player:FindFirstChild("Backpack")
		if backpack and backpack:FindFirstChild("수갑") then
			return player
		end
	end
	return nil
end

-- 특정 플레이어에게 수갑을 거는 함수
local function cuffSpecificPlayer()
	local playerWithCuffs = findPlayerWithCuffs()
	if not playerWithCuffs then
		print("No player with handcuffs found.")
		return
	end
	local targetPlayer = Players:FindFirstChild(userName)
	if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
		print("Target player or target player's character or head is nil")
		return
	end
	local backpack = playerWithCuffs:FindFirstChild("Backpack")
	local cuffs = backpack and backpack:FindFirstChild("수갑")
	if cuffs and cuffs:FindFirstChild("RemoteEvent") then
		local remoteEvent = cuffs.RemoteEvent
		local args = {
			[1] = "Cuff",
			[2] = targetPlayer.Character.Head
		}
		local success, err = pcall(function()
			remoteEvent:FireServer(unpack(args))
		end)
		if not success then
			warn("Error firing RemoteEvent for:", targetPlayer.Name, err)
		end
	else
		print("Player with cuffs does not have the RemoteEvent.")
	end
end

-- 모든 플레이어를 수갑으로 묶는 함수
local function cuffAllPlayers()
	local playerWithCuffs = findPlayerWithCuffs()
	if playerWithCuffs then
		local backpack = playerWithCuffs:FindFirstChild("Backpack")
		local cuffs = backpack and backpack:FindFirstChild("수갑")
		if cuffs and cuffs:FindFirstChild("RemoteEvent") then
			local remoteEvent = cuffs.RemoteEvent
			for _, targetPlayer in ipairs(Players:GetPlayers()) do
				if targetPlayer ~= playerWithCuffs and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and Player ~= targetPlayer then
					local args = {
						[1] = "Cuff",
						[2] = targetPlayer.Character.Head
					}
					local success, err = pcall(function()
						remoteEvent:FireServer(unpack(args))
					end)
					if not success then
						warn("Error firing RemoteEvent for:", targetPlayer.Name, err)
					end
					wait(0.1) -- 요청이 서버에서 처리되도록 지연
				end
			end
		else
			print("Player with cuffs does not have the RemoteEvent.")
		end
	else
		print("No player with handcuffs found.")
	end
end
-- all kill no gun(tysm, chae.r1n_1023(1233758469425725460))
function fanggluv()
	local getGun = function()
		local GunScript_Server = workspace:FindFirstChild("GunScript_Server", true) or Players:FindFirstChild("GunScript_Server", true)
		if GunScript_Server then
			return GunScript_Server
		end
		return nil
	end
	while task.wait() do
		for i, v in pairs(Players:GetPlayers()) do
			local gun = getGun()
			pcall(function()
				gun.InflictTarget:FireServer(
            v.Character.Humanoid,
            v.Character.HumanoidRootPart,
            math.huge, Vector3.new(0, 0, 0), math.huge, 69697474, true
        )
			end)
		end
	end
end
---------------------- 부대게임, 팽부대 끝 ------------------------------
---------------------- 부대게임, 밥밥부대 시작 ------------------------------
-- 밥밥 부대
local LocalPlayer = Players.LocalPlayer

local teleportingStatic = false  -- Static cuff 기능의 상태를 추적하는 변수

local outOfWorldPosition = Vector3.new(98.03588104248047, -17.422523498535156, -61.581932067871094)
local cuffRange = 50  -- 수갑 채울 수 있는 범위
local teleportSpeed = 50  -- 텔레포트 속도 조정 (값을 낮춤)

local swordAttackEnabled = false -- swordattack 기능 상태
local increaseSize = false -- 작대기 크기 증가 상태
local isGlockAllKillEnabled = false -- 글록 ALL KILL 함수 정의

-- 텔레포트 위치 설정
local targetPosition = Vector3.new(238.11863708496094, -18.850393295288086, 222.54690551757812)

local function GlockAllKill()
	if not isGlockAllKillEnabled then
		return
	end  -- 스위치가 꺼져 있으면 아무것도 하지 않음
	local targetPlayer = LocalPlayer
    
    -- 체크: 플레이어가 존재하는지 확인
	if not targetPlayer then
		warn("Target player not found")
		return
	end

    -- 체크: 총을 들고 있는지 확인
	local gun = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Glock 17")
	if not gun then
		warn(targetPlayer.Name .. " is not holding the gun")
		return
	end

    -- 팀이 다른 모든 플레이어에게 데미지를 입히는 루프
	while isGlockAllKillEnabled do
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= targetPlayer and player.Team ~= targetPlayer.Team then
				local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
				if humanoid and humanoidRootPart and gun then
                    -- 20번 데미지를 입히는 루프
					for i = 1, 20 do
						if humanoid and humanoid.Health and humanoid.Health > 0 then
							local args = {
								[1] = "Gun",
								[2] = gun,
								[3] = {
									["ModuleName"] = "1",
									["ChargeAlterTable"] = {},
									["BaseDamage"] = 20,
								},
								[4] = humanoid,
								[5] = humanoidRootPart,
								[6] = humanoidRootPart,
								[7] = {
									["ChargeLevel"] = 0,
									["ExplosionEffectFolder"] = ReplicatedStorage.Miscs.GunVisualEffects.Common.ExplosionEffect,
									["BloodEffectFolder"] = ReplicatedStorage.Miscs.GunVisualEffects.Common.BloodEffect,
									["HitEffectFolder"] = ReplicatedStorage.Miscs.GunVisualEffects.Common.HitEffect,
									["MuzzleFolder"] = ReplicatedStorage.Miscs.GunVisualEffects.Common.MuzzleEffect,
									["GoreEffect"] = ReplicatedStorage.Miscs.GunVisualEffects.Common.GoreEffect
								}
							}
							local success, errorMessage = pcall(function()
								ReplicatedStorage.Remotes.InflictTarget:InvokeServer(unpack(args))
							end)
							if not success then
								warn("Error invoking server:", errorMessage)
							end
							if humanoid.Health <= 0 then
								print(player.Name .. " has been killed.")
								break
							end
						else
							warn("Humanoid is nil, health is invalid, or player is dead:", player.Name)
							break
						end
					end
				else
					warn("Humanoid, HumanoidRootPart, or Gun not found for player:", player.Name)
				end
			end
		end
		wait()
	end
end

local function stopGlockAllKill()
	isGlockAllKillEnabled = false
end

-- "Glock 17"이라는 이름의 도구가 캐릭터에 장착되었을 때 이벤트를 감지하는 함수
local function onToolEquipped(tool)
	if tool.Name == "Glock 17" and isGlockAllKillEnabled then
		GlockAllKill() -- 총을 들었을 때 모든 플레이어를 죽이는 함수 호출
	end
end

-- 텔레포트 함수
local function teleportToPosition(position)
	local character = Player.Character or Player.CharacterAdded:Wait()
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	humanoidRootPart.CFrame = CFrame.new(position)
	local VirtualInputManager = game:GetService('VirtualInputManager')
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
	wait(3)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- 무기 크기 조절 함수
local function adjustWeaponSize(increase)
	local character = LocalPlayer.Character
	if not character then
		return
	end
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
			local handle = tool.Handle
			local tool_size_i = handle.Size
			if increase then
				handle.Size = Vector3.new(100, 100, 100) -- 작대기 크기 증가
			else
				handle.Size = tool_size_i -- 기본 크기로 돌아감
			end
		end
	end
end
local LocalPlayer = Players.LocalPlayer

-- 상태 플래그
local isProcessing = false

-- 수갑 자동 장착 함수
local function equipCuffs()
	local backpack = LocalPlayer.Backpack
	if backpack then
		local tools = backpack:GetChildren()
		if #tools >= 5 then
			local cuffs = tools[5]  -- 5번째 슬롯에 있는 도구 선택
			if cuffs:IsA("Tool") then
				LocalPlayer.Character.Humanoid:EquipTool(cuffs)  -- 수갑 장착
			end
		else
			print("인벤토리에 5번 슬롯까지 도구가 충분하지 않습니다.")
		end
	end
end

-- 수갑을 채우는 함수
local function tryToCuffPlayer(player)
	local Cuffs = LocalPlayer.Character:FindFirstChild("Cuffs.")
	local CuffRemote = Cuffs and Cuffs:FindFirstChild("CuffsRemote")
	if player and player.Character and CuffRemote then
		local args = {
			[1] = player.Character
		}
		CuffRemote:FireServer(unpack(args))
		print("Attempting to cuff " .. player.Name)
		return true
	end
	return false
end

-- 캐릭터의 충돌 및 중력 비활성화 함수
local function disableCollisionsAndGravity(character)
	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
			part.Anchored = false
		end
	end
	character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
end

-- 캐릭터의 충돌 및 중력 활성화 함수
local function enableCollisionsAndGravity(character)
	for _, part in pairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = true
			part.Anchored = false
		end
	end
	character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
end

-- 매우 빠르게 이동하는 함수
local function fastMoveToPosition(character, targetPosition)
	local localHumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if localHumanoidRootPart then
		disableCollisionsAndGravity(character)
		local speed = 100
		local direction = (targetPosition - localHumanoidRootPart.Position).unit
		local lastDistance = (localHumanoidRootPart.Position - targetPosition).magnitude
		while lastDistance > 1 and isProcessing do
			localHumanoidRootPart.CFrame = localHumanoidRootPart.CFrame + direction * speed
			wait(0.01)
			local currentDistance = (localHumanoidRootPart.Position - targetPosition).magnitude
			if currentDistance > lastDistance then
				localHumanoidRootPart.CFrame = CFrame.new(targetPosition)
				break
			end
			lastDistance = currentDistance
		end
		enableCollisionsAndGravity(character)
		return true
	end
	return false
end

-- 가장 가까운 플레이어를 찾는 함수
local function getClosestPlayer()
	local localHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local closestPlayer = nil
	local closestDistance = math.huge
	for _, targetPlayer in ipairs(Players:GetPlayers()) do
		if targetPlayer ~= LocalPlayer and targetPlayer.Character then
			local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
			if targetHumanoidRootPart then
				local distance = (targetHumanoidRootPart.Position - localHumanoidRootPart.Position).Magnitude
				if distance < closestDistance then
					closestDistance = distance
					closestPlayer = targetPlayer
				end
			end
		end
	end
	return closestPlayer
end

-- 수갑을 풀어주는 함수
local function releaseCuffs(player)
	local Cuffs = LocalPlayer.Character:FindFirstChild("Cuffs.")
	local CuffRemote = Cuffs and Cuffs:FindFirstChild("CuffsRemote")
	if player and player.Character and CuffRemote then
		local args = {
			[1] = player.Character
		}
		CuffRemote:FireServer(unpack(args))
		print("Released cuffs on " .. player.Name)
	end
end

-- 모든 플레이어를 처리하는 함수
local function processAllPlayers()
	local outOfWorldPosition = Vector3.new(98.03588104248047, -17.422523498535156, -61.581932067871094)
	local cuffRange = 50
	local originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
	isProcessing = true
	while isProcessing do
		local targetPlayer = getClosestPlayer()
		if not targetPlayer then
			print("No players left to process.")
			break
		end
		local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		local localHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if targetHumanoidRootPart and localHumanoidRootPart then
			local success = false
			while not success and isProcessing do
				localHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
				print("Teleported to " .. targetPlayer.Name .. "'s position")
				local distance = (targetHumanoidRootPart.Position - localHumanoidRootPart.Position).Magnitude
				if distance <= cuffRange then
					success = tryToCuffPlayer(targetPlayer)
				end
				wait(0.1)
			end
			wait(0.5)
			if fastMoveToPosition(LocalPlayer.Character, outOfWorldPosition) then
				print("Moved to the out-of-world position.")
				releaseCuffs(targetPlayer)
				wait(0.1)
				print("Waiting 2 seconds before returning to original position.")
				wait(1)
				if LocalPlayer.Character and originalPosition then
					LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = originalPosition
					print("Teleported back to original position.")
				end
			end
			wait(0.1)
		end
	end
end

-- 모든 로직을 실행하는 함수
local function babbab_Kick_Cuff_ON()
	equipCuffs()
	processAllPlayers()
end

-- 중간에 로직을 멈추는 함수
local function babbab_Kick_Cuff_OFF()
	isProcessing = false  -- 플래그를 설정하여 루프와 작업을 멈춥니다.
	print("Processing halted.")
end

-- 캐릭터가 추가될 때마다 스크립트 실행 및 수갑 자동 장착
local function onCharacterAdded()
	wait(1)
	equipCuffs()
	babbab_Kick_Cuff_ON()
end

---------------------- 부대게임, 밥밥부대 끝 ------------------------------
---------------------- 부대게임, 태비부대 ------------------------------
function Toggle_Tebi_tool_giver_f()
	local added = {}
	local toolNames = {
		["NULL"] = true,
		["엘더플레임 AK74"] = true,
		["프로토타입 AK12"] = true,
		["관통기"] = true,
		["프로토타입-S"] = true,
		["새해 K2"] = true,
		["프라임 벤달"] = true,
		["스피커 K2"] = true,
		["외교부 키"] = true
	}

	for _, tool in pairs(game:GetDescendants()) do
		if tool:IsA("Tool") and toolNames[tool.Name] and not added[tool.Name] then
			tool:Clone().Parent = player.Backpack
			added[tool.Name] = true
		end
	end
end

function Toggle_Tebi_vote_f()
	local function FNDR_fake_script()
		local function visui(ui)
			if ui.Enabled and ui:FindFirstChildWhichIsA("Frame") and ui:FindFirstChildWhichIsA("Frame").Visible then
				ui.Enabled = false
				ui:FindFirstChildWhichIsA("Frame").Visible = false
				return
			end
			if ui.Parent ~= game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") then
				ui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
			end
			ui.Enabled = true
			if ui:FindFirstChildWhichIsA("Frame") then
				ui:FindFirstChildWhichIsA("Frame").Visible = true
			end
		end
		local function showElectionUI()
			for i, v in pairs(game:GetDescendants()) do
				if v:IsA("ScreenGui") and v.Name == "선거 시스템" then
					visui(v)
				end
			end
		end
    
        -- 스크립트 실행 시 바로 선거 UI를 가져옴
		showElectionUI()
	end
	FNDR_fake_script()
end
---------------------- 부대게임, 태비부대 ------------------------------
---------------------- 부대게임, 샤크부대 ------------------------------
-- 샤크부대

-- 수갑을 소유한 플레이어를 찾는 함수
local function findPlayerWithCuffs()
	for _, p in ipairs(Players:GetPlayers()) do
		local cuffs = p:FindFirstChild("Backpack") and p.Backpack:FindFirstChild("수갑")
		if cuffs then
			return cuffs
		end
	end
end

-- 모든 플레이어를 수갑으로 묶는 함수
local function cuffAllPlayersa()
	local cuffs = findPlayerWithCuffs()
	if not cuffs or not cuffs:FindFirstChild("RemoteEvent") then
		print("No player with handcuffs or RemoteEvent found.")
		return
	end

	local remote = cuffs.RemoteEvent
	for _, target in ipairs(Players:GetPlayers()) do
		local head = target.Character and target.Character:FindFirstChild("Head")
		if target ~= Player and head then
			local success, err = pcall(remote.FireServer, remote, "Cuff", head)
			if not success then
				warn("Error firing RemoteEvent for:", target.Name, err)
			end
			task.wait(0.1)
		end
	end
end

---------------------- 부대게임, 샤크부대 ------------------------------

local function showMessage(mass)
	Rayfield:Notify({
		Title = "IWV hub",
		Content = tostring(mass) .. "이(가) 실행 되었습니다!",
		Duration = 5,
		Image = "info"
	})
end
---------------------- 기본기능 모음 탭 1 ------------------------
local FlingUser_Name = nil
local Tab = Window:CreateTab("Standerd Cheats", "user-cog")

Tab:CreateSection("Cheats")
Tab:CreateDivider()

Tab:CreateToggle({
	Name = "WalkSpeed",
	CurrentValue = false,
	Callback = function(Value)
		ahh = Value
		if ahh then
			showMessage("Speed :" .. tostring(Value))
			Player.Character.Humanoid.WalkSpeed = Speedy
		else
			showMessage("Speed :" .. tostring(Value))
			Player.Character.Humanoid.WalkSpeed = defaultSpeeddddddd
		end
	end,
})

Tab:CreateToggle({
	Name = "JumpPower",
	CurrentValue = false,
	Callback = function(Value)
		ahhh = Value
		if ahhh then
			showMessage("JumpPower :" .. tostring(Value))
			Player.Character.Humanoid.JumpPower = Jumppy
		else
			showMessage("JumpPower :" .. tostring(Value))
			Player.Character.Humanoid.JumpPower = defaultJumppyyyyy
		end
	end,
})

Tab:CreateToggle({
	Name = "FOV",
	CurrentValue = false,
	Callback = function(Value)
		ahhhh = Value
		if ahhhh then
			showMessage("FOV :" .. tostring(Value))
			workspace.CurrentCamera.FieldOfView = Fov
		else
			showMessage("FOV :" .. tostring(Value))
			workspace.CurrentCamera.FieldOfView = defaultFov
		end
	end,
})

Tab:CreateToggle({
	Name = "Auto Rejoin",
	CurrentValue = false,
	Callback = function(abcde)
		getgenv().autorj = abcde
		showMessage("Auto Rejoin : " .. tostring(abcde))
	end,
})

Tab:CreateToggle({
	Name = "LocalScript AntiKick",
	CurrentValue = false,
	Callback = function(abcd)
		getgenv().iwvhubreborn = abcd
		showMessage("LocalScript AntiKick : " .. tostring(abcd))
	end,
})

Tab:CreateToggle({
	Name = "Fly",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			showMessage("Fly :" .. tostring(Value))
			startFlying()
		else
			showMessage("Fly :" .. tostring(Value))
			stopFlying()
		end
	end,
})

Tab:CreateToggle({
	Name = "Noclip",
	CurrentValue = false,
	Callback = function(Value)
		showMessage("Noclip : " .. tostring(Value))
		setNoclip(Value)
	end,
})

Tab:CreateToggle({
	Name = "Spin",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			showMessage("Spin : " .. tostring(Value))
			startSpinning()
		else
			stopSpinning()
		end
	end,
})

Tab:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			showMessage("ESP : " .. tostring(Value))
			espEnabled = true
			while espEnabled do
				applyESP()
				wait(1)
			end
		else
			showMessage("ESP : " .. tostring(Value))
			espEnabled = false
			removeESP()
		end
	end,
})

Tab:CreateButton({
	Name = "모든 플레이어 날리기 (플레이어 끼리 통과되면 안 됨)",
	Callback = function()
		showMessage("Fling")
		loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
	end
})

Tab:CreateButton({
	Name = "특정 플레이어 날리기 (플레이어 끼리 통과되면 안 됨)",
	Callback = function()
		Select_Fling_Player(FlingUser_Name)
	end
})

Tab:CreateInput({
	Name = "특정 플레이어 이름",
	RemoveTextAfterFocusLost = false,
	PlaceholderText = "Enter UserName here",
	Callback = function(text)
		FlingUser_Name = findPlayerDisplayName(text) -- 입력받는 텍스트 사용
	end
})

Tab:CreateButton({
	Name = "Rejoin",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
	end
})

Tab:CreateToggle({
	Name = "Chat Spammer",
	CurrentValue = false,
	Callback = function(messi)
		getfenv().bunnilol = messi
		if not SpamTextttttt or SpamTextttttt == "" then
			print("pls setting text first :)")
			return
		end
		if messi then
			task.spawn(function()
				while getfenv().bunnilol do
					task.wait(.2)
					game.TextChatService.TextChannels.RBXGeneral:SendAsync(SpamTextttttt)
				end
			end)
		end
	end,
})

Tab:CreateInput({
	Name = "Spam Text",
	RemoveTextAfterFocusLost = false,
	PlaceholderText = "Enter Text here",
	Callback = function(aaaaaaaaa)
		SpamTextttttt = aaaaaaaaa
	end
})

Tab:CreateSection("Control")
Tab:CreateDivider()

Tab:CreateSlider({
	Name = "WalkSpeed",
	Range = {
		0,
		150
	},
	Increment = 1,
	Suffix = "",
	CurrentValue = Speedy,
	Callback = function(value)
		Speedy = value
		if ahh then
			Player.Character.Humanoid.WalkSpeed = Speedy
		end
	end
})

Tab:CreateSlider({
	Name = "JumpPower",
	Range = {
		0,
		150
	},
	Increment = 1,
	Suffix = "",
	CurrentValue = Jumppy,
	Callback = function(cr7)
		Jumppy = cr7
		if ahhh then
			Player.Character.Humanoid.JumpPower = Jumppy
		end
	end
})
Tab:CreateSlider({
	Name = "FOV",
	Range = {
		1,
		120
	},
	Increment = 1,
	Suffix = "",
	CurrentValue = Fov,
	Callback = function(Value)
		Fov = Value
		if ahhhh then
			workspace.CurrentCamera.FieldOfView = Fov
		end
	end
})
Tab:CreateSlider({
	Name = "Fly Speed",
	Range = {
		0,
		20
	},
	Increment = 1,
	Suffix = "%",
	CurrentValue = 5,
	Callback = function(value)
		flySpeed = value
	end
})

Tab:CreateSlider({
	Name = "Spin Speed",
	Range = {
		0,
		50
	},
	Increment = 1,
	Suffix = "%",
	CurrentValue = 5,
	Callback = function(value)
		spinSpeed = value
	end
})

Tab:CreateSection("Tools")
Tab:CreateDivider()

Tab:CreateButton({
	Name = "Transparency (투명 H)",
	Callback = function()
		Transparency_toggle_bt(true)
	end
})

Tab:CreateButton({
	Name = "Click TP",
	Callback = function()
		local a = Player:GetMouse()
		local b = Instance.new("Tool")
		b.RequiresHandle = false
		b.Name = "Tool"
		b.Activated:Connect(function()
			local c = a.Hit + Vector3.new(0, 2.5, 0)
			local d = CFrame.new(c.X, c.Y, c.Z)
			Player.Character.HumanoidRootPart.CFrame = d
		end)
		b.Parent = Player.Backpack
	end,
})

---------------------- ACS Engine & CE Engine 탭 2 ------------------------
local Tab2 = Window:CreateTab("ACS Engine & CE Engine", "crosshair")

Tab2:CreateSection("ACS Engine")
Tab2:CreateDivider()

Tab2:CreateButton({
	Name = "ACS 체크",
	Callback = function()
		if not ReplicatedStorage:FindFirstChild("ACS_Engine") then
			print("ACS 엔진이 아님")
		end
		if ReplicatedStorage:FindFirstChild("ACS_Engine") then
			print("ACS 엔진이 있음")
		end
	end
})

local ACS_X, ACS_Y, ACS_Z

Tab2:CreateToggle({
	Name = "ACS 블록설치 (10개만 설치가능 + 죽으면 10개로 초기화)",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			showMessage("ACS_Breach : " .. tostring(Value))
			ACS_Click_Breach_ON(ACS_X, ACS_Y, ACS_Z)
		else
			showMessage("ACS_Breach : " .. tostring(Value))
			ACS_Click_Breach_OFF()
		end
	end,
})

Tab2:CreateInput({
	Name = "X",
	PlaceholderText = "Enter X here (가로)",
	RemoveTextAfterFocusLost = false,
	Callback = function(text)
		ACS_X = text -- 입력받는 텍스트 사용
	end
})
Tab2:CreateInput({
	Name = "Y",
	RemoveTextAfterFocusLost = false,
	PlaceholderText = "Enter Y here (높이)",
	Callback = function(text)
		ACS_Y = text -- 입력받는 텍스트 사용
	end
})
Tab2:CreateInput({
	Name = "Z",
	RemoveTextAfterFocusLost = false,
	PlaceholderText = "Enter Z here (세로)",
	Callback = function(text)
		ACS_Z = text
	end
})

Tab2:CreateButton({
	Name = "ACS 모든 플레이어 내보내기 (벽 설치)",
	Callback = function()
		showMessage("벽 소환!!")
		ACS_Player_fli2()
	end
})

Tab2:CreateToggle({
	Name = "ACS 소리테러",
	CurrentValue = false,
	Callback = function(state)
		getfenv().ACS_whizz = state
		if state then
			task.spawn(function()
				while getfenv().ACS_whizz do
					task.wait()
					for a, b in ipairs(game.Players:GetPlayers()) do
						game.ReplicatedStorage.ACS_Engine.Events.Whizz:FireServer(b)
					end
				end
			end)
		end
	end,
})

Tab2:CreateToggle({
	Name = "ACS 렉",
	CurrentValue = false,
	Callback = function(state)
		getfenv().ACS_laggy = state
		if state then
			task.spawn(function()
				while getfenv().ACS_laggy do
					task.wait()
					local gun = game.ReplicatedStorage.ACS_Engine.GunModels:FindFirstChildOfClass("Model")
					if gun then
						for i = 1, getgenv().AWP_exitscam do
							game.ReplicatedStorage.ACS_Engine.Events.Equip:FireServer({
								Name = gun.Name
							}, 1)
						end
					end
				end
			end)
		end
	end,
})

Tab2:CreateSlider({
	Name = "ACS 렉 파워",
	Range = {
		1,
		100
	},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Callback = function(hello)
		getgenv().AWP_exitscam = hello
	end,
})

Tab2:CreateToggle({
	Name = "ACS 화면테러(약)",
	CurrentValue = false,
	Callback = function(state)
		getfenv().lemon = state
		if state then
			task.spawn(function()
				while getfenv().lemon do
					task.wait()
					for a, b in ipairs(game.Players:GetPlayers()) do
						game.ReplicatedStorage.ACS_Engine.Events.Suppression:FireServer(b, 1)
					end
				end
			end)
		end
	end,
})

-- 섹션 1: 
Tab2:CreateSection("CE Engine")
Tab2:CreateDivider()

Tab2:CreateButton({
	Name = "CE 이벤트 경로 설정 ( 반드시 먼저 하세요 )",
	Callback = function()
		showMessage("CE Event SetUp")
		CEsetup()
	end
})

Tab2:CreateToggle({
	Name = "CE 클릭폭발",
	CurrentValue = false,
	Callback = function(Value)
		if Value then
			setupMouseClickHandler()
		else
			cancelMouseEvents()
		end
		showMessage("CE_Click : " .. tostring(Value))
	end,
})

Tab2:CreateButton({
	Name = "CE ALL KILL",
	Callback = function()
		CEKill_ALL()
		showMessage("CE_All Kill")
	end
})

Tab2:CreateButton({
	Name = "CE 폭발 ALL KILL",
	Callback = function()
		CE_EX_ALL_KILL()
		showMessage("CE_Ex_AllKill")
	end
})

Tab2:CreateToggle({
	Name = "CE Select KILL",
	Callback = function(Value)
		if Value then
			CE_EX_target_Kill_sw = true
			CE_EX_Select_KILL()
		else
			CE_EX_target_Kill_sw = false
		end
		showMessage("CE_EX_target_Kill : " .. tostring(Value))
	end,
})

Tab2:CreateInput({
	Name = "죽일 플레이어 이름",
	PlaceholderText = "죽일 플레이어 이름 입력",
	Callback = function(text)
		CE_EX_target = findPlayerDisplayName(text)
	end
})

---------------------- 부대 스크립트 모음 탭 3 ------------------------
local Tab3 = Window:CreateTab("부대 스크립트 모음", "shield-ban")

Tab3:CreateSection("팽 부대")

Tab3:CreateInput({
	Name = "Select KILL name",
	CurrentValue = "",
	PlaceholderText = "Target Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(ppppppp)
		fanggggggggggggggggggggggggg = findPlayerDisplayName2(ppppppp)
	end,
})

Tab3:CreateDivider()

Tab3:CreateButton({
	Name = "ALL Cuff",
	Callback = function()
		showMessage("ALL Cuff")
		cuffAllPlayers()-- 함수 채우기
	end
})

Tab3:CreateButton({
	Name = "Select Cuff",
	Callback = function()
		showMessage("Select Cuff")
		cuffSpecificPlayer()-- 함수 채우기
	end
})

Tab3:CreateInput({
	Name = "Cuff_Name",
	PlaceholderText = "Enter Name here",
	Callback = function(text)
		userName = findPlayerDisplayName(text) -- 입력받는 텍스트 사용
	end
})

Tab3:CreateButton({
	Name = "ALL LoopKill [총 필요없음]",
	Callback = function()
		showMessage("ALL LoopKill")
		fanggluv()
	end
})

Tab3:CreateButton({
	Name = "ALL Kill [ak-47필요]",
	Callback = function()
		showMessage("ALL Kill")
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			if player ~= Player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
				local args = {
					player.Character.Humanoid,
					player.Character.HumanoidRootPart,
					69697474,
					Vector3.new(0, -1, 0),
					0,
					0,
					false
				}
				Player.Character:WaitForChild("AK-47"):WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(args))
			end
		end
	end
})

Tab3:CreateToggle({
	Name = "All LoopKill [ak-47필요]",
	CurrentValue = false,
	Callback = function(MnMnMnMn)
		getfenv().Atlantis = aaaaa
		if aaaaa then
			task.spawn(function()
				while getfenv().Atlantis do
					task.wait(0.2)
					for a, b in ipairs(game:GetService("Players"):GetPlayers()) do
						if b ~= Player and b.Character and b.Character:FindFirstChild("Humanoid") and b.Character:FindFirstChild("HumanoidRootPart") then
							local c = {
								b.Character.Humanoid,
								b.Character.HumanoidRootPart,
								69697474,
								Vector3.new(0, -1, 0),
								0,
								0,
								false
							}
							Player.Character:WaitForChild("AK-47"):WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(c))
						end
					end
				end
			end)
		end
	end,
})


Tab3:CreateButton({
	Name = "Select Kill [ak-47필요]",
	Callback = function()
		showMessage("Select Kill")
		if fanggggggggggggggggggggggggg then
			local b = {
				fanggggggggggggggggggggggggg.Character.Humanoid,
				fanggggggggggggggggggggggggg.Character.HumanoidRootPart,
				69697474,
				Vector3.new(0, -1, 0),
				0,
				0,
				false
			}
			local c = Player.Character:WaitForChild("AK-47"):WaitForChild("GunScript_Server"):WaitForChild("InflictTarget")
			c:FireServer(unpack(b))
			showMessage("Select KILL : " .. fanggggggggggggggggggggggggg.Name)
		else
			showMessage("Target not found!!!!!!!!!!!!!!!!!")
		end
	end
})

Tab3:CreateToggle({
	Name = "Select LoopKill",
	CurrentValue = false,
	Callback = function(aaaaa)
		getfenv().Atlantis = aaaaa
		if aaaaa then
			task.spawn(function()
				while getfenv().Atlantis do
					task.wait(0.2)
					if fanggggggggggggggggggggggggg  then
						local a = {
							fanggggggggggggggggggggggggg.Character.Humanoid,
							fanggggggggggggggggggggggggg.Character.HumanoidRootPart,
							69697474,
							Vector3.new(0, -1, 0),
							0,
							0,
							false
						}
						Player.Character:WaitForChild("AK-47"):WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(a))
					end
				end
			end)
		end
	end,
})

Tab3:CreateSection("강철부대")

Tab3:CreateButton({
	Name = "강철부대 All 수갑 [가까이 가야함]",
	Callback = function()
		showMessage("강철부대 All 수갑 [가까이 가야함]")
		gangchulCuff()
	end
})

Tab3:CreateButton({
	Name = "강철부대 수갑 풀기",
	Callback = function()
		gangchulUnCuff()
	end
})

Tab3:CreateSection("밥밥 부대")

Tab3:CreateToggle({
	Name = "글록 ALL KILL (글록필요)",
	Callback = function(Value)
		if Value then
			isGlockAllKillEnabled = true
			GlockAllKill()
		else
			isGlockAllKillEnabled = false
			stopGlockAllKill()
		end
		showMessage("글록 ALL KILL (글록필요) : " .. tostring(Value))
	end,
})

Tab3:CreateToggle({
	Name = "가까운 플레이어 세계밖으로 떨구기 (수갑 필요)",
	Callback = function(Value)
		if Value then
			babbab_Kick_Cuff_ON()
		else
			babbab_Kick_Cuff_OFF()
		end
		showMessage("세계밖으로 떨구기 : " .. tostring(Value))
	end,
})

Tab3:CreateToggle({
	Name = "작대기 크기 키우기",
	Callback = function(Value)
		if Value then
			adjustWeaponSize(true)-- 작대기 키우는 스크립트
		else
			adjustWeaponSize(false)-- 작대기 줄이는 스크립트
		end
		showMessage("작대기 크기 키우기 : " .. tostring(Value))
	end,
})

Tab3:CreateButton({
	Name = "작대기 위치로 텔레포트",
	Callback = function()
		teleportToPosition(targetPosition)-- 함수 채우기
		showMessage("작대기 위치로 텔레포트")
	end
})

Tab3:CreateSection("태비 부대")

Tab3:CreateButton({
	Name = "모든 총 가져오기",
	Callback = function()
		Toggle_Tebi_tool_giver_f()
		showMessage("모든 총 가져오기")
	end
})

Tab3:CreateButton({
	Name = "모든 플레이어에게 투표창 띄우기",
	Callback = function()
		Toggle_Tebi_vote_f()
		showMessage("투표창 띄우기")
	end
})

Tab3:CreateSection("샤크 부대")

Tab3:CreateButton({
	Name = "ALL Cuff",
	Callback = function()
		cuffAllPlayersa()
		showMessage("ALL Cuff")
	end
})

Tab3:CreateSection("스카이 부대")

Tab3:CreateButton({
	Name = "ALL KILL [K2 필요] [패치됨 곧 고칠거임!!!!]",
	Callback = function()
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			if player ~= Player and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
				local args = {
					player.Character.Humanoid,
					player.Character.HumanoidRootPart,
					69697474,
					Vector3.new(0, -1, 0),
					0,
					0,
					false
				}
				Player.Character:WaitForChild("K2"):WaitForChild("GunScript_Server"):WaitForChild("InflictTarget"):FireServer(unpack(args))
			end
		end
		showMessage("ALL KILL")
	end
})

Tab3:CreateSection("서울 부대") -- 서울부대서울부대서울부대

Tab3:CreateInput({
	Name = "Select KILL name",
	CurrentValue = "",
	PlaceholderText = "Target Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(easyscript)
		mysoul = findPlayerDisplayName2(easyscript)
	end,
})

Tab3:CreateDivider()

Tab3:CreateButton({
	Name = "Better ALL KILL [총 없어도 됨 99% 작동]",
	Callback = function()
		for a, b in ipairs(game:GetService("Players"):GetPlayers()) do
			if b ~= Player and b.Character and b.Character:FindFirstChild("Humanoid") and (b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso")) then
				local c = nil
				for d, e in ipairs(game.Players:GetPlayers()) do
					if e ~= Player then
						if e.Backpack:FindFirstChild("Luger") then
							c = e.Backpack.Luger
							break
						elseif e.Backpack:FindFirstChild("General") then
							c = e.Backpack.General
							break
						end
					end
				end
				if c then
					c.GunScript_Server.InflictTarget:FireServer(
							b.Character.Humanoid,
							b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso"),
							69697474,
							Vector3.new(0, 0, -1),
							0,
							0,
							false
						)
				end
			end
		end
		showMessage("ALL KILL")
	end
})

Tab3:CreateToggle({
	Name = "Better ALL LOOPKILL [총 없어도 됨 99% 작동]",
	CurrentValue = false,
	Callback = function(red)
		getfenv().OLED = red
		if red then
			task.spawn(function()
				while getfenv().OLED do
					task.wait(.1)
					for a, b in ipairs(game:GetService("Players"):GetPlayers()) do
						if b ~= Player and b.Character and b.Character:FindFirstChild("Humanoid") and (b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso")) then
							local c = nil
							for d, e in ipairs(game.Players:GetPlayers()) do
								if e ~= Player then
									if e.Backpack:FindFirstChild("Luger") then
										c = e.Backpack.Luger
										break
									elseif e.Backpack:FindFirstChild("General") then
										c = e.Backpack.General
										break
									end
								end
							end
							if c then
								c.GunScript_Server.InflictTarget:FireServer(
										b.Character.Humanoid,
										b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso"),
										69697474,
										Vector3.new(0, 0, -1),
										0,
										0,
										false
									)
							end
						end
					end
				end
			end)
		end
	end,
})

Tab3:CreateButton({
	Name = "Better Select KILL [총 없어도 됨 99% 작동]",
	Callback = function()
		if mysoul and mysoul.Character and mysoul.Character:FindFirstChild("Humanoid") and (mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso")) then
			local c = nil
			for d, e in ipairs(game.Players:GetPlayers()) do
				if e ~= Player then
					if e.Backpack:FindFirstChild("Luger") then
						c = e.Backpack.Luger
						break
					elseif e.Backpack:FindFirstChild("General") then
						c = e.Backpack.General
						break
					end
				end
			end
			if c then
				c.GunScript_Server.InflictTarget:FireServer(
					mysoul.Character.Humanoid,
					mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso"),
					69697474,
					Vector3.new(0, 0, -1),
					0,
					0,
					false
				)
				showMessage("Select KILL → " .. mysoul.Name)
			end
		else
			showMessage("대상이 없따")
		end
	end
})

Tab3:CreateToggle({
	Name = "Better Select LOOPKILL [총 없어도 됨 99% 작동]",
	CurrentValue = false,
	Callback = function(lllllll)
		getfenv().ab = lllllll
		if lllllll then
			task.spawn(function()
				while getfenv().ab do
					task.wait(.1)
					if mysoul and mysoul.Character and mysoul.Character:FindFirstChild("Humanoid") and (mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso")) then
						local c = nil
						for d, e in ipairs(game.Players:GetPlayers()) do
							if e ~= Player then
								if e.Backpack:FindFirstChild("Luger") then
									c = e.Backpack.Luger
									break
								elseif e.Backpack:FindFirstChild("General") then
									c = e.Backpack.General
									break
								end
							end
						end
						if c then
							c.GunScript_Server.InflictTarget:FireServer(
								mysoul.Character.Humanoid,
								mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso"),
								69697474,
								Vector3.new(0, 0, -1),
								0,
								0,
								false
							)
						end
					end
				end
			end)
		end
	end,
})

Tab3:CreateButton({
	Name = "ALL KILL [Luger 아니면 General 필요]",
	Callback = function()
		for a, b in ipairs(game:GetService("Players"):GetPlayers()) do
			if b ~= Player and b.Character and b.Character:FindFirstChild("Humanoid") and (b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso")) then
				(Player.Backpack:FindFirstChild("Luger") or Player.Backpack:FindFirstChild("General") or Player.Backpack:FindFirstChild("Luger")).GunScript_Server.InflictTarget:FireServer(b.Character.Humanoid, b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso"), 69697474, Vector3.new(0, 0, -1), 0, 0, false)
			end
		end
		showMessage("ALL KILL")
	end
})

Tab3:CreateToggle({
	Name = "ALL LOOPKILL [Luger 아니면 General 필요]",
	CurrentValue = false,
	Callback = function(sanandress)
		getfenv().CJ = sanandress
		if sanandress then
			task.spawn(function()
				while getfenv().CJ do
					task.wait(.1)
					for a, b in ipairs(game.Players:GetPlayers()) do
						if b ~= Player and b.Character and b.Character:FindFirstChild("Humanoid") and (b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso")) then
							(Player.Backpack:FindFirstChild("Luger") or Player.Backpack:FindFirstChild("General") or Player.Backpack:FindFirstChild("Luger")).GunScript_Server.InflictTarget:FireServer(
								b.Character.Humanoid,
								b.Character:FindFirstChild("Torso") or b.Character:FindFirstChild("UpperTorso"),
								69697474,
								Vector3.new(0, 0, -1),
								0,
								0,
								false
							)
						end
					end
				end
			end)
		end
	end,
})

Tab3:CreateButton({
	Name = "Select KILL [Luger 아니면 General 필요]",
	Callback = function()
		if mysoul and mysoul.Character and mysoul.Character:FindFirstChild("Humanoid") and (mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso")) then
			(Player.Backpack:FindFirstChild("Luger") or Player.Backpack:FindFirstChild("General") or Player.Backpack:FindFirstChild("Luger")).GunScript_Server.InflictTarget:FireServer(
				mysoul.Character.Humanoid,
				mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso"),
				69697474,
				Vector3.new(0, 0, -1),
				0,
				0,
				false
			)
		end
		showMessage("Select KILL")
	end
})

Tab3:CreateToggle({
	Name = "Select LOOPKILL [Luger 아니면 General 필요]",
	CurrentValue = false,
	Callback = function(haha)
		getfenv().deadman = haha
		task.spawn(function()
			while getfenv().deadman do
				task.wait()
				if mysoul and mysoul.Character and mysoul.Character:FindFirstChild("Humanoid") and (mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso")) then
					(Player.Backpack:FindFirstChild("Luger") or Player.Backpack:FindFirstChild("General") or Player.Backpack:FindFirstChild("Luger")).GunScript_Server.InflictTarget:FireServer(
						mysoul.Character.Humanoid,
						mysoul.Character:FindFirstChild("Torso") or mysoul.Character:FindFirstChild("UpperTorso"),
						69697474,
						Vector3.new(0, 0, -1),
						0,
						0,
						false
					)
				end
			end
		end)
	end,
})

local Tab4 = Window:CreateTab("Misc", "ellipsis")
Tab4:CreateDivider()

Tab4:CreateButton({
	Name = "Destory UI",
	Callback = function()
		Rayfield:Destroy()
	end,
})

Tab4:CreateButton({
	Name = "Join IWV Hub Disocrd",
	Callback = function()
		setclipboard("https://discord.gg/FQRNud54Zr")
		Rayfield:Notify({
			Title = "IWV hub Reborn",
			Content = "링크가 클립보드에 복사됨",
			Duration = 3,
			Image = "info",
		})	
	end,
})

Tab4:CreateSection("Credit")

Tab4:CreateLabel("Credit to IWV & Community", "scroll", Color3.fromRGB(79, 39, 96), false)

ArrayField:LoadConfiguration()
