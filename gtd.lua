-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub v2",
    LoadingTitle = "Integrating Teslaflora...",
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

-- Remote Handlers
local PromptDevProduct = RemoteFuncs:WaitForChild("PromptDeveloperProduct")
local BuyUnitWithRobux = RemoteFuncs:WaitForChild("BuyUnitWithRobux")

-- 🛠️ Fungsi Universal untuk Membeli
local function executePurchase(type, id, suffix)
    local fullName = id .. suffix
    local success, err

    if type == "Unit" then
        -- Logika khusus Unit
        success, err = pcall(function()
            BuyUnitWithRobux:InvokeServer(fullName)
        end)
    else
        -- Logika khusus Developer Product (Keep in Bag)
        success, err = pcall(function()
            PromptDevProduct:InvokeServer(fullName, "shop")
        end)
    end

    if success then
        Rayfield:Notify({Title = "Request Sent!", Content = fullName .. " diproses.", Duration = 2})
    else
        warn("Gagal: " .. tostring(err))
    end
end

-- 📝 Daftar Item & Unit (Teslaflora Sudah Ditambahkan)
local items = {
    {name = "Candy Corns", id = "dp_gd_double_candycorns", type = "Item"},
    {name = "Double Space Gems", id = "dp_gd_double_spacegems", type = "Item"},
    {name = "Corrupted Plant", id = "ub_corrupted", type = "Unit"},
    {name = "Teslaflora x2", id = "unit_choco_tesla", type = "Unit"},
    {name = "Egg Basket", id = "unit_egg_basket", type = "Unit"},
    {name = "Egg Plantinum", id = "unit_eggplantinum", type = "Unit"}
    }

-------------------------------------------------------
-- 🛒 TAB 1: BUY x1
-------------------------------------------------------
Tab1:CreateSection("Single Purchase (x1)")
for _, item in ipairs(items) do
    Tab1:CreateButton({
        Name = "Buy " .. item.name .. " x1",
        Callback = function() executePurchase(item.type, item.id, "") end,
    })
end

-------------------------------------------------------
-- 🛒 TAB 3: BUY x3
-------------------------------------------------------
Tab3:CreateSection("Triple Purchase (x3)")
for _, item in ipairs(items) do
    Tab3:CreateButton({
        Name = "Buy " .. item.name .. " x3",
        Callback = function() executePurchase(item.type, item.id, "_x3") end,
    })
end

-------------------------------------------------------
-- 🛒 TAB 10: BUY x10
-------------------------------------------------------
Tab10:CreateSection("Mega Purchase (x10)")
for _, item in ipairs(items) do
    Tab10:CreateButton({
        Name = "Buy " .. item.name .. " x10",
        Callback = function() executePurchase(item.type, item.id, "_x10") end,
    })
end

-------------------------------------------------------
-- 🎉 Startup Notification
-------------------------------------------------------
Rayfield:Notify({
    Title = "Script Ready!",
    Content = "Teslaflora telah ditambahkan ke semua tab.",
    Duration = 5
})
