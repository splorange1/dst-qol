--QOL
local BELLED_BEEFALO_POOP = GetModConfigData("BELLED_BEEFALO_POOP")
local GUANO_LOOT = GetModConfigData("GUANO_LOOT")

--GAMEPLAY TWEAKS
local WILLOW_FRENZY_BUFF = GetModConfigData("WILLOW_FRENZY_BUFF")

---Upvalue functions----------------------------------------

local function GetUpvalue(func, name)
	local debug = GLOBAL.debug
	local i = 1
	while true do
		local n, v = debug.getupvalue(func, i)
		if not n then
			return nil, nil
		end
		if n == name then
			return v, i
		end
		i = i + 1
	end
end

local function SetUpvalue(func, ind, value)
	local debug = GLOBAL.debug
	debug.setupvalue(func, ind, value)
end

------------------------------------------------------------

-----------------------QOL FEATURES-------------------------

---No Belled Beefalo Poop-----------------------------------

local function HackBeefaloPoop()
	local beefalo_fn = GLOBAL.Prefabs["beefalo"].fn

	local CanSpawnPoop, CanSpawnPoop_index = GetUpvalue(beefalo_fn, "CanSpawnPoop")

    local old_CanSpawnPoop = CanSpawnPoop
    local new_CanSpawnPoop = function(inst)
        if inst.components.hitchable and not inst.components.hitchable.canbehitched then return false end
        if inst.components.follower:GetLeader() ~= nil then return false end
        return inst.components.rideable == nil or not inst.components.rideable:IsBeingRidden()
    end

	SetUpvalue(beefalo_fn, CanSpawnPoop_index, new_CanSpawnPoop)
end

if BELLED_BEEFALO_POOP then
	AddPrefabPostInit("world", HackBeefaloPoop)
end

------------------------------------------------------------

---No Guano Drops-------------------------------------------

local function RemoveGuanoFromBat()
	GLOBAL.SetSharedLootTable("bat",
	{
		{"batwing",    0.25},
		{"monstermeat",0.10},
	})
end

if GUANO_LOOT then
	AddPrefabPostInit("world", RemoveGuanoFromBat)

	AddPrefabPostInit("bat", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			inst.components.periodicspawner:Stop()
			inst:RemoveComponent("periodicspawner")
		end
	end)
end

------------------------------------------------------------

--------------------GAMEPLAY TWEAKS-------------------------

---Willow Burning Frenzy Buff-------------------------------

local function WillowOnHitOther(inst, other)
    if other.components.burnable and inst:HasTag("firefrenzy") then
        other.components.burnable:Ignite(nil, inst)
    end
end

if WILLOW_FRENZY_BUFF then
	AddPrefabPostInit("willow", function(inst)
		inst.components.combat.onhitotherfn = WillowOnHitOther
	end)
end

------------------------------------------------------------