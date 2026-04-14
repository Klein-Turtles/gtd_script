-- 🧩 Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Zoo Event Hub",
    LoadingTitle = "Loading Halloween Shop...",
    LoadingSubtitle = "by Tegar",
    ConfigurationSaving = {Enabled = false}
})

-- 📑 Tab Event
local EventTab = Window:CreateTab("Halloween Event", nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PromptGamePass = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("PromptGamePass")

-------------------------------------------------------
-- 🍬 Section: Halloween Gifts
-------------------------------------------------------
EventTab:CreateSection("Limited Event Items")

-- Tombol Utama: x2 Candy Corns GIFT
EventTab:CreateButton({
    Name = "Buy x2 Candy Corns GIFT",
    Callback = function()
        -- Menggunakan format args sesuai yang kamu minta
        local args = {
            "gp_double_candycorns", -- Prediksi string ID, jika gagal coba "gp_x2_candycorns"
            "shop"
        }
        
        local success, err = pcall(function()
            PromptGamePass:InvokeServer(unpack(args))
        end)
        
        if success then
            Rayfield:Notify({Title = "Purchase Sent", Content = "Request x2 Candy Corns dikirim!", Duration = 3})
        else
            warn("Gagal: " .. tostring(err))
        end
    end,
})

-- Tombol Double Space Gems (Sebagai Backup/Contoh yang sudah pasti jalan)
EventTab:CreateButton({
    Name = "Buy Double Space Gems",
    Callback = function()
        local args = {
            "gp_double_spacegems",
            "shop"
        }
        PromptGamePass:InvokeServer(unpack(args))
    end,
})

-------------------------------------------------------
-- 💡 Tips
-------------------------------------------------------
EventTab:CreateSection("Troubleshoot")
EventTab:CreateParagraph("Jika Pop-up Tidak Muncul", "Beberapa game event menggunakan ID unik. Jika 'gp_double_candycorns' tidak bekerja, gunakan Dex Explorer untuk melihat folder 'RemoteFunctions' atau 'ProductData' untuk mencari string aslinya.")

Rayfield:Notify({
    Title = "Event Script Loaded",
    Content = "Siap untuk belanja Candy Corns!",
    Duration = 5
})