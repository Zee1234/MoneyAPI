--====================Registration Control


-- Register a provider (currency) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function RegisterProvider(a_plugin,a_bankSupport)
  assert(type(a_plugin) == "string","RegisterUser recieved non-string value!")
  if g_Providers[a_plugin] then return false, "Plugin name already registered" end
  
  g_Providers[a_plugin] = cProvider:new(a_plugin)
  return true
end


-- Unregister a provider (currency) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function UnregisterProvider(a_plugin)
  assert(type(a_plugin) == "string","UnregisterProvider recieved non-string value!")
  if not g_Providers[a_plugin] then return false, "Plugin name already unregistered" end
  
  g_Providers[a_plugin] = nil
  return true
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