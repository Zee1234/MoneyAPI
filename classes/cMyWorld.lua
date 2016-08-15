cMyWorld = {}
cMyWorld.__index = cMyWorld

function cMyWorld:new(a_world)
  assert(type(a_world) == "table" or type(a_world) == "string","cMyWorld:new() recieved a non-string, non-table value for a_world!")
  local obj = {}
  setmetatable(obj,cMyWorld)
  
  if type(a_world) == table then
    obj.name = a_world:GetName()
  else
    obj.name = a_world
  end
  
  if g_Config.UseWorldRestrictions then
    obj.providers = {}
    for k,v in pairs(g_Config.WorldRestrictions) do
      if type(v) == "string" and v == obj.name then
        table.insert(obj.providers,k)
      else
        for _,w in ipairs(g_Config.WorldRestrictions[v]) do
          if w == obj.name then table.insert(obj.providers,k) end
        end
      end
    end
  end
  
  
  return obj
end







return cMyWorld