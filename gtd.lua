-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub v2",
    LoadingTitle = "Adding Bunny Golem...",
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

local PromptDevProduct = RemoteFuncs:WaitForChild("PromptDeveloperProduct")
local BuyUnitWithRobux = RemoteFuncs:WaitForChild("BuyUnitWithRobux")

-- 🛠️ Fungsi Utama Pembelian
local function executePurchase(type, id, suffix)
    local fullName = id .. suffix
    local success, err = pcall(function()
        if type == "Unit" then
            BuyUnitWithRobux:InvokeServer(fullName)
        else
            PromptDevProduct:InvokeServer(fullName, "shop")
        end
    end)
    
    if success then
        Rayfield:Notify({Title = "Sent!", Content = "Membeli: " .. fullName, Duration = 2})
    else
        warn("Gagal: " .. tostring(err))
    end
end

-- 📝 Daftar Item & Unit (Update: Bunny Golem Added)
local items = {
    {name = "Candy Corns", id = "dp_gd_double_candycorns", type = "Item"},
    {name = "Double Space Gems", id = "dp_gd_double_spacegems", type = "Item"},
    {name = "Corrupted Plant", id = "ub_corrupted", type = "Unit"},
    {name = "Teslaflora x2", id = "unit_choco_tesla", type = "Unit"},
    {name = "Egg Basket", id = "unit_egg_basket", type = "Unit"},
    {name = "Egg Plantinum", id = "unit_egg_plantinum", type = "Unit"},
    {name = "Bunny Golem", id = "unit_bunny_golem", type = "Unit"} -- ID Baru Bos!
}

-------------------------------------------------------
-- 🛒 Generator Tombol
-------------------------------------------------------

-- TAB x1
Tab1:CreateSection("Single Purchase")
for _, item in pairs(items) do
    Tab1:CreateButton({
        Name = "Buy " .. item.name .. " x1",
        Callback = function() executePurchase(item.type, item.id, "") end,
    })
end

-- TAB x3
Tab3:CreateSection("Triple Purchase")
for _, item in pairs(items) do
    Tab3:CreateButton({
        Name = "Buy " .. item.name .. " x3",
        Callback = function() executePurchase(item.type, item.id, "_x3") end,
    })
end

-- TAB x10
Tab10:CreateSection("Mega Purchase")
for _, item in pairs(items) do
    Tab10:CreateButton({
        Name = "Buy " .. item.name .. " x10",
        Callback = function() executePurchase(item.type, item.id, "_x10") end,
    })
end

Rayfield:Notify({
    Title = "Update Success!",
    Content = "Bunny Golem sudah tersedia di semua tab.",
    Duration = 5
})
