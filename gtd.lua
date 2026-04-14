-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub v2 (Fix)",
    LoadingTitle = "Pasti asdiadjsjnadfsa..",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Definisi Tab
local Tab1 = Window:CreateTab("Shop x1", nil)
local Tab3 = Window:CreateTab("Shop x3", nil)
local Tab10 = Window:CreateTab("Shop x10", nil)

-- 📦 Services & Remotes (Dibungkus pcall biar gak macet)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:FindFirstChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs and RemoteFuncs:FindFirstChild("PromptDeveloperProduct")
local BuyUnitWithRobux = RemoteFuncs and RemoteFuncs:FindFirstChild("BuyUnitWithRobux")

-- 🛠️ Fungsi Utama
local function executePurchase(type, id, suffix)
    local fullName = id .. suffix
    if type == "Unit" and BuyUnitWithRobux then
        BuyUnitWithRobux:InvokeServer(fullName)
    elseif PromptDevProduct then
        PromptDevProduct:InvokeServer(fullName, "shop")
    else
        Rayfield:Notify({Title = "Error", Content = "Remote tidak ditemukan di game ini!", Duration = 3})
    end
end

-- 📝 Daftar Item
local items = {
    {n = "Candy Corns", id = "dp_gd_double_candycorns", t = "Item"},
    {n = "Double Space Gems", id = "dp_gd_double_spacegems", t = "Item"},
    {n = "Corrupted Plant", id = "unit_eyeball", t = "Unit"},
    {n = "Teslaflora x2", id = "unit_coil", t = "Unit"},
    {n = "Egg Basket", id = "unit_egg_basket", t = "Unit"},
    {n = "Egg Plantinum", id = "unit_eggplantinum", t = "Unit"},
    {n = "Shockolate", id = "unit_choco_tesla", t = "Unit"}
}

-- 🛒 Pembuatan Tombol Manual (Anti-Gagal)
for _, item in ipairs(items) do
    -- Tab x1
    Tab1:CreateButton({
        Name = "Buy " .. item.n .. " x1",
        Callback = function() executePurchase(item.t, item.id, "") end,
    })
    -- Tab x3
    Tab3:CreateButton({
        Name = "Buy " .. item.n .. " x3",
        Callback = function() executePurchase(item.t, item.id, "_x3") end,
    })
    -- Tab x10
    Tab10:CreateButton({
        Name = "Buy " .. item.n .. " x10",
        Callback = function() executePurchase(item.t, item.id, "_x10") end,
    })
end

Rayfield:Notify({Title = "Ready!", Content = "Cek tab sekarang!", Duration = 5})
