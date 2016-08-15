--====================Registration API calls


--- Register a user (store) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function RegisterUser(a_plugin)
  assert(type(a_plugin) == "string","RegisterUser recieved non-string value!")
  if g_Users[a_plugin] then return false, "Plugin name already registered" end
  
  g_Users[a_plugin] = cUser:new(a_plugin)
  return true
end

--- Unregister a user (store) plugin.
--@param a_plugin plugin name (string)
--@return true if successful, false and an error string otherwise
function UnregisterUser(a_plugin)
  assert(type(a_plugin) == "string","UnregisterUser recieved non-string value!")
  if not g_Users[a_plugin] then return false, "Plugin name already unregistered" end
  
  g_Users[a_plugin] = nil
  return true
end






--====================General API Calls


--- Request name of currency from provider plugin(s).
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = name (string)
function CurrencyName(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"CurrencyName")
end

--- Request plural name of currency from provider plugin(s).
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = name (string)
function CurrencyPlural(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"CurrencyPlural")
end

--- Convert number into formatted currency string.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_value number
--@return table of return values [provider_plugin] = formatted_number (string)
function Format(a_plugin,a_world,a_value)
  providerCaller(a_plugin,a_world,"Format",a_value)
end

--- Get Array of all registered players.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = Array of UUID (string)
function GetPlayers(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"GetPlayers")
end

--- Get Array of all registered banks.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = Array of name (string)
function GetBanks(a_plugin,a_world)
  bankProviderCaller(a_plugin,a_world,"GetBanks")
end

--- Get provider plugin name.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = provider_plugin (string)
function GetName(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"GetName")
end

--- Check if provider plugin has bank support.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = bool
function HasBankSupport(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"HasBankSupport")
end

--- Check if provider plugin(s) use decimal places in currency.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = bool
function HasFractionalDigits(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"HasFractionalDigits")
end

--- Are any provider plugins available.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@return table of return values [provider_plugin] = bool
function IsEnabled(a_plugin,a_world)
  providerCaller(a_plugin,a_world,"IsEnabled")
end



--====================Player API Calls

--- Get player balance.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_player player UUID (string, cPlayer:GetUUID())
--@return table of return values [provider_plugin] = balance (number)
function PlayerBalance(a_plugin,a_world,a_player)
  providerCaller(a_plugin,a_world,"PlayerBalance",a_player)
end

--- Add currency to player account.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_player player UUID (string, cPlayer:GetUUID())
--@param a_value amount (number)
--@return table of return values [provider_plugin] = bool (successful/not successful)
function PlayerDeposit(a_plugin,a_world,a_player,a_value)
  providerCaller(a_plugin,a_world,"PlayerDeposit",a_player,a_value)
end

--- Remove currency from player account.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_player player UUID (string, cPlayer:GetUUID())
--@param a_value amount (number)
--@return table of return values [provider_plugin] = bool (successful/not successful)
function PlayerWithdraw(a_plugin,a_world,a_player,a_value)
  providerCaller(a_plugin,a_world,"PlayerWithdraw",a_player,a_value)
end



--====================Bank API Calls

--- Get bank balance of player (or bank total balance if no invidividual accounts).
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@param a_player player UUID (string, cPlayer:GetUUID()) -- Implementation specific
--@return table of return values [provider_plugin] = balance (number)
function BankBalance(a_plugin,a_world,a_bank,a_player)
  bankProviderCaller(a_plugin,a_world,"BankBalance",a_bank,a_player)
end

--- Add currency to bank balance of player (or bank total balance if no invidividual accounts).
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@param a_player amount (number)
--@param a_value player UUID (string, cPlayer:GetUUID()) -- Implementation specific
--@return table of return values [provider_plugin] = bool (successful/not successful)
function BankDeposit(a_plugin,a_world,a_bank,a_player,a_value)
  bankProviderCaller(a_plugin,a_world,"BankDeposit",a_bank,a_value,a_player)
end

--- Check if named bank has identified player.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@param a_player player UUID (string, cPlayer:GetUUID()) -- Implementation specific
--@return table of return values [provider_plugin] = bool
function BankHasMember(a_plugin,a_world,a_bank,a_player)
  bankProviderCaller(a_plugin,a_world,"BankHasMember",a_bank,a_value,a_player)
end

--- Get array of members of named bank.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@return table of return values [provider_plugin] = Array of UUID (string)
function BankMembers(a_plugin,a_world,a_bank)
  bankProviderCaller(a_plugin,a_world,"BankMembers",a_bank)
end

--- Get Owner/Creator of named bank.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@return table of return values [provider_plugin] = UUID (string)
function BankOwner(a_plugin,a_world,a_bank)
  bankProviderCaller(a_plugin,a_world,"BankOwner",a_bank)
end

--- Get array of banks of which identified player is a member.
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_player player UUID (string, cPlayer:GetUUID()) -- Implementation specific
--@return table of return values [provider_plugin] = Array of bank name (string)
function BanksWithMember(a_plugin,a_world,a_player)
  bankProviderCaller(a_plugin,a_world,"BanksWithMember",a_player)
end

--- Withdraw from bank balance of player (or bank total balance if no invidividual accounts).
--@param a_plugin plugin name (string)
--@param a_world world name (string, cWorld:GetName())
--@param a_bank bank name (string)
--@param a_player amount (number)
--@param a_value player UUID (string, cPlayer:GetUUID()) -- Implementation specific
--@return table of return values [provider_plugin] = bool (successful/not successful)
function BankWithdraw(a_plugin,a_world,a_bank,a_player,a_value)
  bankProviderCaller(a_plugin,a_world,"BankWithdraw",a_bank,a_value,a_player)
end


