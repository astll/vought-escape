# ⚡ OPTIMIZATION TIPS - Performance Guide

## Target Performance
- **60 FPS** on high-end devices
- **30 FPS** on mobile devices
- **Load time:** < 5 seconds
- **Memory usage:** < 500MB

---

## Part Optimization

### Use Terrain Instead of Parts
❌ **Bad:** 1000 individual brick parts
✅ **Good:** Roblox terrain (grass, water, rock)

```lua
-- Create terrain efficiently
local terrain = workspace.Terrain
terrain:FillBall(Vector3.new(0, 10, 0), 20, Enum.Material.Brick)
```

### Combine Static Parts
❌ **Bad:** 50 separate wall pieces
✅ **Good:** Union multiple parts into 1

1. Select multiple parts
2. Right-click → "Union"
3. This creates 1 solid object instead of many

### Use Meshes for Complex Shapes
Instead of many parts, use a single mesh

---

## Script Optimization

### Use Coroutines for Heavy Operations
```lua
-- Bad: Freezes game
for i = 1, 10000 do
    print(i)
end

-- Good: Doesn't freeze
local co = coroutine.create(function()
    for i = 1, 10000 do
        print(i)
        coroutine.yield()
    end
end)
coroutine.resume(co)
```

### Limit Loop Frequency
```lua
-- Bad: Runs every frame (~60 times/sec)
game:GetService("RunService").Heartbeat:Connect(function()
    CalculatePlayerSpeed()
end)

-- Good: Runs every 0.5 seconds
local lastCheck = tick()
game:GetService("RunService").Heartbeat:Connect(function()
    if tick() - lastCheck > 0.5 then
        CalculatePlayerSpeed()
        lastCheck = tick()
    end
end)
```

### Cache Frequent Lookups
```lua
-- Bad: Searches for RunService every frame
game:GetService("RunService").Heartbeat:Connect(function()
    local Players = game:GetService("Players")
    -- ...
end)

-- Good: Cache the service
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
RunService.Heartbeat:Connect(function()
    -- ...
end)
```

---

## Rendering Optimization

### Use Humanoid.DisplayDistance
```lua
-- Only display humanoids within 100 studs
local humanoid = character:FindFirstChild("Humanoid")
if humanoid then
    humanoid.DisplayDistance = 100
end
```

### Disable Physics on Distant Objects
```lua
-- Stop processing physics for far-away objects
for _, part in pairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanCollide = false -- Disable if not needed
    end
end
```

### Use Level of Detail (LOD)
High quality models near camera, low quality far away.

---

## Memory Optimization

### Clean Up Connections
```lua
-- Bad: Connection stays alive
local connection = game.Loaded:Connect(function()
    print("Game loaded")
end)

-- Good: Disconnect when done
local connection = game.Loaded:Connect(function()
    print("Game loaded")
    connection:Disconnect()
end)
```

### Remove Unused Instances
```lua
-- Clean up after match ends
for _, instance in pairs(instances) do
    if not instance.Parent then
        instance = nil
    end
end
```

### Use Object Pooling
Reuse objects instead of creating/destroying

```lua
-- Pool of projectiles
local projectilePool = {}
local function GetProjectile()
    if #projectilePool > 0 then
        return table.remove(projectilePool)
    else
        return Instance.new("Part")
    end
end
```

---

## Network Optimization

### Batch Updates
```lua
-- Bad: Send 100 RemoteEvent fires
for i = 1, 100 do
    PowerUsedRemote:FireServer(power)
end

-- Good: Send 1 batch
PowerUsedRemote:FireServer({powers})
```

### Reduce Update Frequency
```lua
-- Bad: Send position every frame (60x/sec = 240KB/s)
RunService.Heartbeat:Connect(function()
    PlayerPositionRemote:FireServer(player.Position)
end)

-- Good: Send every 0.1 seconds (10x/sec = 40KB/s)
if tick() % 0.1 == 0 then
    PlayerPositionRemote:FireServer(player.Position)
end
```

---

## Map Optimization

### Use Anchored Parts
Anchored parts don't calculate physics, so:
✅ Anchor floor, walls, buildings
✅ Only unanchored parts for moveable objects

### Remove Unnecessary Details
- Simplify textures
- Use fewer polygons
- Remove hidden details

### Streamline Lighting
```lua
-- Reduce shadow quality for performance
local Lighting = game.Lighting
Lighting.GlobalShadows = false -- Disable shadows
Lighting.Brightness = 1.5 -- Slightly higher brightness
```

---

## Mobile Optimization

### Disable Advanced Effects
```lua
local isMobile = game.UserInputService:GetPlatform() == Enum.Platform.IOS or 
                 game.UserInputService:GetPlatform() == Enum.Platform.Android

if isMobile then
    -- Disable particles, disable advanced effects
    for _, particle in pairs(workspace:GetDescendants()) do
        if particle:IsA("ParticleEmitter") then
            particle.Enabled = false
        end
    end
end
```

### Reduce Poly Count on Mobile
- Simpler models
- Fewer particles
- Less detailed textures

---

## Performance Testing

### Use Developer Console
1. Press F9 to open console
2. Type `stats`
3. Watch FPS counter

### Profile Your Game
```lua
-- Measure function performance
local startTime = tick()
MyFunction()
local endTime = tick()
print("Function took " .. (endTime - startTime) * 1000 .. "ms")
```

---

## Mobile FPS Target

| Device | FPS Target |
|--------|-----------|
| High-end PC | 60 FPS |
| Mid-range PC | 45 FPS |
| Low-end PC | 30 FPS |
| Mobile | 30 FPS |

Use these targets when optimizing.