local cProvider = {}
cProvider.__index = cProvider

function cProvider:new(a_plugin,a_bankSupport)
  assert(type(a_name) == "string","cDependent:new() recieved a non-string value for a_name! Value recieved:" .. tostring(a_name))
  local obj = {}
  setmetatable(obj,cProvider)
  
  obj.name = a_plugin
  obj.bank = a_bankSupport
  
  
  return obj
end

function cProvider:getName()
  return self.Name
end

function cProvider:hasBank()
  return self.bank
end






return cProvider
