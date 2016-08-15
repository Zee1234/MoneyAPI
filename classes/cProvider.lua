cProvider = {}
cProvider.__index = cProvider

function cProvider:new(a_plugin)
  assert(type(a_name) == "string","cDependent:new() recieved a non-string value for a_name! Value recieved:" .. tostring(a_name))
  local obj = {}
  setmetatable(obj,cProvider)
  
  
end







return cProvider
