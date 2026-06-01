# 🛡️ ANTI-CHEAT & EXPLOIT PREVENTION

## Server-Authoritative Architecture

**Core Rule:** Server validates EVERYTHING. Client is for display only.

---

## Speed Hack Detection

```lua
-- Server-side speed validation
local function CheckPlayerSpeed(player)
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Check distance traveled per frame
    local lastPosition = humanoidRootPart.Position
    local lastTime = tick()
    
    game:GetService("RunService").Heartbeat:Connect(function()
        if character and humanoidRootPart then
            local currentTime = tick()
            local timeDelta = currentTime - lastTime
            local distanceTraveled = (humanoidRootPart.Position - lastPosition).Magnitude
            local speed = distanceTraveled / timeDelta
            
            -- Normal max speed is 50 studs/sec, flag if exceeds 100
            if speed > 100 and player:FindFirstChild("SuspiciousFlags") then
                player.SuspiciousFlags.Value = player.SuspiciousFlags.Value + 1
            end
            
            lastPosition = humanoidRootPart.Position
            lastTime = currentTime
        end
    end)
end
```

---

## Damage Validation

```lua
-- All damage must be verified by server
local function ServerValidateDamage(attacker, victim, damageAmount, powerUsed)
    -- Check attacker exists and is valid
    if not attacker or not attacker.Parent then
        return false -- Invalid attacker
    end
    
    -- Check power cooldown
    local lastUsed = attacker:GetAttribute("LastPower" .. powerUsed) or 0
    local cooldown = 3 -- 3 second cooldown
    if tick() - lastUsed < cooldown then
        attacker.SuspiciousFlags.Value = attacker.SuspiciousFlags.Value + 1
        return false -- Exploiting cooldown
    end
    
    -- Check range (distance between players)
    local attackerPos = attacker.Character.HumanoidRootPart.Position
    local victimPos = victim.Character.HumanoidRootPart.Position
    local distance = (attackerPos - victimPos).Magnitude
    local maxRange = 50 -- Max 50 studs
    
    if distance > maxRange then
        attacker.SuspiciousFlags.Value = attacker.SuspiciousFlags.Value + 1
        return false -- Attacking from too far away
    end
    
    -- All checks passed - damage is valid
    victim.Character.Humanoid:TakeDamage(damageAmount)
    attacker:SetAttribute("LastPower" .. powerUsed, tick())
    return true
end
```

---

## Objective Exploit Prevention

```lua
-- Prevent vial/tank hacking
local function ValidateVialDeposit(player, vial, tank)
    -- Check player actually has vial
    local playerInventory = player:FindFirstChild("Inventory")
    if not playerInventory or not playerInventory:FindFirstChild(vial.Name) then
        player.SuspiciousFlags.Value = player.SuspiciousFlags.Value + 1
        return false
    end
    
    -- Check player is close to tank (within 15 studs)
    local playerPos = player.Character.HumanoidRootPart.Position
    local tankPos = tank.Position
    if (playerPos - tankPos).Magnitude > 15 then
        player.SuspiciousFlags.Value = player.SuspiciousFlags.Value + 1
        return false
    end
    
    -- Valid deposit
    vial:Destroy()
    tank:SetAttribute("Vials", tank:GetAttribute("Vials") + 1)
    return true
end
```

---

## Suspicious Activity Scoring

```lua
SUSPICIOUS_THRESHOLDS = {
    SpeedHack = 3,
    DamageExploit = 5,
    ReachExploit = 4,
    ObjectiveHack = 2,
    KillThrough Walls = 5,
    BanThreshold = 10 -- Ban after 10 flags
}

-- When threshold reached
function AutoBanPlayer(player)
    if player.SuspiciousFlags.Value >= SUSPICIOUS_THRESHOLDS.BanThreshold then
        player:Kick("Cheating detected. Please play fairly!")
        -- Log to moderators
        LogToModeration(player.UserId, player.Name, "Auto-ban: Anti-cheat threshold")
    end
end
```

---

## Client-Side Restrictions

**Disable potentially exploitable features:**
- Disable UserInputService remote key logging
- Prevent script injection
- Validate all user input on server
- Rate limit commands (max 10 per second)

---

## Network Validation

```lua
-- Validate all RemoteEvents/RemoteFunctions
local PowerUsedRemote = game.ReplicatedStorage:WaitForChild("PowerUsedRemote")

PowerUsedRemote.OnServerEvent:Connect(function(player, powerName)
    -- Server determines if this is valid
    local validPowers = {"LaserVision", "SpeedDash", "Lightning"}
    
    if not table.find(validPowers, powerName) then
        player.SuspiciousFlags.Value = player.SuspiciousFlags.Value + 1
        return
    end
    
    -- Server executes the power (not client)
    ExecutePowerOnServer(player, powerName)
end)
```

---

## Logging & Monitoring

```lua
-- Log all suspicious activity
function LogSuspiciousActivity(player, reason, severity)
    local log = {
        PlayerName = player.Name,
        UserId = player.UserId,
        Reason = reason,
        Severity = severity, -- "Low", "Medium", "High"
        Timestamp = os.date("%Y-%m-%d %H:%M:%S"),
        FlagCount = player.SuspiciousFlags.Value
    }
    
    -- Save to DataStore for review
    local logStore = game:GetService("DataStoreService"):GetDataStore("SuspiciousActivityLog")
    logStore:UpdateAsync(player.UserId, function(oldData)
        if oldData then
            table.insert(oldData, log)
            return oldData
        else
            return {log}
        end
    end)
end
```

---

## Whitelisted Client Actions

Only these actions are allowed from client:
- ✅ Movement input (validated on server)
- ✅ UI clicks (handled locally)
- ✅ Camera movement
- ✅ Chat messages

Everything else is server-authoritative.

---

## Periodic Anti-Cheat Checks

```lua
-- Run checks every 30 seconds
game:GetService("RunService").Heartbeat:Connect(function()
    if tick() % 30 == 0 then
        for _, player in pairs(game.Players:GetPlayers()) do
            CheckPlayerIntegrity(player)
            ValidatePlayerStats(player)
            VerifyPowerUsage(player)
        end
    end
end)
```

---

## Report System

Players can report cheaters:
1. Click report button
2. Select reason (aimbotting, exploiting, etc.)
3. Submit with replay data
4. Moderators review within 24 hours
5. Action taken (warning, temp ban, permanent ban)

---

## Ban System

**Progressive Discipline:**
- First exploit: Warning + 24hr cooldown
- Second exploit: 7-day ban
- Third exploit: 30-day ban
- Fourth exploit: Permanent ban

**Permanent bans logged by UserId** to prevent reaccounts.