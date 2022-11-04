--anti http spy
print = getrenv().print
coroutine.wrap(function()
    if not getgenv then error("You need getgenv in order to execute this!",2) return end
    local a = "Made by h17s3#2734"
    while task.wait() and #a>16 and a  do
        if #a-3 <100 then
            pcall(function()
                if getgenv then
                    getgenv().hookfunction = NIL --//Dont rename it to "nil" or anything else
                end
            end)
            pcall(function()
                if getgenv then
                    getgenv().hookfunc = NIL --//Dont rename it to "nil" or anything else
                end
            end)
        end
    end
end)()
-- Aurora Anticheat Bypass:
pcall(function()local OldNameCall OldNameCall = hookmetamethod(game, "__namecall", function(...)    
local args = {...}
if getnamecallmethod() == "FireServer" then
    if string.find(tostring(args[1]),"fearthe11") then
       return --nil   
end
end
   return OldNameCall(...)
end)
end)
--special memory check anti kick
hookfunction((gcinfo or collectgarbage), function(...)
    if getgenv().Memory then
     return math.random(200,350) -- memory check
   end 
end)
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod() == "Kick" and  getgenv().Kick then
            return nil
    end
    return OldNameCall(...)
end)
--VG HUB ANTICHEAT BYPASS
repeat
    task.wait()
until game:IsLoaded()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/ok'))()

local Disables = {
    game:GetService("Players").LocalPlayer.Idled,
    game:GetService("ScriptContext").Error,
    game:GetService("LogService").MessageOut
}

local Nos = {
    "PreloadAsync",
    "Kick",
    "kick",
    "xpcall",
    "gcinfo",
    "collectgarbage",
}

local Yes = {
    game:GetService("Players").LocalPlayer,
    game:GetService("CoreGui"),
}

for i, v in pairs(Disables) do
    for i, v in pairs(getconnections(v)) do
        v:Disable()
    end
end

local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    newcclosure(
        function(self, ...)
            local A = {...}

            if table.find(Nos, getnamecallmethod()) and table.find(Yes, self)   then
                return nil or wait(math.huge)
            end
            if getnamecallmethod()=="FindService" and self.Name == "VirtualUser" and self.Name == "VirtualInputManager" then
                return 
            end
            if typeof(A) ~= "Instance" then
                return OldNameCall(self, ...)
            end
            return OldNameCall(unpack(A), self, ...)
        end
    )
)

if setfflag then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
end
if setfpscap then
    setfpscap(100)
end

game:GetService("ScriptContext"):SetTimeout(0.5)
--IRIS ANTICHEAT BYPASS AND JUMPOWER AND WALKSPEED BYPASS
getgenv().BypassSettings = {
   ["Crystal AntiCheat"] = true,
   ["Adonis"] = true,

   ["Anti-Obfuscated Scripts"] = false,-- CANNOT BE ENABLED WITH CRYSTAL This will block any obfuscated script on the client from running (Not executed by your exploit thought)
   ["Random"] = true, -- Will disallow scripts calling, GetPropertyChanged signal on WalkSpeed, JumpPower, Gravity, Health, LogService

   ["Enable Kill Logs"] = true, -- Say if you want to get told what's bypassed
}

loadstring(game:HttpGet("https://irisapp.ca/TheGoodSucc/iAntiCheat.lua"))()
--extra
local out = rconsoleprint or function() end

local mt = getrawmetatable(game)
local oldindex = mt.__index
local oldnewindex = mt.__newindex
setreadonly(mt, false)

local hum = game:service'Players'.LocalPlayer.Character.Humanoid
local oldws = hum.WalkSpeed
local oldjp = hum.JumpPower

mt.__newindex = newcclosure(function(t, k, v)
    if checkcaller() then
        return oldnewindex(t,k,v)
    elseif (t:IsA'Humanoid' and k == "WalkSpeed") then
        out'Walkspeed newindex spoofed.\n'
        v = tonumber(v)
        if not v then v = 0 end
        oldws = v
    elseif (t:IsA'Humanoid' and k == "JumpPower") then
        out'Jumppower newindex spoofed.\n'
        v = tonumber(v)
        if not v then v = 0 end
        oldjp = v
    else
        return oldnewindex(t,k,v)
    end
end)

mt.__index = newcclosure(function(t, k)
    if checkcaller() then
        return oldindex(t,k)
    elseif (t:IsA'Humanoid' and k == "WalkSpeed") then
        out'Walkspeed index spoofed.\n'
        return oldws
    elseif (t:IsA'Humanoid' and k == "JumpPower") then
        out'Jumppower index spoofed.\n'
        return oldjp
    else
        return oldindex(t,k)
    end
end)

setreadonly(mt, true)

out'Walkspeed & Jumppower bypass started.\n'
--memory spoof check
hookfunction((gcinfo or collectgarbage), function(...) -- Hook gcinfo or collectgarbage
   return math.random(200,350) -- Always return a legit looking value
end)
