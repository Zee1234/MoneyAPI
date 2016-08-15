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
  providerCaller(a_plugin,a_world,"CurrencyName")
end

function CurrencyPlural(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"CurrencyPlural")
end

function Format(a_plugin,a_world,a_value)
  providerCaller(a_plugin,a_world,"Format",a_value)
end

function GetPlayers(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"GetPlayers")
end

function GetBanks(a_plugin,a_world)
  bankProviderCaller(a_plugin,a_world,"GetBanks")
end

function GetName(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"GetName")
end

function HasBankSupport(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"HasBankSupport")
end

function HasFractionalDigits(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"HasFractionalDigits")
end

function IsEnabled(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"IsEnabled")
end



--====================Player API Calls

function PlayerBalance(a_plugin,a_world,a_player)
  providerCaller(a_plugin,a_world,"PlayerBalance",a_player)
end

function PlayerDeposit(a_plugin,a_world,a_player,a_value)
  providerCaller(a_plugin,a_world,"PlayerDeposit",a_player,a_value)
end

function PlayerWithdraw(a_plugin,a_world,a_player,a_value)
  providerCaller(a_plugin,a_world,"PlayerWithdraw",a_player,a_value)
end



--====================Bank API Calls

function BankBalance(a_plugin,a_world,a_bank,a_player)
  bankProviderCaller(a_plugin,a_world,"BankBalance",a_bank,a_player)
end

function BankDeposit(a_plugin,a_world,a_bank,a_player,a_value)
  bankProviderCaller(a_plugin,a_world,"BankDeposit",a_bank,a_player,a_value)
end

function BankHasMember(a_plugin,a_world,a_bank,a_player,a_value)
  bankProviderCaller(a_plugin,a_world,"BankHasMember",a_bank,a_player,a_value)
end

function BankMembers(a_plugin,a_world,a_bank)
  bankProviderCaller(a_plugin,a_world,"BankMembers",a_bank)
end

function BankOwner(a_plugin,a_world,a_bank)
  bankProviderCaller(a_plugin,a_world,"BankOwner",a_bank)
end

function BanksWithMember(a_plugin,a_world,a_player)
  bankProviderCaller(a_plugin,a_world,"BanksWithMember",a_player)
end

function BankWithdraw(a_plugin,a_world,a_bank,a_player,a_value)
  bankProviderCaller(a_plugin,a_world,"BankWithdraw",a_bank,a_player,a_value)
end


