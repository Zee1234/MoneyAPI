g_Providers = {}
g_Users = {}
g_Worlds = {}
g_Plugin = {}


cProvider =  dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/classes/cProvider.lua")
cUser =  dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/classes/cUser.lua")
cMyWorld =  dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/classes/cMyWorld.lua")

dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/API/internals.lua")
dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/API/Provider.lua")
dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/API/User.lua")