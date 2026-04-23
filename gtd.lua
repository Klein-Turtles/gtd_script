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


local function snipeProduct(id)
    if PromptDevProduct then

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

Tab:CreateButton({
    Name = "👁️ Buy Corrupted Stem (Eyeball)",
    Callback = function() 
        snipeProduct("dp_unit_eyeball") 
    end,
})


Tab:CreateButton({
    Name = "⚡ Buy Shockolatte",
    Callback = function() 
        snipeProduct("dp_unit_choco_tesla") 
    end,
})


Tab:CreateButton({
    Name = "⚡ Buy Teslaflora",
    Callback = function() 
        snipeProduct("dp_unit_tesla") 
    end,
})


Tab:CreateButton({
    Name = "⚡ Buy SnowMan",
    Callback = function() 
        snipeProduct("dp_unit_snowman") 
    end,
})
