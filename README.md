# Player-Info

Player-Info, is a Roblox script that finds the players stats when putting the Users Roblox name in the TextInput.

```lua
--Put this on top of the loadstring to make the script even less detected
getgenv().SecureMode = true
```
```lua
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Robobo2022/Player-Info/main/Main.lua"), true))()
```

### How to use?
the script is very straight forward, you put the Players UserName (Script Doesn't support display name) in the textinput and then switch to the Information Tab.

### What Stats can you see?
#### Character
Display,
Username,
UserId
#### Roblox
AccountAge,
Premium (True/False),
Follower count,
#### Humanoid
WalkSpeed,
JumpPower,
MaxHealth,
Health,
Position x/y/z (there is a toggle to round up the position number)
#### Extra
Teleport to target
###### Its CaSe sensitive, so it will Show that the player doesn't exist when you put one letter wrong or a capital letter wrong ):