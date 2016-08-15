--====================Registration Control
function RegisterUser(a_plugin)
  assert(type(a_plugin) == "string","RegisterUser recieved non-string value!")
  if g_Users[a_plugin] then return false, "Plugin name already registered" end
  
  g_Users[a_plugin] = cUser:new(a_plugin)
  return true
end

function UnregisterUser(a_plugin)
  assert(type(a_plugin) == "string","UnregisterUser recieved non-string value!")
  if not g_Users[a_plugin] then return false, "Plugin name already unregistered" end
  
  g_Users[a_plugin] = nil
  return true
end






--====================General API Calls

function CurrencyName(a_plugin,a_world)
  providerCaller(a_plugin,a_world,CurrencyName)
end

function CurrencyPlural(a_plugin,a_world)
  
end

function Format(a_plugin,a_world,a_value)
  
end

function GetPlayers(a_plugin,a_world)

end

function GetBanks(a_plugin,a_world)
  
end

function GetName(a_plugin,a_world)
  
end

function HasBankSupport(a_plugin,a_world)
  
end

function HasFractionalDigits(a_plugin,a_world)
  
end

function IsEnabled(a_plugin,a_world)
  
end



--====================Player API Calls

function PlayerBalance(a_plugin,a_player,a_world)
  
end

function PlayerDeposit(a_plugin,a_player,a_world,a_value)
  
end

function PlayerWithdraw(a_plugin,a_player,a_world,a_value)
  
end



--====================Bank API Calls

function BankBalance(a_plugin,a_bank,a_player,a_world)
  
end

function BankDeposit(a_plugin,a_bank,a_player,a_world,a_value)
  
end

function BankHasMember(a_plugin,a_bank,a_player,a_world,a_value)
  
end

function BankMembers(a_plugin,a_bank,a_world)
  
end

function BankOwner(a_plugin,a_bank,a_world)
  
end

function BanksWithMember(a_plugin,a_player,a_world)
  
end

function BankWithdraw(a_plugin,a_bank,a_player,a_world,a_value)
  
end

function BanksWithPlayer(a_plugin,a_player,a_world)
  
end


