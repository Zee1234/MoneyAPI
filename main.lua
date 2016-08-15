g_Plugin = nil --I know this does nothing, it's a note.


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
	
  g_Plugin = a_Plugin
  LOG("Initialized MoneyAPI v." .. a_Plugin:GetVersion())
  return true
end

function OnDisable()
  

  
  
  LOG("MoneyAPI is disabled")
end

function LDHVerify()
  return true
end

function LDHSetup()
  if not g_LDH then
    print("Lib",cPluginManager:CallPlugin("LibDependHandler","RegisterLibrary","MoneyAPI"))
    g_LDH = true
  end
end
