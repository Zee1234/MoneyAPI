local cUser = {}
cUser.__index = cUser

function cUser:new(a_plugin)
  assert(type(a_plugin) == "string","cUser:new() recieved a non-string value for a_name! Value recieved:" .. tostring(a_name))
  local obj = {}
  setmetatable(obj,cUser)
  
  obj.name = a_plugin
  
  if g_Config.UseForcedRelations and g_Config.ForcedUsages[a_plugin] then
    obj.forcedUsage = {}
    if type(g_Config.ForcedUsages[a_plugin]) == table then
      for _,v in ipairs(g_Config.ForcedUsages[a_plugin]) do
        table.insert(obj.forcedUsage,v)
      end
    else
      table.insert(obj.forcedUsage,g_Config.ForcedUsages[a_plugin])
    end
  end
  
  
  return obj
end

function cUser:getForcedList()
  if g_Config.UseForcedRelations then return self.forcedUsage end
  return false
end

function cUser:getName()
  return self.name
end






return cUser