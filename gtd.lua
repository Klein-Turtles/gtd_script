-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Sniper v3 (Eyeball Fix)",
    LoadingTitle = "Applying Corrupted ID...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab("The Real Shop", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")

-- 🛠️ Fungsi Tembak Developer Product
local function snipeProduct(id)
    if PromptDevProduct then
        -- Kita pakai ID asli dari Module: dp_unit_eyeball
        -- Kita coba kirim ke kategori "shop" seperti di script aslinya
        print("🎯 Sniping Product: " .. id)
        PromptDevProduct:InvokeServer(id, "shop")
        
        Rayfield:Notify({
            Title = "Target Acquired",
            Content = "Nembak " .. id .. " via DevProduct!",
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote PromptDevProduct ilang!", Duration = 5})
    end
end

Tab:CreateSection("Exclusive Units")

-- Tombol Eyeball dengan ID yang BENAR (dp_unit_eyeball)
Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeProduct("dp_unit_eyeball") -- ID SESUAI MODULE
    end,
})

-- Tombol Tesla (Buat perbandingan)
Tab:CreateButton({
    Name = "⚡ Buy Teslaflora (Coil)",
    Callback = function() 
        snipeProduct("dp_unit_coil") -- Biasanya polanya sama pakai 'dp_'
    end,
})

Tab:CreateSection("Quantities")
-- Versi Bulk jika ID-nya mendukung suffix
Tab:CreateButton({
    Name = "📦 Buy Eyeball x3",
    Callback = function() snipeProduct("dp_unit_eyeball_x3") end,
})
