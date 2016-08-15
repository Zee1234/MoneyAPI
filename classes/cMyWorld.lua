local cMyWorld = {}
cMyWorld.__index = cMyWorld

function cMyWorld:new(a_world)
  assert(type(a_world) == "string","cMyWorld:new() recieved a non-string value for a_world!")
  if type(a_world) == "string" and not cRoot:Get():GetWorld(a_world) then LOGERROR("Non-Fatal error: Non-Existant world \""..a_world.."\" exists in MoneyAPI Config!") end
  local obj = {}
  setmetatable(obj,cMyWorld)
  

  obj.name = a_world
  
  if g_Config.UseWorldRestrictions then
    obj.providers = {}
    for k,v in pairs(g_Config.WorldRestrictions) do
      if type(v) == "string" then
        if v == obj.name then table.insert(obj.providers,k) end
      else
        for _,w in ipairs(v) do
          if w == obj.name then table.insert(obj.providers,w) end
        end
      end
    end
  end
  
  
  return obj
end

function cMyWorld:getLinkedProviders()
  if g_Config.UseWorldRestrictions then return self.providers end
  return false
end

function cMyWorld:getName()
  return self.name
end





return cMyWorld