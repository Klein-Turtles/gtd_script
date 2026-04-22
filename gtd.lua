return(function(eZRN2, ...)
local 3nfwLi = {"4eyjK";"M2Yuyk";"UkP";"NbHIedNKVLf";"jf1Pcmmj";"N0HWOhNY";"d2idGRj";"Ra9TpDvc";"mXtA";"6X02HIvR";"JHyuu9JWN9O6Zqsp";"CkHm6LlDgo"}
local VwytCgvo = function(...)
-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn(loadstring(base64decode("R2FnYWwgbG9hZCBSYXlmaWVsZCE="))()) return end

local Window = Rayfield:CreateWindow({
    Name = loadstring(base64decode("Wm9vIFNuaXBlciB2MyAoRXllYmFsbCBGaXgp"))(),
    LoadingTitle = loadstring(base64decode("QXBwbHlpbmcgQ29ycnVwdGVkIElELi4u"))(),
    LoadingSubtitle = loadstring(base64decode("YnkgVGVnYXI="))(),
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab(loadstring(base64decode("VGhlIFJlYWwgU2hvcA=="))(), nil)
local ReplicatedStorage = game:GetService(loadstring(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))())
local RemoteFuncs = ReplicatedStorage:WaitForChild(loadstring(base64decode("UmVtb3RlRnVuY3Rpb25z"))())
local PromptDevProduct = RemoteFuncs:FindFirstChild(loadstring(base64decode("UHJvbXB0RGV2ZWxvcGVyUHJvZHVjdA=="))())

-- 🛠️ Fungsi Tembak Developer Product
local function snipeProduct(id)
    if PromptDevProduct then
        -- Kita pakai ID asli dari Module: dp_unit_eyeball
        -- Kita coba kirim ke kategori loadstring(base64decode("c2hvcA=="))() seperti di script aslinya
        print(loadstring(base64decode("8J+OryBTbmlwaW5nIFByb2R1Y3Q6IA=="))() .. id)
        PromptDevProduct:InvokeServer(id, loadstring(base64decode("c2hvcA=="))())
        
        Rayfield:Notify({
            Title = loadstring(base64decode("VGFyZ2V0IEFjcXVpcmVk"))(),
            Content = loadstring(base64decode("TmVtYmFrIA=="))() .. id .. loadstring(base64decode("IHZpYSBEZXZQcm9kdWN0IQ=="))(),
            Duration = 3
        })
    else
        Rayfield:Notify({Title = loadstring(base64decode("RXJyb3I="))(), Content = loadstring(base64decode("UmVtb3RlIFByb21wdERldlByb2R1Y3QgaWxhbmch"))(), Duration = 5})
    end
end

Tab:CreateSection(loadstring(base64decode("RXhjbHVzaXZlIFVuaXRz"))())

-- Tombol Eyeball dengan ID yang BENAR (dp_unit_eyeball)
Tab:CreateButton({
    Name = loadstring(base64decode("8J+Rge+4jyBCdXkgQ29ycnVwdGVkIFN0ZW0gKEV5ZWJhbGwp"))(),
    Callback = function() 
        snipeProduct(loadstring(base64decode("ZHBfdW5pdF9leWViYWxs"))()) -- ID SESUAI MODULE
    end,
})

-- Tombol Tesla (Buat perbandingan)
Tab:CreateButton({
    Name = loadstring(base64decode("4pqhIEJ1eSBUZXNsYWZsb3JhIChDb2lsKQ=="))(),
    Callback = function() 
        snipeProduct(loadstring(base64decode("ZHBfdW5pdF9jb2ls"))()) -- Biasanya polanya sama pakai 'dp_'
    end,
})

Tab:CreateSection(loadstring(base64decode("UXVhbnRpdGllcw=="))())
-- Versi Bulk jika ID-nya mendukung suffix
Tab:CreateButton({
    Name = loadstring(base64decode("8J+TpiBCdXkgRXllYmFsbCB4Mw=="))(),
    Callback = function() snipeProduct(loadstring(base64decode("ZHBfdW5pdF9leWViYWxsX3gz"))()) end,
})
end
a8xzYlBT(KYCoH)
end)(...)
