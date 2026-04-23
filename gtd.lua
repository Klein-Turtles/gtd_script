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


local success, Rayfield = pcall(function() 
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusTools/Rayfield/main/source'))() 
end)

if not success then return end


local Window = Rayfield:CreateWindow({
    Name = base64decode("Wm9vIFNuaXBlciB2MyAoRXllYmFsbCBGaXgp"), 
    LoadingTitle = base64decode("QXBwbHlpbmcgQ29ycnVwdGVkIElELi4u"), 
    LoadingSubtitle = base64decode("YnkgVGVnYXI="),
    ConfigurationSaving = {Enabled = false}
})

local Tab = Window:CreateTab(base64decode("VGhlIFJlYWwgU2hvcA=="), nil)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFuncs = ReplicatedStorage:WaitForChild("RemoteFunctions")
local PromptDevProduct = RemoteFuncs:FindFirstChild("PromptDeveloperProduct")

local function snipeProduct(id)
    if PromptDevProduct then
        PromptDevProduct:InvokeServer(id, base64decode("c2hvcA==")) 
        Rayfield:Notify({
            Title = base64decode("VGFyZ2V0IEFjcXVpcmVk"), 
            Content = base64decode("TmVtYmFrIA==") .. id, 
            Duration = 3
        })
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
