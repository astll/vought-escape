# ⚙️ GAME BALANCE CONFIGURATION

## Core Game Settings

```lua
GAME_CONFIG = {
    -- Match Settings
    MaxPlayers = 7,
    SurvivorsNeeded = 6,
    MatchDuration = 600, -- 10 minutes in seconds
    
    -- Water Tank System
    WaterTanksRequired = 8,
    VialsPerTank = 1,
    
    -- Temp V Power System
    TempVDuration = 60, -- seconds
    HealthPenalty = 0.5, -- 50% HP when power expires
    MaxActivePowers = 1, -- Can only have 1 power at a time
    
    -- Player Health
    SurvivorMaxHealth = 100,
    HomelanderMaxHealth = 250,
    
    -- Spawn System
    SurvivorsSpawnLocations = 3, -- Duos in 3 locations
    HomelanderSpawnLocation = "SevenMeetingRoom"
}
```

---

## Power Balance Values

| Power | Damage | Cooldown | Duration | Notes |
|-------|--------|----------|----------|-------|
| Laser Vision | 35/sec | 2s | N/A | Homelander only |
| Radiation Blast | 40 | 5s | N/A | Disables powers |
| Speed Dash | - | 6s | 3s | Movement only |
| Lightning Bolt | 30 | 2s | N/A | Chains damage |
| Super Strength | 50 | 1s | N/A | Breaks doors |
| Blinding Flash | 0 | 4s | 3s | Stun effect |
| Regeneration | +10/sec | 10s | 8s | Heal only |
| Blood Lash | 40 | 3s | N/A | 20 stud range |
| Head Burst | 45 | 4s | N/A | AOE explosion |

---

## Door Health Values

| Door | Health | Melee Hits | Explosive Hits |
|-----|--------|-----------|-----------------|
| Reinforced Door | 200 | 4 hits | 1 hit |
| Standard Door | 100 | 2 hits | Breaks |
| Executive Door | 300 | 6 hits | 2 hits |

---

## Player Stats Multipliers

```lua
STAT_MULTIPLIERS = {
    Kills = {
        Survivor = 100, -- 100 XP per kill
        Homelander = 50 -- 50 XP (easier to get kills)
    },
    Objective = {
        VialCollected = 50,
        TankFilled = 200,
        SurvivalBonus = 300 -- Survivors get 300 XP for surviving
    },
    LossPenalty = {
        SurvivalFail = -50,
        HomelanderFail = -100
    }
}
```

---

## Matchmaking Settings

```lua
MATCHMAKING = {
    SearchTimeout = 30, -- seconds to wait for match
    SkillTiers = {
        Bronze = {Min = 0, Max = 500},
        Silver = {Min = 501, Max = 1000},
        Gold = {Min = 1001, Max = 1500},
        Platinum = {Min = 1501, Max = 2000},
        Diamond = {Min = 2001, Max = 99999}
    },
    RankedMode = {
        PointsPerWin = 25,
        PointsPerLoss = -10,
        PromotionThreshold = 100,
        DemotionThreshold = -100
    }
}
```

---

## Cosmetic Pricing

```lua
COSMETICS = {
    Skins = {
        Common = 199, -- Robux (≈$1.99)
        Uncommon = 349,
        Rare = 699,
        Epic = 1199,
        Legendary = 1999
    },
    Emotes = {
        Common = 99,
        Epic = 399
    },
    TrailEffects = {
        Common = 149,
        Legendary = 599
    },
    VictoryPoses = {
        Common = 99,
        Epic = 399
    }
}
```

---

## Battle Pass Settings

```lua
BATTLE_PASS = {
    FreePass = {
        Tiers = 100,
        RewardSpacing = 1, -- Reward every tier
        TiersPerLevel = 5 -- Requires 5 matches per tier
    },
    PremiumPass = {
        Cost = 999, -- Robux
        Tiers = 100,
        SkipCost = 99, -- Cost to skip 1 tier
        BonusRewards = 50 -- 50% more rewards in premium track
    }
}
```

---

## Achievement System

```lua
ACHIEVEMENTS = {
    Easy = {
        XpReward = 100,
        Count = 30
    },
    Medium = {
        XpReward = 250,
        Count = 40
    },
    Hard = {
        XpReward = 500,
        Count = 25
    },
    Legendary = {
        XpReward = 1000,
        Count = 5
    }
}
```

---

## Daily & Weekly Rewards

```lua
DAILY_REWARDS = {
    Day1 = {Coins = 50, Items = "Common Cosmetic"},
    Day2 = {Coins = 75},
    Day3 = {Coins = 100},
    Day4 = {Coins = 125},
    Day5 = {Coins = 150, Items = "Rare Cosmetic"},
    Day6 = {Coins = 175},
    Day7 = {Coins = 200, Items = "Epic Cosmetic", Bonus = "Streak Multiplier x2"}
}

WEEKLY_CHALLENGES = {
    Challenge1 = {Reward = 500, Requirement = "Win 5 matches"},
    Challenge2 = {Reward = 400, Requirement = "Collect 20 virus vials"},
    Challenge3 = {Reward = 300, Requirement = "Fill 15 water tanks"},
    Challenge4 = {Reward = 500, Requirement = "Get 10 eliminations as Homelander"},
    Challenge5 = {Reward = 400, Requirement = "Use all 9 powers (1 each)"}
}
```

---

## Seasonal Events

```lua
SEASONS = {
    Season1 = {
        Name = "The Rise of Homelander",
        Duration = 60, -- days
        MaxTier = 100,
        ExclusiveCosmeticTheme = "Vought Corporate"
    },
    Season2 = {
        Name = "The Boys Strike Back",
        Duration = 60,
        MaxTier = 100,
        ExclusiveCosmeticTheme = "The Boys Tactical"
    }
}
```

---

## Ranking System

```lua
RANKED_DIVISIONS = {
    Bronze = {Icon = "Bronze", Colors = {200, 100, 0}},
    Silver = {Icon = "Silver", Colors = {192, 192, 192}},
    Gold = {Icon = "Gold", Colors = {255, 215, 0}},
    Platinum = {Icon = "Platinum", Colors = {0, 255, 200}},
    Diamond = {Icon = "Diamond", Colors = {100, 149, 237}}
}
```

---

## Server Settings

```lua
SERVER_CONFIG = {
    AntiCheatEnabled = true,
    MaxSpeedThreshold = 100, -- studs/sec
    SpeedCheckInterval = 0.1, -- seconds
    SuspiciousActivityThreshold = 5, -- flags before kick
    AutoRestartInterval = 3600, -- 1 hour
    ServerCapacity = 50 -- Max players per server
}
```