--====================Registration Control
function RegisterProvider()
  
end

function UnregisterProvider()
  
end

--[[


--Example code for proper handling of incoming API calls within a provider plugin
local MAPICallbacks = {}
function MoneyAPIProviderCallback(k,...)
  if MAPICallbacks[k] then return MoneyAPIProviderCallback[k](...) end
  error("Invalid Function call")
end

function MAPICallbacks.BankHasMember()
  --Code here
end


--Alternative using __call metamethod to save on variables (probably marginally worse performance this way, but funner!)
--Warning: __call metamethod in this situation not checked. At all. Don't yell at me if it doens't work in Cuberite.
--Unless I've already tested it, found out it didn't work, and didn't fix this. Then feel free to yell at me!
MoneyAPIProviderCallback = {}
setmetatable(MoneyAPIProviderCallback,{["__call"] = function(t,k,...)
      if MoneyAPIProviderCallback[k] then return MoneyAPIProviderCallback[k](...) end
      error("Invalid Function call")
    end})

function MoneyAPIProviderCallback.BankHasMember()
  --Code here
end


--]]