local ZPSI = dofile(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/ZPSI/ZPSI.lua")

g_Config = ZPSI.parse(cPluginManager:GetCurrentPlugin():GetLocalFolder() .. "/config.zpsi").Config

assert(g_Config.UseWorldRestrictions ~= nil,"Config value UseWorldRestrictions not found")
assert(g_Config.UseForcedRelations ~= nil,"Config value UseForcedRelations not found")
