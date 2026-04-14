-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub v2",
    LoadingTitle = "Fixing TeslaFlora UI...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Definisi Tab
local Tab1 = Window:CreateTab("Shop x1", nil)
local Tab3 = Window:CreateTab("Shop x3", nil)
local Tab10 = Window:CreateTab("Shop x10", nil)

-- 📦 Services & Remotes
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")

-- Remote Handlers (pcall agar jika satu gagal, GUI tidak rusak)
local PromptDevProduct = RemoteFuncs:WaitForChild("PromptDeveloperProduct")
local BuyUnitWithRobux = RemoteFuncs:WaitForChild("BuyUnitWithRobux")

-- 🛠️ Fungsi Universal untuk Membeli
local function executePurchase(type, id, suffix)
    -- Perbaikan: Pastikan suffix hanya menempel jika ID tidak kosong
    local fullName = id .. suffix
    
    local success, err = pcall(function()
        if type == "Unit" then
            -- Manggil remote khusus Unit
            BuyUnitWithRobux:InvokeServer(fullName)
        else
            -- Manggil remote khusus Item (Keep in Bag)
            PromptDevProduct:InvokeServer(fullName, "shop")
        end
    end)
    
    if success then
        Rayfield:Notify({Title = "Request Sent!", Content = "Membeli: " .. fullName, Duration = 2})
    else
        warn("Gagal eksekusi: " .. tostring(err))
    end
end

-- 📝 Daftar Item & Unit (ID DISESUAIKAN)
local items = {
    {name = "Candy Corns", id = "dp_gd_double_candycorns", type = "Item"},
    {name = "Double Space Gems", id = "dp_gd_double_spacegems", type = "Item"},
    {name = "Corrupted Plant (Unit)", id = "ub_corrupted", type = "Unit"},
    {name = "Teslaflora (Unit)", id = "unit_teslaflora", type = "Unit"} -- ID sudah diperbaiki
}

-------------------------------------------------------
-- 🛒 GENERATOR TOMBOL (Automated)
-------------------------------------------------------

-- Tab x1
Tab1:CreateSection("Single Purchase")
for _, item in ipairs(items) do
    Tab1:CreateButton({
        Name = "Buy " .. item.name .. " x1",
        Callback = function() executePurchase(item.type, item.id, "") end,
    })
end

-- Tab x3
Tab3:CreateSection("Triple Purchase")
for _, item in ipairs(items) do
    Tab3:CreateButton({
        Name = "Buy " .. item.name .. " x3",
        Callback = function() executePurchase(item.type, item.id, "_x3") end,
    })
end

-- Tab x10
Tab10:CreateSection("Mega Purchase")
for _, item in ipairs(items) do
    Tab10:CreateButton({
        Name = "Buy " .. item.name .. " x10",
        Callback = function() executePurchase(item.type, item.id, "_x10") end,
    })
end

Rayfield:Notify({
    Title = "Fix Applied!",
    Content = "Teslaflora & Corrupted Plant Ready.",
    Duration = 5
})
