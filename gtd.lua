-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Premium Hub v2",
    LoadingTitle = "Fixing Eggplantinum...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Definisi Tab
local Tab1 = Window:CreateTab("Shop x1", nil)
local Tab3 = Window:CreateTab("Shop x3", nil)
local Tab10 = Window:CreateTab("Shop x10", nil)
local DebugTab = Window:CreateTab("Debug/Spy", nil)

-- 📦 Services & Remotes
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")

local PromptDevProduct = RemoteFuncs:WaitForChild("PromptDeveloperProduct")
local BuyUnitWithRobux = RemoteFuncs:WaitForChild("BuyUnitWithRobux")

-- 🛠️ Fungsi Universal untuk Membeli
local function executePurchase(type, id, suffix)
    local fullName = id .. suffix
    local success, err

    if type == "Unit" then
        success, err = pcall(function()
            BuyUnitWithRobux:InvokeServer(fullName)
        end)
    else
        success, err = pcall(function()
            PromptDevProduct:InvokeServer(fullName, "shop")
        end)
    end

    if success then
        Rayfield:Notify({Title = "Request Sent!", Content = "Membeli: " .. fullName, Duration = 2})
    else
        warn("Gagal: " .. tostring(err))
    end
end

-- 📝 Daftar Item & Unit (Update ID Eggplantinum)
local items = {
    {name = "Candy Corns", id = "dp_gd_double_candycorns", type = "Item"},
    {name = "Double Space Gems", id = "dp_gd_double_spacegems", type = "Item"},
    {name = "Corrupted Plant", id = "ub_corrupted", type = "Unit"},
    {name = "Teslaflora x2", id = "unit_choco_tesla", type = "Unit"},
    {name = "Egg Basket", id = "unit_egg_basket", type = "Unit"},
    -- Coba beberapa variasi ID Eggplantinum jika unit_eggplantinum gagal:
    {name = "Egg Plantinum", id = "unit_eggplantinum", type = "Unit"} 
}

-------------------------------------------------------
-- 🛒 LOOP GENERATOR TOMBOL
-------------------------------------------------------
local function generateButtons(tab, suffix)
    for _, item in ipairs(items) do
        tab:CreateButton({
            Name = "Buy " .. item.name .. (suffix == "" and " x1" or " " .. suffix:sub(2)),
            Callback = function() executePurchase(item.type, item.id, suffix) end,
        })
    end
end

generateButtons(Tab1, "")
generateButtons(Tab3, "_x3")
generateButtons(Tab10, "_x10")

-------------------------------------------------------
-- 🔍 DEBUG: UNIT SPY (Biar tau ID Aslinya)
-------------------------------------------------------
DebugTab:CreateSection("Cari ID Unit Asli")
DebugTab:CreateButton({
    Name = "Aktifkan Unit Spy (Cek F9/Console)",
    Callback = function()
        Rayfield:Notify({Title = "Spy Aktif!", Content = "Klik beli unit apa saja di toko asli game!", Duration = 5})
        local oldInvoke
        oldInvoke = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            if tostring(self) == "BuyUnitWithRobux" and getnamecallmethod() == "InvokeServer" then
                print("--- ID UNIT DITEMUKAN: " .. tostring(args[1]) .. " ---")
                Rayfield:Notify({Title = "ID Ketemu!", Content = tostring(args[1]), Duration = 10})
            end
            return oldInvoke(self, ...)
        end)
    end,
})

Rayfield:Notify({
    Title = "Script Ready!",
    Content = "Cek tab Debug jika Eggplantinum masih gagal.",
    Duration = 5
})
