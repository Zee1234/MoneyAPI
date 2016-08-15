function Initialize(a_Plugin)
  a_Plugin:SetName("MoneyAPI")
  a_Plugin:SetVersion(1.0)
  
  if not cPluginManager:ForEachPlugin(function(a_plugin)
      if a_plugin:GetName() == LibDependHandle then return true end
    end
  )
  then
    LDHSetup()
  else
    cPluginManager:AddHook(cPluginManager.HOOK_PLUGINS_LOADED, LDHSetup)
    cRoot:Get():GetDefaultWorld():ScheduleTask(1,LDHSetup)
  end
  
  
  cRoot:Get():ForEachWorld(function(a_world) local name = a_world:GetName() if not g_Worlds[name] then g_Worlds[name] = cMyWorld:new(name) end end)
  if g_Config.UseWorldRestrictions then
    for _,v in pairs(g_Config.WorldRestrictions) do
      if type(v) == "table" then
        for _,w in ipairs(v) do
          if not g_Worlds[w] then g_Worlds[w] = cMyWorld:new(w) end
        end
      else
        if not g_Worlds[v] then g_Worlds[v] = cMyWorld:new(v) end
      end
    end
  end
  
	
  g_Plugin = a_Plugin
  LOG("Initialized MoneyAPI v." .. a_Plugin:GetVersion())
  return true
end

function OnDisable()
  
  cPluginManager:CallPlugin("LibDependHandler","UnregisterLibrary","MoneyAPI")
  
  
  LOG("MoneyAPI is disabled")
end

function LDHVerify()
  return true
end

function LDHSetup()
  if not g_LDH then
    cPluginManager:CallPlugin("LibDependHandler","RegisterLibrary","MoneyAPI")
    g_LDH = true
  end
end
