return(function(...)
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function base64decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d%d%d%d%d%d', function(x)
        local n=0
        for i=1,8 do n=n+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(n)
    end))
end

-- 🧩 Load Rayfield UI
local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() 
end)

if not success then warn("Gagal load Rayfield!") return end

local Window = Rayfield:CreateWindow({
    Name = base64decode("Wm9vIFNuaXBlciB2MyAoRXllYmFsbCBGaXgp"),
    LoadingTitle = base64decode("QXBwbHlpbmcgQ29ycnVwdGVkIElELi4u"),
    LoadingSubtitle = base64decode("YnkgVGVnYXI="),
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab(base64decode("VGhlIFJlYWwgU2hvcA=="), nil)
local ReplicatedStorage = game:GetService(base64decode("UmVwbGljYXRlZFN0b3JhZ2U="))
local RemoteFuncs = ReplicatedStorage:WaitForChild(base64decode("UmVtb3RlRnVuY3Rpb25z"))
local PromptDevProduct = RemoteFuncs:FindFirstChild(base64decode("UHJvbXB0RGV2ZWxvcGVyUHJvZHVjdA=="))

local function snipeProduct(id)
    if PromptDevProduct then
        print(base64decode("8J+OryBTbmlwaW5nIFByb2R1Y3Q6IA==") .. id)
        PromptDevProduct:InvokeServer(id, base64decode("c2hvcA=="))
        
        Rayfield:Notify({
            Title = base64decode("VGFyZ2V0IEFjcXVpcmVk"),
            Content = base64decode("TmVtYmFrIA==") .. id .. base64decode("IHZpYSBEZXZQcm9kdWN0IQ=="),
            Duration = 3
        })
    else
        Rayfield:Notify({Title = "Error", Content = "Remote Missing!", Duration = 5})
    end
end

Tab:CreateSection(base64decode("RXhjbHVzaXZlIFVuaXRz"))

Tab:CreateButton({
    Name = base64decode("8J+Rge+4jyBCdXkgQ29ycnVwdGVkIFN0ZW0gKEV5ZWJhbGwp"),
    Callback = function() 
        snipeProduct(base64decode("ZHBfdW5pdF9leWViYWxs")) 
    end,
})

Tab:CreateButton({
    Name = base64decode("4pqhIEJ1eSBUZXNsYWZsb3JhIChDb2lsKQ=="),
    Callback = function() 
        snipeProduct(base64decode("ZHBfdW5pdF9jb2ls")) 
    end,
})

Tab:CreateSection(base64decode("UXVhbnRpdGllcw=="))

Tab:CreateButton({
    Name = base64decode("8J+TpiBCdXkgRXllYmFsbCB4Mw=="),
    Callback = function() snipeProduct(base64decode("ZHBfdW5pdF9leWViYWxsX3gz")) end,
})

end)(...)
