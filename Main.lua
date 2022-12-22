local HS = game:GetService("HttpService")
local Player = game:GetService("Players")
local req = (syn and syn.request or request or http and http.request or http_request)
if not req then
	error("Your executor cant use the http request function, please use a different executor. the request function is used to get the player Follower count.")
end
local PlayerName = Player.Name

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Player Info",
	LoadingTitle = "Loading Player Info",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius",
        	RememberJoins = true 
        },
	KeySystem = false, 
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, 
		Key = "Hello"
	}
})

getgenv().round = false

local Tab = Window:CreateTab("Player", 11721661401)
local Tab1 = Window:CreateTab("Information", 11721661401)

local CharacterStats = Tab1:CreateSection("Character Stats")
local Display = Tab1:CreateLabel("Display: ")
local UserName = Tab1:CreateLabel("User: ")
local UserId = Tab1:CreateLabel("UserId: ")
local RobloxStats = Tab1:CreateSection("Roblox Stats")
local AccountAge = Tab1:CreateLabel("AccountAge: ")
local Premium = Tab1:CreateLabel("Premium: ")
local Followers = Tab1:CreateLabel("Followers: ")
local HumanoidStats = Tab1:CreateSection("Humanoid Stats")
local WalkSpeed = Tab1:CreateLabel("WalkSpeed: ")
local JumpPower = Tab1:CreateLabel("JumpPower: ")
local MaxHealth = Tab1:CreateLabel("MaxHealth: ")
local Health = Tab1:CreateLabel("Health: ")

local pos = Tab1:CreateSection("Player Position")
local PosX = Tab1:CreateLabel("Position.X: ")
local PosY = Tab1:CreateLabel("Position.Y: ")
local PosZ = Tab1:CreateLabel("Position.Z: ")

local Toggle = Tab:CreateToggle({
	Name = "Round Position number",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		 round = Value
	end,
 })

local Button = Tab:CreateButton({
	Name = "Teleport to Target",
	Callback = function()
		if PlayerName == Player.LocalPlayer.Name then
			Rayfield:Notify({
				Title = "You cant teleport to yourself",
				Content = "Player Name: " .. PlayerName,
				Duration = 6.5,
				Image = 11721661420,
			})
			return
		end
		if not Player:FindFirstChild(PlayerName) then
			Rayfield:Notify({
				Title = "Cant Teleport to Player",
				Content = "Player: " .. PlayerName .. "Doesnt Exist",
				Duration = 6.5,
				Image = 11721661420,
			})
			return
		end
		Player.LocalPlayer.Character.HumanoidRootPart.CFrame = Player[PlayerName].Character.HumanoidRootPart.CFrame
	end,
})	

local Input = Tab:CreateInput({
	Name = "Player Name",
	PlaceholderText = "Player Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		PlayerName = Text
	
		if not Player:FindFirstChild(Text) then
			Rayfield:Notify({
				Title = "Player Chosen Doesnt Exist",
				Content = "Player Name: " .. PlayerName,
				Duration = 6.5,
				Image = 11721661420,
			})
			
			Followers:Set("Followers: Error")
			Premium:Set("Premium: Error")
			AccountAge:Set("AccountAge: Error")
            Display:Set("Display: Error")
            UserName:Set("User: Error")
            UserId:Set("UserId: Error")
			WalkSpeed:Set("WalkSpeed: Error")
			JumpPower:Set("JumpPower: Error")
			MaxHealth:Set("MaxHealth: Error")
			Health:Set("Health: Error")
			PosX:Set("Position.X: Error")
			PosY:Set("Position.Y: Error")
			PosZ:Set("Position.Z: Error")

			game.Players.ChildRemoved:Connect(function(Text)
				Followers:Set("Followers: Error")
				Premium:Set("Premium: Error")
				AccountAge:Set("AccountAge: Error")
				Display:Set("Display: Error")
				UserName:Set("User: Error")
				UserId:Set("UserId: Error")
				WalkSpeed:Set("WalkSpeed: Error")
				JumpPower:Set("JumpPower: Error")
				MaxHealth:Set("MaxHealth: Error")
				Health:Set("Health: Error")
				PosX:Set("Position.X: Error")
				PosY:Set("Position.Y: Error")
				PosZ:Set("Position.Z: Error")
			end)

		else
			Rayfield:Notify({
				Title = "Player Chosen",
				Content = "Player Name: " .. PlayerName,
				Duration = 6.5,
				Image = 11721661402,
			})

			if Player[Text].MembershipType == Enum.MembershipType.Premium then
				Premium:Set("Premium: True")
			else
				Premium:Set("Premium: False")
			end

			local response = HS:JSONDecode(
				req({
				Url = "https://friends.roblox.com/v1/users/"..Player[Text].UserId.."/followers/count"
			})
			.Body)

			while true do task.wait()
				Button:Set("Teleport to " .. PlayerName)
				Followers:Set("Followers: " .. response.count)
				AccountAge:Set("AccountAge: " .. Player[Text].AccountAge)
				UserName:Set("User: " .. PlayerName)
				Display:Set("Display: " .. Player[Text].DisplayName)
				UserId:Set("UserId: " .. Player[Text].UserId)
				WalkSpeed:Set("WalkSpeed: " .. Player[Text].Character.Humanoid.WalkSpeed)
				JumpPower:Set("JumpPower: " .. Player[Text].Character.Humanoid.JumpPower)
				MaxHealth:Set("MaxHealth: " .. Player[Text].Character.Humanoid.MaxHealth)
				Health:Set("Health: " .. Player[Text].Character.Humanoid.Health)
				if round == true then
					PosX:Set("Position.X: " .. math.floor(Player[Text].Character.HumanoidRootPart.Position.X))
					PosY:Set("Position.Y: " .. math.floor(Player[Text].Character.HumanoidRootPart.Position.Y))
					PosZ:Set("Position.Z: " .. math.floor(Player[Text].Character.HumanoidRootPart.Position.Z))
				else
					PosX:Set("Position.X: " .. Player[Text].Character.HumanoidRootPart.Position.X)
					PosY:Set("Position.Y: " .. Player[Text].Character.HumanoidRootPart.Position.Y)
					PosZ:Set("Position.Z: " .. Player[Text].Character.HumanoidRootPart.Position.Z)
				end
			end
		end
	end,
})

