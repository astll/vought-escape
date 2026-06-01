# ⚡ POWER SYSTEM - All 9 Temp V Powers

## Overview

This system handles all 9 unique Temp V power movesets with their abilities.

---

## Power List & Movesets

### 1. HOMELANDER (Permanent - Killer Only)

**Laser Vision**
- Damage: 35 per second
- Range: 50 studs
- Cooldown: 2 seconds
- Effect: Cuts through objects

**Super Strength**
- Melee Damage: 50 per hit
- Range: 4 studs
- Attack Speed: 1 per second
- Effect: Can break doors

**Flight**
- Speed: 40 studs/second
- Duration: Permanent
- Effect: Hover above map

---

### 2. SOLDIER BOY

**Radiation Blast**
- Damage: 40
- Range: 30 studs
- AOE Radius: 15 studs
- Effect: Disables powers for 3 seconds
- Cooldown: 5 seconds

**Super Strength**
- Melee Damage: 45
- Range: 4 studs
- Cooldown: 1.5 seconds

**Durability Boost**
- Damage Reduction: 30%
- Duration: 60 seconds
- Cooldown: 10 seconds

---

### 3. A-TRAIN

**Speed Dash**
- Movement Speed: 60 studs/second
- Duration: 3 seconds
- Cooldown: 6 seconds
- Effect: Leaves speed trail

**Speed Punches**
- Damage: 25 per hit
- Attack Rate: 3 hits/second
- Range: 4 studs
- Duration: 2 seconds

**Momentum Slam**
- Damage: 50
- Range: 20 studs
- Cooldown: 8 seconds
- Effect: Breaks obstacles

---

### 4. STORMFRONT

**Lightning Bolts**
- Damage: 30 per bolt
- Range: 40 studs
- Cooldown: 2 seconds
- Effect: Chain to nearby enemies

**Electrical Aura**
- Damage: 10/second
- Radius: 15 studs
- Duration: 5 seconds
- Cooldown: 6 seconds

**Flight**
- Speed: 35 studs/second
- Duration: 60 seconds
- Cooldown: 8 seconds

---

### 5. MOTHER'S MILK (MM)

**Super Strength**
- Melee Damage: 50
- Range: 5 studs
- Cooldown: 1 second

**Enhanced Durability**
- Damage Reduction: 25%
- Duration: Passive

**Shockwave Stomp**
- Damage: 40
- Range: 25 studs
- Stun Duration: 2 seconds
- Cooldown: 7 seconds

---

### 6. STARLIGHT

**Light Absorption**
- Charges from nearby electrical sources
- Max Charge: 100%
- Restore Rate: 20% per second near electricity

**Blinding Flash**
- Damage: 0 (disorientation only)
- Range: 30 studs
- Stun Duration: 3 seconds
- Cooldown: 4 seconds
- Effect: Temporarily blinds Homelander

**Light Beam Blast**
- Damage: 35
- Range: 45 studs
- Cooldown: 3 seconds
- Effect: Piercing attack

---

### 7. KIMIKO

**Regeneration**
- Heal Rate: 10 HP/second
- Max Heal: 30% of max HP
- Duration: 8 seconds
- Cooldown: 10 seconds

**Enhanced Reflexes**
- Dodge Chance: 40%
- Duration: 5 seconds
- Cooldown: 6 seconds
- Effect: Reduced incoming damage

**Savage Strike**
- Damage: 60
- Range: 4 studs
- Cooldown: 2 seconds
- Effect: Bonus damage if dodged recently

---

### 8. MARIE MOREAU

**Blood Lash Attack**
- Damage: 40
- Range: 20 studs
- Knockback: 15 studs
- Cooldown: 3 seconds

**Blood Revive**
- Resurrects downed teammate
- Revived teammate: 50% HP
- Range: 30 studs
- Cooldown: 15 seconds
- Effect: Can only use once per round

**Blood Shield**
- Absorption: 50 HP
- Duration: 8 seconds
- Cooldown: 8 seconds
- Effect: Blocks 1-2 hits

---

### 9. VICTORIA NEUMAN

**Head Burst**
- Damage: 45
- Range: 40 studs
- AOE Radius: 10 studs
- Cooldown: 4 seconds
- Effect: Targeted explosion

**Telekinetic Shove**
- Damage: 20
- Range: 30 studs
- Knockback: 20 studs
- Cooldown: 2 seconds

**Crowd Control Pulse**
- Damage: 15
- Range: 35 studs
- AOE Radius: 20 studs
- Stun: 2 seconds
- Cooldown: 6 seconds

---

## Power Distribution

**Temp V Syringe System:**
- 8 syringe spawns around the map
- Each has equal 1/9 chance to grant any power
- Power lasts 60 seconds
- Health reduced by 50% when power expires
- Can only hold 1 power at a time

---

## Implementation Notes

- Server validates all power usage (anti-cheat)
- Powers have global cooldown timers
- Damage scales with Temp V remaining time
- Visual effects for each power
- Sound effects on activation