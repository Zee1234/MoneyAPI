--====================Registration API calls


--- Register a user (store) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function RegisterUser(a_plugin)
  assert(type(a_plugin) == "string","RegisterUser recieved non-string value!")
  if g_Users[a_plugin] then return false, "Plugin name already registered" end
  
  g_Users[a_plugin] = cUser:new(a_plugin)
  return true
end

--- Unregister a user (store) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function UnregisterUser(a_plugin)
  assert(type(a_plugin) == "string","UnregisterUser recieved non-string value!")
  if not g_Users[a_plugin] then return false, "Plugin name already unregistered" end
  
  g_Users[a_plugin] = nil
  return true
end