# 💧 PLACE WATER TANKS - Objective Setup

## Overview
Water tanks are where survivors deposit virus vials. You need to create 8 tanks scattered throughout Vought Tower.

---

## Tank Specifications

- **Appearance:** Tall cylinders (representing large tanks)
- **Count:** 8 total
- **Color:** Metallic (gray/silver)
- **Locations:** Different floors throughout the tower

---

## STEP 1: Create Tank Model

1. Click **"Part"** button
2. Right-click the part → **"Insert Object"** → **"Mesh"**
3. In **Properties** panel, find **"Shape"**
4. Change from "Block" to **"Cylinder"**

### Size It

1. Set **Properties:**
   - **Size:** X: 5, Y: 15, Z: 5 (tall cylinder)
   - **Position:** X: 10, Y: 20, Z: 10
   - **Color:** Light gray (RGB: 150, 150, 150)
   - **CanCollide:** True

2. Rename it to **"WaterTank_1"**
3. Drag it into **ObjectiveItems** folder

---

## STEP 2: Add a Vial Deposit Point

Create a touchable part on top where players insert vials:

1. Click **"Part"**
2. Name: "VialSlot_1"
3. Properties:
   - Size: X: 6, Y: 2, Z: 6
   - Position: X: 10, Y: 38, Z: 10 (on top of tank)
   - Color: Green (RGB: 0, 255, 0)
   - CanCollide: False
   - Transparency: 0.2

4. Drag into **ObjectiveItems** folder

---

## Tank Locations

| Tank | Position | Floor |
|------|----------|-------|
| 1 | (10, 15, 10) | Lobby |
| 2 | (-10, 15, -10) | Lobby |
| 3 | (15, 40, 15) | Floor 2 |
| 4 | (-15, 40, -15) | Floor 2 |
| 5 | (12, 75, 0) | Floor 4 |
| 6 | (-12, 75, 0) | Floor 4 |
| 7 | (10, 130, 10) | Floor 7 |
| 8 | (0, 152, 0) | Rooftop |

---

## Create Virus Vials

**Vial Model:**
1. Click **"Part"**
2. Properties:
   - **Shape:** Ball
   - **Size:** X: 2, Y: 2, Z: 2
   - **Color:** Red (RGB: 255, 0, 0)
   - **CanCollide:** True
   - **Density:** 0.5

3. Rename to **"VirusVial_1"**
4. **Position:** (5, 25, 5)

Create 7 more vials at different locations around the map.

---

## NEXT STEPS

**Go to PLACE_SPAWN_ZONES.md to create player spawn locations!**