# 🎮 MAIN MENU UI - Complete Setup Guide

## Overview

The main menu is the first screen players see when joining the game.

---

## Create Main Menu Structure

### Step 1: Create ScreenGui

1. In **Explorer**, find **StarterGui** (not StarterPlayer)
2. Right-click → **"Insert Object"** → **"ScreenGui"**
3. Name it: **"MainMenu"**
4. In **Properties:**
   - **ResetOnSpawn:** False
   - **ZIndexBehavior:** Sibling

---

### Step 2: Add Background

1. Right-click **MainMenu** → **"Insert Object"** → **"ImageLabel"**
2. Name: **"Background"**
3. Properties:
   - **Size:** X: 1 (100%), Y: 1 (100%), Scale
   - **Position:** X: 0, Y: 0, Offset
   - **BackgroundColor3:** RGB(30, 30, 30) - Dark background
   - **BorderSizePixel:** 0

---

### Step 3: Add Logo

1. Right-click **MainMenu** → **"Insert Object"** → **"TextLabel"**
2. Name: **"Title"**
3. Properties:
   - **Text:** "VOUGHT ESCAPE"
   - **TextSize:** 80
   - **Font:** GothamBold
   - **TextColor3:** RGB(255, 0, 0) - Red like Homelander
   - **Size:** X: 0.6, Y: 0.2, Scale
   - **Position:** X: 0.2, Y: 0.1, Scale
   - **BackgroundTransparency:** 1
   - **TextScaled:** True

---

### Step 4: Add Main Menu Buttons

**Play Button:**
1. Right-click **MainMenu** → **"Insert Object"** → **"TextButton"**
2. Name: **"PlayButton"**
3. Properties:
   - **Text:** "PLAY"
   - **TextSize:** 48
   - **Size:** X: 0.3, Y: 0.12, Scale
   - **Position:** X: 0.35, Y: 0.35, Scale
   - **BackgroundColor3:** RGB(255, 0, 0)
   - **BorderSizePixel:** 0
   - **TextColor3:** RGB(255, 255, 255)

**Settings Button:**
1. Duplicate PlayButton (Ctrl+D)
2. Name: **"SettingsButton"**
3. Set **Position:** X: 0.35, Y: 0.5, Scale
4. Set **Text:** "SETTINGS"

**Shop Button:**
1. Duplicate PlayButton
2. Name: **"ShopButton"**
3. Set **Position:** X: 0.35, Y: 0.65, Scale
4. Set **Text:** "SHOP"

---

### Step 5: Add Connection Script

1. Right-click **MainMenu** → **"Insert Object"** → **"LocalScript"**
2. Name: **"MenuController"**
3. Paste:

```lua
-- Main Menu Controller
local MainMenu = script.Parent
local PlayButton = MainMenu:WaitForChild("PlayButton")
local SettingsButton = MainMenu:WaitForChild("SettingsButton")
local ShopButton = MainMenu:WaitForChild("ShopButton")

-- Play Button
PlayButton.MouseButton1Click:Connect(function()
    print("Play button clicked - Starting matchmaking")
    MainMenu:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
    -- Hide menu and start game
    wait(0.5)
    MainMenu.Visible = false
end)

-- Settings Button
SettingsButton.MouseButton1Click:Connect(function()
    print("Settings button clicked")
    -- Load settings menu
end)

-- Shop Button
ShopButton.MouseButton1Click:Connect(function()
    print("Shop button clicked")
    -- Load shop
end)

print("MainMenu loaded!")
```

---

## Menu Elements Checklist

- ✅ Background (dark, Vought-themed)
- ✅ Title text ("VOUGHT ESCAPE")
- ✅ Play button (red, prominent)
- ✅ Settings button
- ✅ Shop button
- ✅ Version number (bottom corner)
- ✅ Quit button

---

## Design Tips

1. **Color Scheme:** Red & black (Vought corporate)
2. **Font:** Use "GothamBold" for titles
3. **Buttons:** 48px text, clear spacing
4. **Animations:** Fade in on load, scale on hover

---

## Next: Matchmaking UI

Once players click Play, show the matchmaking screen.