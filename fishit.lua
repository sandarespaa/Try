-- Load Rayfield UI Library
loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Create GUI Window
local Window = Rayfield:CreateWindow({
   Name = "Fish It - Rod Modifier",
   LoadingTitle = "Fish It Script",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FishItMods",
      FileName = "RodSettings"
   }
})

-- Tab
local ModTab = Window:CreateTab("Rod Modifier", 4483362458)

-- Variables
local castSpeed = 1
local pullStrength = 1
local durability = 100

-- Sliders
ModTab:CreateSlider({
   Name = "Casting Speed",
   Range = {1, 10},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 1,
   Callback = function(Value)
      castSpeed = Value
      updateRodStats()
   end,
})

ModTab:CreateSlider({
   Name = "Pull Strength",
   Range = {1, 10},
   Increment = 0.1,
   Suffix = "x",
   CurrentValue = 1,
   Callback = function(Value)
      pullStrength = Value
      updateRodStats()
   end,
})

ModTab:CreateSlider({
   Name = "Rod Durability",
   Range = {1, 100},
   Increment = 1,
   Suffix = "%",
   CurrentValue = 100,
   Callback = function(Value)
      durability = Value
      updateRodStats()
   end,
})

-- Function untuk update Rod (Kamu harus sesuaikan ini dengan sistem dalam game "Fish It")
function updateRodStats()
   local player = game.Players.LocalPlayer
   local rod = player.Character and player.Character:FindFirstChild("FishingRod")

   if rod then
      -- Cek apakah rod punya properti yang bisa dimodifikasi
      if rod:FindFirstChild("CastSpeed") then
         rod.CastSpeed.Value = castSpeed
      end
      if rod:FindFirstChild("PullStrength") then
         rod.PullStrength.Value = pullStrength
      end
      if rod:FindFirstChild("Durability") then
         rod.Durability.Value = durability
      end
   end
end
