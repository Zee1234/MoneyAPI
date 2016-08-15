function providerCaller(a_user,a_world,a_function,...)
  local called = {}
  
  if g_Config.UseForcedRelations then
    for _,v in ipairs(g_Users[a_user]:getForcedList()) do
      repeat
        if not g_Providers[v] then LOGERROR("Configured Provider \""..v.."\" is not registered! Please fix MoneyAPI's Config or enable the missing provider!") break end
        if called[v] then break end
        
        called[v] = cPluginManager:CallPlugin(v,"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  if g_Config.UseWorldRestrictions then
    for _,v in ipairs(g_Worlds[a_world]:getLinkedProviders()) do
      repeat
        if not g_Providers[v] then LOGERROR("Configured Provider \""..v.."\" is not registered! Please fix MoneyAPI's Config or enable the missing provider!") break end
        if called[v] then break end
        
        called[v] = cPluginManager:CallPlugin(v,"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  if not g_Config.UseForcedRelations and not g_Config.UseWorldRestrictions then
    for _,v in pairs(g_Providers) do
      repeat
        if called[v:getName()] then break end
        
        called[v:getName()] = cPluginManager:CallPlugin(v:getName(),"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  return called, returned
end


function bankProviderCaller(a_user,a_world,a_function,...)
  local called = {}
  
  if g_Config.UseForcedRelations then
    for _,v in ipairs(g_Users[a_user]:getForcedList()) do
      repeat
        if not g_Providers[v] then LOGERROR("Configured Provider \""..v.."\" is not registered! Please fix MoneyAPI's Config or enable the missing provider!") break end
        if called[v] then break end
        if not g_Providers[v]:hasBank() then break end
        
        called[v] = cPluginManager:CallPlugin(v,"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  if g_Config.UseWorldRestrictions then
    for _,v in ipairs(g_Worlds[a_world]:getLinkedProviders()) do
      repeat
        if not g_Providers[v] then LOGERROR("Configured Provider \""..v.."\" is not registered! Please fix MoneyAPI's Config or enable the missing provider!") break end
        if called[v] then break end
        if not g_Providers[v]:hasBank() then break end
        
        called[v] = cPluginManager:CallPlugin(v,"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  if not g_Config.UseForcedRelations and not g_Config.UseWorldRestrictions then
    for _,v in pairs(g_Providers) do
      repeat
        if called[v] then break end
        if not g_Providers[v]:hasBank() then break end
        
        called[v] = cPluginManager:CallPlugin(v,"MoneyAPIProviderCallback",a_function,...)
      until true
    end
  end
  
  return called
end
