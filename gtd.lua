-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Halloween Hub",
    LoadingTitle = "Personal Inventory Mode...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Definisi Tab
local Tab1 = Window:CreateTab("Buy x1", nil)
local Tab3 = Window:CreateTab("Buy x3", nil)
local Tab10 = Window:CreateTab("Buy x10", nil)

-- 📦 Services & Remotes (Sesuai Folder Baru)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PromptDevProduct = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("PromptDeveloperProduct")

-- Fungsi Universal untuk Membeli (Keep in Bag)
local function buyKeep(itemID, suffix)
    local fullName = itemID .. suffix
    local args = {
        fullName, 
        "shop" -- Argumen agar tetap di tas sendiri
    }
    
    local success, err = pcall(function()
        PromptDevProduct:InvokeServer(unpack(args))
    end)
    
    if success then
        Rayfield:Notify({Title = "Sent!", Content = "Request " .. fullName .. " ke tas dikirim.", Duration = 2})
    else
        warn("Gagal: " .. tostring(err))
    end
end

-- Daftar Item (Gunakan ID yang sudah di-scratch atau diprediksi)
-- Pastikan ID menggunakan prefix dp_gd_ sesuai sistem baru
local halloweenItems = {
    {name = "Candy Corns", id = "dp_gd_candycorns"},
    {name = "Double Space Gems", id = "dp_gd_double_spacegems"},
    {name = "Halloween Gift", id = "dp_gd_halloween_gift"}
}

-------------------------------------------------------
-- 🍬 TAB 1: BUY x1
-------------------------------------------------------
Tab1:CreateSection("Keep in Bag (x1)")
for _, item in ipairs(halloweenItems) do
    Tab1:CreateButton({
        Name = "Buy " .. item.name .. " x1",
        Callback = function() buyKeep(item.id, "") end, -- Biasanya x1 tanpa suffix
    })
end

-------------------------------------------------------
-- 🍬 TAB 3: BUY x3
-------------------------------------------------------
Tab3:CreateSection("Keep in Bag (x3)")
for _, item in ipairs(halloweenItems) do
    Tab3:CreateButton({
        Name = "Buy " .. item.name .. " x3",
        Callback = function() buyKeep(item.id, "_x3") end,
    })
end

-------------------------------------------------------
-- 🍬 TAB 10: BUY x10
-------------------------------------------------------
Tab10:CreateSection("Keep in Bag (x10)")
for _, item in ipairs(halloweenItems) do
    Tab10:CreateButton({
        Name = "Buy " .. item.name .. " x10",
        Callback = function() buyKeep(item.id, "_x10") end,
    })
end

-------------------------------------------------------
-- 🎉 Notifikasi
-------------------------------------------------------
Rayfield:Notify({
    Title = "Personal Mode Active",
    Content = "Semua pembelian akan diarahkan ke tas kamu.",
    Duration = 5
})
