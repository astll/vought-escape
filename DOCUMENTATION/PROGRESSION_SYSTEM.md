# 🎖️ PROGRESSION SYSTEM - Levels, XP & Rewards

## Overview

Complete progression system with levels, achievements, and seasonal rewards.

---

## Level System

```lua
LEVEL_SYSTEM = {
    MaxLevel = 200,
    XpPerLevel = {
        [1] = 1000,
        [5] = 1500,
        [10] = 2000,
        [25] = 3000,
        [50] = 5000,
        [100] = 10000,
        [150] = 15000,
        [200] = 20000
    },
    RewardPerLevel = {
        Coins = 100,
        BattlePassXP = 50,
        RarityChance = 0.05 -- 5% chance per level for cosmetic
    }
}
```

---

## XP Gains

| Action | XP | Notes |
|--------|-----|-------|
| Win as Survivor | 500 | +100 if all tanks filled |
| Win as Homelander | 300 | +50 per elimination |
| Collect Virus Vial | 50 | Per vial |
| Fill Water Tank | 200 | Complete tank |
| Survive 5 mins | 100 | Without dying |
| Eliminate Player | 100 | Any mode |
| Assist | 50 | Help defeat player |

---

## Achievement System

### Easy Achievements (30 total)
- Play 1 match
- Win 1 match
- Get 1 kill
- Collect 5 vials
- Fill 5 tanks
- Reach Level 5
- Use 3 different powers
- Play with a friend
- Survive 2 minutes
- Collect 50 coins

### Medium Achievements (40 total)
- Win 10 matches
- Get 50 kills total
- Reach Level 25
- Complete battle pass tier 10
- Get 5 kills in one match
- Use all 9 powers
- Win 5 matches in a row
- Fill all 8 tanks in one match
- Reach Gold rank
- Spend 1000 coins

### Hard Achievements (25 total)
- Win 50 matches
- Get 500 kills total
- Reach Level 100
- Reach Platinum rank
- Get 10 kills as Homelander
- Survive entire 10-minute match as survivor
- Complete all weekly challenges
- Fill tanks in under 3 minutes
- Win without using any powers
- Get first place on leaderboard

### Legendary Achievements (5 total)
- Reach Level 200
- Win 200 matches
- Get 2000 kills
- Reach Diamond rank
- Survive 100 matches without dying

---

## Battle Pass Tiers

**Free Battle Pass (100 tiers):**
- Rewards every tier
- Mix of coins, cosmetics, and XP boosters

**Premium Battle Pass (+100 tiers):**
- All free pass rewards
- 50% more coins
- Exclusive cosmetics (premium-only)
- 2x XP multiplier
- Instant 10-tier skip option

---

## Seasonal Cosmetics

```lua
SEASONAL_COSMETICS = {
    Season1 = {
        Theme = "Vought Corporate",
        Skins = {
            {Name = "CEO Homelander", Rarity = "Legendary"},
            {Name = "Corporate Soldier Boy", Rarity = "Epic"},
            {Name = "Office Starlight", Rarity = "Rare"}
        },
        Emotes = {
            {Name = "Corporate Bow Tie", Rarity = "Uncommon"},
            {Name = "Briefcase Flex", Rarity = "Epic"}
        },
        ExclusiveReward = "Homelander with Briefcase"
    }
}
```

---

## Cosmetic Tiers

| Rarity | Drop Rate | Price | Exclusivity |
|--------|-----------|-------|-------------|
| Common | 50% | 199 Robux | Shop |
| Uncommon | 30% | 349 Robux | Shop |
| Rare | 12% | 699 Robux | Shop or Battle Pass |
| Epic | 6% | 1199 Robux | Shop, Pass, or Event |
| Legendary | 2% | 1999 Robux | Seasonal only |

---

## Leaderboard Tiers

**Global Leaderboard:**
- Ranked by total kills
- Updated daily
- Top 100 get cosmetic rewards

**Seasonal Leaderboard:**
- Reset each season
- Ranked by win rate %
- Top 10 get exclusive cosmetics

**Friends Leaderboard:**
- Only friends visible
- Ranked by kills
- Always available

---

## Prestige System

After reaching Level 200:
- **Prestige 1:** Reset to Level 1, keep all cosmetics, get special Prestige badge
- **Prestige 2:** 2x XP multiplier for next grind
- **Prestige 3+:** Stackable benefits

---

## Daily Missions

```lua
DAILY_MISSIONS = {
    Monday = {
        {Reward = 100, Requirement = "Win 1 match"},
        {Reward = 200, Requirement = "Get 5 kills"},
        {Reward = 150, Requirement = "Collect 10 vials"}
    },
    Tuesday = {
        {Reward = 100, Requirement = "Survive 5 minutes"},
        {Reward = 200, Requirement = "Fill 5 tanks"},
        {Reward = 150, Requirement = "Play 3 matches"}
    },
    -- ... more days ...
}
```

---

## Weekly Challenges

- 5 new challenges per week
- Cumulative rewards (unlock higher tiers)
- Reset every Monday

---

## Seasonal Rank Progression

```
Bronze III → Bronze II → Bronze I
    ↓
Silver III → Silver II → Silver I
    ↓
Gold III → Gold II → Gold I
    ↓
Platinum III → Platinum II → Platinum I
    ↓
Diamond
```

Points per tier: 100  
Points per win: +25  
Points per loss: -10  

---

## Cosmetic Unlocking Methods

1. **Battle Pass** - Tier rewards
2. **Shop** - Direct purchase with Robux
3. **Events** - Limited-time rewards
4. **Achievements** - Reach milestones
5. **Prestige** - High-level rewards
6. **Ranked** - Top leaderboard finishes