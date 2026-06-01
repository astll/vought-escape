# 🎮 COMPLETE SETUP GUIDE - For Total Beginners
## No Roblox Experience Required!

---

## ⚙️ STEP 1: Install & Open Roblox Studio

1. Go to **https://www.roblox.com/create**
2. Click **"Get Roblox Studio"**
3. Install the application
4. Open Roblox Studio
5. Log in with your Roblox account

---

## 📋 STEP 2: Create a New Game

1. Click **"New"** in Roblox Studio
2. Choose **"Classic Baseplate"** (this is simplest)
3. Name it **"VOUGHT ESCAPE"**
4. Click **"Create"**

**You should now see a blank 3D world with a baseplate!**

---

## 🏗️ STEP 3: Create the Basic Folder Structure

You'll see an **"Explorer"** panel on the left side. This shows your game's structure.

**Create these folders inside "Workspace":**

1. Right-click on **"Workspace"** → **"Insert Object"** → **"Folder"**
2. Name it **"Map"**
3. Create another folder called **"Spawns"**
4. Create another folder called **"ObjectiveItems"**
5. Create another folder called **"NPCs"**

**Your Explorer should now look like:**
```
📁 Workspace
  ├── 📁 Map
  ├── 📁 Spawns
  ├── 📁 ObjectiveItems
  ├── 📁 NPCs
  ├── 📁 Baseplate (leave this)
  └── 📁 Camera (leave this)
```

---

## 📁 STEP 4: Create ServerScriptService Scripts

In the Explorer panel, look for **"ServerScriptService"** (expand it if needed).

**Create these ServerScripts:**

1. Right-click **"ServerScriptService"** → **"Insert Object"** → **"Script"**
2. Name it **"GameManager"**
3. Repeat and create:
   - **"PlayerManager"**
   - **"HomelanderManager"**
   - **"ObjectiveManager"**
   - **"DataManager"**
   - **"LobbyManager"**
   - **"AntiCheatManager"**

**Your Explorer should show 6 new scripts under ServerScriptService**

---

## 🎯 STEP 5: Add the Code

**Double-click each script and copy-paste the code from the SCRIPTS/ folder:**

### Script 1: GameManager.lua

Double-click **"GameManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Game Manager
-- This script controls the overall game flow

local GameState = {
    Status = "Waiting", -- Waiting, Loading, InGame, Ending
    TimeRemaining = 600, -- 10 minutes in seconds
    HomelanderPlayer = nil,
    SurvivorsPlayers = {},
    TanksRemaining = 8,
    MaxTanks = 8,
    PlayersReady = 0,
    MaxPlayers = 7
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Event that fires when a player joins
Players.PlayerAdded:Connect(function(player)
    print("Player joined: " .. player.Name)
    GameState.PlayersReady = GameState.PlayersReady + 1
    
    -- If all 7 players are here, start the game
    if GameState.PlayersReady >= GameState.MaxPlayers then
        StartGame()
    end
end)

-- Function to start the game
function StartGame()
    print("Starting game...")
    GameState.Status = "Loading"
    
    -- Assign one random player as Homelander
    local allPlayers = Players:GetPlayers()
    local randomIndex = math.random(1, #allPlayers)
    GameState.HomelanderPlayer = allPlayers[randomIndex]
    
    print("Homelander is: " .. GameState.HomelanderPlayer.Name)
    
    -- Teleport players to spawn zones
    for i, player in pairs(allPlayers) do
        if player ~= GameState.HomelanderPlayer then
            table.insert(GameState.SurvivorsPlayers, player)
        end
    end
    
    GameState.Status = "InGame"
    print("Game started!")
end

-- Main game loop - runs every frame
RunService.Heartbeat:Connect(function()
    if GameState.Status == "InGame" then
        GameState.TimeRemaining = GameState.TimeRemaining - 1/60 -- Subtract time each frame
        
        -- Check if time is up
        if GameState.TimeRemaining <= 0 then
            EndGame("Homelander") -- Homelander wins if time runs out
        end
    end
end)

-- Function to end the game
function EndGame(winner)
    GameState.Status = "Ending"
    print("Game Over! Winner: " .. winner)
    
    -- Show end screen to all players
    for i, player in pairs(Players:GetPlayers()) do
        -- Notify player of results
        print(player.Name .. " game ended")
    end
    
    -- Restart after 5 seconds
    wait(5)
    GameState.Status = "Waiting"
    GameState.TimeRemaining = 600
    GameState.TanksRemaining = 8
    GameState.PlayersReady = 0
    GameState.SurvivorsPlayers = {}
end

print("GameManager loaded!")
```

---

### Script 2: PlayerManager.lua

Double-click **"PlayerManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Player Manager
-- This script handles player spawning and setup

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

Players.PlayerAdded:Connect(function(player)
    print("Setting up player: " .. player.Name)
    
    -- Wait for character to load
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Find spawn location
    local spawns = Workspace:FindFirstChild("Spawns")
    if spawns then
        local spawnList = spawns:GetChildren()
        if #spawnList > 0 then
            -- Pick random spawn
            local randomSpawn = spawnList[math.random(1, #spawnList)]
            character:MoveTo(randomSpawn.Position)
        end
    end
    
    -- Give player basic humanoid
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.MaxHealth = 100
        humanoid.Health = 100
    end
end)

print("PlayerManager loaded!")
```

---

### Script 3: HomelanderManager.lua

Double-click **"HomelanderManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Homelander Manager
-- This script handles Homelander spawning and behavior

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local HomelanderData = {
    Health = 250,
    Speed = 25,
    CurrentPlayer = nil
}

-- Function to setup Homelander
function SetupHomelander(player)
    print("Setting up Homelander: " .. player.Name)
    HomelanderData.CurrentPlayer = player
    
    local character = player.Character or player.CharacterAdded:Wait()
    
    -- Spawn in The Seven meeting room
    local meetingRoom = Workspace:FindFirstChild("SevenMeetingRoom")
    if meetingRoom then
        local spawnPoint = meetingRoom:FindFirstChild("SpawnPoint")
        if spawnPoint then
            character:MoveTo(spawnPoint.Position)
        end
    end
    
    -- Give Homelander more health
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.MaxHealth = HomelanderData.Health
        humanoid.Health = HomelanderData.Health
    end
    
    -- Make Homelander stronger/faster
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.Size = humanoidRootPart.Size * 1.2 -- Slightly bigger
    end
end

print("HomelanderManager loaded!")
```

---

### Script 4: ObjectiveManager.lua

Double-click **"ObjectiveManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Objective Manager
-- This script handles water tanks and virus vials

local Workspace = game:GetService("Workspace")

local ObjectiveState = {
    TanksComplete = 0,
    MaxTanks = 8,
    VialsCollected = 0,
    MaxVials = 8,
    TankLocations = {
        {Position = Vector3.new(0, 5, 0), Name = "Tank1"},
        {Position = Vector3.new(20, 5, 0), Name = "Tank2"},
        {Position = Vector3.new(-20, 5, 0), Name = "Tank3"},
        {Position = Vector3.new(0, 5, 20), Name = "Tank4"},
        {Position = Vector3.new(0, 5, -20), Name = "Tank5"},
        {Position = Vector3.new(20, 5, 20), Name = "Tank6"},
        {Position = Vector3.new(-20, 5, -20), Name = "Tank7"},
        {Position = Vector3.new(-20, 5, 20), Name = "Tank8"}
    }
}

-- Function to complete a tank
function CompleteTank(tankName)
    print("Tank completed: " .. tankName)
    ObjectiveState.TanksComplete = ObjectiveState.TanksComplete + 1
    
    if ObjectiveState.TanksComplete >= ObjectiveState.MaxTanks then
        print("ALL TANKS FILLED! SPRINKLERS ACTIVATED!")
        ActivateSprinklers()
    end
end

-- Function to activate sprinklers (survivors win)
function ActivateSprinklers()
    print("Sprinklers activated - Survivors win!")
    -- This will be handled by GameManager
end

print("ObjectiveManager loaded!")
```

---

### Script 5: DataManager.lua

Double-click **"DataManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Data Manager
-- This script handles player data saving

local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")

local playerDataStore = DataStoreService:GetDataStore("PlayerStats")

local DefaultPlayerData = {
    Level = 1,
    Coins = 0,
    Wins = 0,
    Losses = 0,
    Kills = 0,
    Deaths = 0,
    TimePlayed = 0,
    Cosmetics = {},
    Achievements = {}
}

-- Function to load player data
function LoadPlayerData(player)
    local success, data = pcall(function()
        return playerDataStore:GetAsync("Player_" .. player.UserId)
    end)
    
    if success then
        if data then
            return data
        else
            -- First time player, save default data
            SavePlayerData(player, DefaultPlayerData)
            return DefaultPlayerData
        end
    else
        print("Error loading data for " .. player.Name)
        return DefaultPlayerData
    end
end

-- Function to save player data
function SavePlayerData(player, data)
    local success, err = pcall(function()
        playerDataStore:SetAsync("Player_" .. player.UserId, data)
    end)
    
    if success then
        print("Saved data for " .. player.Name)
    else
        print("Error saving data for " .. player.Name .. ": " .. err)
    end
end

Players.PlayerAdded:Connect(function(player)
    local data = LoadPlayerData(player)
    print(player.Name .. " loaded - Level: " .. data.Level)
end)

print("DataManager loaded!")
```

---

### Script 6: LobbyManager.lua

Double-click **"LobbyManager"** script and paste:

```lua
-- VOUGHT ESCAPE - Lobby Manager
-- This script manages the matchmaking lobby

local Players = game:GetService("Players")

local LobbyState = {
    MaxPlayers = 7,
    CurrentPlayers = 0,
    IsStarting = false,
    CountdownTime = 30 -- Seconds to wait before starting
}

Players.PlayerAdded:Connect(function(player)
    LobbyState.CurrentPlayers = LobbyState.CurrentPlayers + 1
    print("Lobby: " .. LobbyState.CurrentPlayers .. "/" .. LobbyState.MaxPlayers)
    
    if LobbyState.CurrentPlayers >= LobbyState.MaxPlayers then
        print("Lobby full! Starting game...")
        LobbyState.IsStarting = true
    end
end)

Players.PlayerRemoving:Connect(function(player)
    LobbyState.CurrentPlayers = math.max(0, LobbyState.CurrentPlayers - 1)
    print("Player left. Lobby: " .. LobbyState.CurrentPlayers .. "/" .. LobbyState.MaxPlayers)
end)

print("LobbyManager loaded!")
```

---

### Script 7: AntiCheatManager.lua

Double-click **"AntiCheatManager"" script and paste:

```lua
-- VOUGHT ESCAPE - Anti-Cheat Manager
-- This script detects and prevents exploits

local Players = game:GetService("Players")

local AntiCheatState = {
    SuspiciousActivities = {},
    ThresholdForBan = 5
}

-- Function to flag suspicious activity
function FlagSuspiciousActivity(player, reason)
    print("Suspicious activity flagged for " .. player.Name .. ": " .. reason)
    
    if not AntiCheatState.SuspiciousActivities[player.UserId] then
        AntiCheatState.SuspiciousActivities[player.UserId] = 0
    end
    
    AntiCheatState.SuspiciousActivities[player.UserId] = AntiCheatState.SuspiciousActivities[player.UserId] + 1
    
    if AntiCheatState.SuspiciousActivities[player.UserId] >= AntiCheatState.ThresholdForBan then
        print("Banning player: " .. player.Name)
        player:Kick("Detected cheating activity. Please play fair!")
    end
end

-- Monitor for super-speed cheating
Players.PlayerAdded:Connect(function(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and humanoidRootPart then
        local lastPosition = humanoidRootPart.Position
        
        game:GetService("RunService").Heartbeat:Connect(function()
            if character and humanoidRootPart then
                local currentPosition = humanoidRootPart.Position
                local distance = (currentPosition - lastPosition).Magnitude
                local speed = distance * 60 -- Approximate speed
                
                -- If moving faster than 100 studs/second, flag it
                if speed > 100 and humanoid.Health > 0 then
                    FlagSuspiciousActivity(player, "Speed hack detected")
                end
                
                lastPosition = currentPosition
            end
        end)
    end
end)

print("AntiCheatManager loaded!")
```

---

## ✅ STEP 6: Test Your Game

1. In Roblox Studio, click **"Play"** button (top toolbar)
2. You should see a baseplate and test players in the game
3. Watch the **Output** tab (bottom of screen) for messages like:
   - "GameManager loaded!"
   - "PlayerManager loaded!"
   - "Player joined: Player1"

**If you see these messages, congratulations! The scripts are working!**

---

## 🗺️ STEP 7: Build the Map

Now you need to create Vought Tower. **[Go to MAP_BUILDING/BUILD_VOUGHT_TOWER.md](./MAP_BUILDING/BUILD_VOUGHT_TOWER.md)**

---

## 🎨 STEP 8: Add User Interface

Next, create the UI for your game. **[Go to UI_SETUP/MainMenu.md](./UI_SETUP/MainMenu.md)**

---

## 🎯 What's Next?

✅ Scripts are working  
✅ Basic structure is set up  

**Next steps:**
1. Build the map (Step 7 above)
2. Add UI (Step 8 above)
3. Add water tanks and virus vials
4. Test the objective system
5. Balance and tune gameplay

---

## ❓ Having Issues?

**Check TROUBLESHOOTING.md for common problems!**

- Scripts not running? → Check ServerScriptService
- No output messages? → Make sure scripts are in the right place
- Players not spawning? → Create spawn points first

---

**You're now 1/3 of the way to a complete game! Keep going!** 🚀