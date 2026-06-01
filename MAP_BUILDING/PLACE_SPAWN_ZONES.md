# 👥 PLACE SPAWN ZONES - Player Starting Positions

## Overview

Spawn zones are where players appear when they join the game.

**System:**
- 6 Survivors spawn in 3 pairs (duos) around the tower
- 1 Homelander spawns in The Seven Meeting Room

---

## Create Duo Spawn 1 (Lobby)

**Spawn 1A:**
1. Click **"Part"**
2. Name: "Spawn_Survivor_1A"
3. Properties:
   - Size: X: 4, Y: 1, Z: 4
   - Position: X: 8, Y: 12, Z: 8
   - Color: Blue (RGB: 0, 0, 255)
   - CanCollide: True
4. Drag into **Spawns** folder

**Spawn 1B (partner spawns nearby):**
1. Click **"Part"**
2. Name: "Spawn_Survivor_1B"
3. Properties:
   - Size: X: 4, Y: 1, Z: 4
   - Position: X: 8, Y: 12, Z: 15
   - Color: Blue
   - CanCollide: True
4. Drag into **Spawns** folder

---

## Create Duo Spawn 2 (Office Floor)

**Spawn 2A:**
- Size: X: 4, Y: 1, Z: 4
- Position: X: 15, Y: 40, Z: -18
- Name: "Spawn_Survivor_2A"
- Color: Blue

**Spawn 2B:**
- Size: X: 4, Y: 1, Z: 4
- Position: X: 15, Y: 40, Z: -10
- Name: "Spawn_Survivor_2B"
- Color: Blue

---

## Create Duo Spawn 3 (Lab Floor)

**Spawn 3A:**
- Size: X: 4, Y: 1, Z: 4
- Position: X: -18, Y: 75, Z: 10
- Name: "Spawn_Survivor_3A"
- Color: Blue

**Spawn 3B:**
- Size: X: 4, Y: 1, Z: 4
- Position: X: -18, Y: 75, Z: 20
- Name: "Spawn_Survivor_3B"
- Color: Blue

---

## Create Homelander Spawn

**Homelander spawn in The Seven Meeting Room:**

1. Click **"Part"**
2. Name: "Spawn_Homelander"
3. Properties:
   - Size: X: 5, Y: 2, Z: 5
   - Position: X: 0, Y: 113, Z: 0 (center of meeting room)
   - Color: Red (RGB: 255, 0, 0)
   - CanCollide: True
4. Drag into **Spawns** folder

---

## Spawn Zone Coordinates

```
LOBBY ZONE (Duos 1)
  ├─ Spawn 1A: (8, 12, 8)
  └─ Spawn 1B: (8, 12, 15)

OFFICE ZONE (Duos 2)
  ├─ Spawn 2A: (15, 40, -18)
  └─ Spawn 2B: (15, 40, -10)

LAB ZONE (Duos 3)
  ├─ Spawn 3A: (-18, 75, 10)
  └─ Spawn 3B: (-18, 75, 20)

MEETING ROOM (Homelander)
  └─ Spawn Homelander: (0, 113, 0)
```

---

## Test Spawns

1. Click **"Play"**
2. You should appear on a blue platform
3. Check Output to see spawn assignments