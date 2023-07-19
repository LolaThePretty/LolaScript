-- LolaScript
-- by LolaTheSquishy

local SCRIPT_VERSION = "1.1.4"

-- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
            function(result, headers, status_code)
                local function parse_auto_update_result(result, headers, status_code)
                    local error_prefix = "Error downloading auto-updater: "
                    if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                    if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                    filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                    local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                    if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                    file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
                end
                auto_update_complete = parse_auto_update_result(result, headers, status_code)
            end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

--- Auto Updater Config
local auto_update_config = {
    source_url="https://raw.githubusercontent.com/LolaThePretty/LolaScript/main/LolaScript.lua",
    script_relpath=SCRIPT_RELPATH,
    verify_file_begins_with="--",
}
auto_updater.run_auto_update(auto_update_config)

--local scripts_dir = filesystem.scripts_dir()
--local requirements = {
--    folder_paths = {
--        $"{scripts_dir}/lib/LolaScript",
--    },

--    all_file_paths = {
--        $"{scripts_dir}/lib/LolaScript/LolaSpawner.lua",
--    },

--    modules = {
--        "LolaScript/Modules/Misc"
--    },
--    modules_names = {
--        "'Misc module'"
--    },

--}

--for i, folder_path in requirements.folder_paths do
--    if not filesystem.exists(folder_path) then
--        filesystem.mkdir(folder_path)
--    end
--end

--for i, file_path in requirements.file_paths do
--    if not filesystem.exists(file_path) then
--        local file = io.open(file_path, "w")
--        file:close()
--    end
--end



------------------------------------------------------------------------------------------------

--[[ Next mission : The big dive
-Spy mission
-steal a toreador from a flatbed truck
-Intercept a Cargoplane taking off and get inside
-kill enemies within the hold and burn the cargo that was supposed to be dropped in the sea
-hijack the plane to get kosatka location
-jump from the cargo hold with the toreador and land in the sea
-drive to a kosatka 
-Cayo Perico for sea Approach
-US luxington for sky Approach --]] 

--ADD WAYS TO FAIL THE MISSION
--POPULATE THE LUXINGTON'S CABIN WITH SOLDIERS
--FASTEN UP PROPS SPAWNS
--KILL CHOPPERS ENGINE SO U CANT APPROACH THE USS LUXINGTON FROM THE SKY
--RE PLACE THE TIPS FOR PHASE 3
--PREVENT SUB AND BOATS TO SHOOT YOU IF YOU ARE ABOVE WATER AKA ON THE LUXINGTON

------------------------------------------------------------------------------------------------

--stick to walls/roof
--horn boost
--Make a sort of Mario Kart balloon battle minigame
--Making mount for every big enough animal
--adding player peds as pet
--Police RP,missions to do, in solo minigame section
--make a flappy bird feature with sideway cam
--make a blender with windmills on the player
--do a guess which car is the correct and if u wrong it spawn a kamikaze or a blender
--unload cargoplane when far of it in epic plane jump
--make squadron lfy ur own plane with random planes following
--Jet Squadron
--Bigger Hamsterball, Thunderball for rocket voltics
--Spawn stunt bumpers under vehicles to slow them down without bonking
--Spawn a Loop in front of the players
--Spawns a Hamsterball for the player--
--Spy RP, infiltrating a subarine after stealing a submarine/sub car
---------------
-----IDEAS-----
---------------
--Make a deathrun parkour

--sharks spawed around a boat

--Translate script

--spawn invisble dogs around someone to sound spam them

--PvP enhancer

--auto give guns and u select which ones are auto given with a toggle loop for each

--giant baguette whatever this suggestion means Lol

--A better version of stand’s feature “Rewind”, pestered Sainan when they were around to implement this but it doesn’t sync well for other players, basically rewinds your position up to five seconds (looks smooth locally but laggy for other players)





--spawns a lot of cars with different horn that follow players location above their head to spam honk them

--Bullet Storm see DM with Devil






util.keep_running()


--[[If you want to do anything with the game pretty much you will need to require game natives with util.require_natives()
check the latest version before starting]]
--util.require_natives(1676318796)
util.require_natives("1681379138.g")

--[[First you will want to start with something easy to put something in the main part of your script you need
menu.my_root() to shorten it you could go with local my_root = menu.my_root(). menu.my_root() is known as the command
reference here]]
local my_root = menu.my_root()


--[[Version 0.2.0 stuff added]]
--[[Here we have a shorthand shadow_root which is a command that needs attached to be seen in the menu otherwise it will be
invisible you can use menu.attach() or in this case I use the shorthand :attach() or attach them directly.]]
local shadow = menu.shadow_root()

local ourPlayer = GET_PLAYER_PED(players.user())

--local self_ref = menu.ref_by_path('Stand>Lua Scripts>LolaScript') -- here we are refrencing the Self menu
--local test_ref = menu.action(shadow, 'Test Button in Self menu', {''}, 'Button that toast Hello', function ()
--    util.toast('Hello')
--end)


--self_ref:attach(test_ref)

function Streammodel(hash, msecs)
    util.request_model(hash, msecs)
end

--  local myListSelf = menu.list(menu.my_root(), "Self", {}, "Self Options")

local myListVehicle = menu.list(menu.my_root(), "Vehicle", {}, "Vehicle Options")
local myListWeapon = menu.list(menu.my_root(), "Weapon", {}, "Weapon Options")

--menu.action(menu.my_root(), "Temp Test", {}, "Test button to do stuff, if I forgot to remove it in a release please lemme know", function()



--end)


--  menu.action(myListSelf, "Test Feature", {}, "Tests the current developped feature", function()





--	end)
local EveryAnimalHashList = {"Rats", "A_C_Rabbit_01", "A_C_Rabbit_02", "A_C_Cat_01", "A_C_Poodle", "A_C_Westy", "A_C_Pug", "A_C_Pug_02", "A_C_Rottweiler", "A_C_Retriever", "A_C_shepherd", "A_C_Husky", "A_C_Coyote", "A_C_Coyote_02", "A_C_MtLion", "A_C_MtLion_02", "A_C_Panther", "A_C_Rhesus", "A_C_Chimp_02", "A_C_Pig", "A_C_Boar", "A_C_Boar_02", "A_C_Cow", "A_C_Deer", "A_C_Deer_02", "A_C_Fish", "A_C_Stingray", "A_C_Dolphin", "A_C_SharkHammer", "A_C_SharkTiger", "A_C_KillerWhale", "A_C_HumpBack", "A_C_Pigeon", "A_C_Crow", "A_C_Hen", "A_C_Seagull", "A_C_Chickenhawk", "A_C_Cormorant"}


local function spawn_animal(pid, AnimalHash)


    util.request_model(AnimalHash)
    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)

    local radius = math.random(50, 300)
    local radius2 = math.random(50, 300)

    local SavedPlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)

    local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius2, radius2), math.random(-radius, radius), 5)

    for i = 20, 1, -1 do
        AnimalHash = util.joaat(EveryAnimalHashList[math.random(1, #EveryAnimalHashList)])
        radius = math.random(50, 300)
        radius2 = math.random(50, 300)

        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius2, radius2), math.random(-radius, radius), 5)

        local PopAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, 0)
        SET_ENTITY_INVINCIBLE(PopAnimal, true)


        -- util.yield(10)
        -- SET_ENTITY_COORDS(pedm, SpawnOffset.x, SpawnOffset.y, SpawnOffset.z)
        -- util.yield(1000)
        -- SET_ENTITY_COORDS(pedm, SavedPlayerPos.x, SavedPlayerPos.y, SavedPlayerPos.z)
        -- util.toast("boop")
        util.create_tick_handler(function()
            if HAS_ENTITY_COLLIDED_WITH_ANYTHING(PopAnimal) then
                SET_ENTITY_INVINCIBLE(PopAnimal, false)
                return false
            end

        end)
    end
    --util.toast("blep")


end

local function spawn_animals_all(AnimalHash)
    for k,p in pairs(players.list(true, true, true)) do
        spawn_animal(p, AnimalHash)
    end
end








local myListVehicleSpawner = menu.list(myListVehicle, "Vehicle Spawner", {}, "Vehicle Spawner Options")
local myListVehicleSettings = menu.list(myListVehicle, "Vehicle Settings", {}, "Vehicle Settings")
local myListFunSettings = menu.list(menu.my_root(), "Fun", {}, "Fun Options")
local myListMiscSettings = menu.list(menu.my_root(), "Misc", {}, "Miscellaneous Options")


menu.toggle_loop(myListMiscSettings, "Display Location", {}, "Displays Global Location", function(on)

    local RealOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

    util.draw_debug_text("pos x : " .. RealOffset.x)
    util.draw_debug_text("pos y : " .. RealOffset.y)
    util.draw_debug_text("pos z : " .. RealOffset.z)

end, function()



end)

menu.action(myListMiscSettings, "Clear World", {"clearworld"}, "Deletes any entity in the world.", function(on_click) --Generously brought to me by Miracle
    local count = 0
    for i, entity in pairs(entities.get_all_vehicles_as_handles()) do
        entities.delete_by_handle(entity)
        count = count + 1
    end
    for i, entity in pairs(entities.get_all_peds_as_handles()) do
        if not IS_PED_A_PLAYER(entity) then
            entities.delete_by_handle(entity)
        end
        count = count + 1
    end
    for i, entity in pairs(entities.get_all_objects_as_handles()) do
        entities.delete_by_handle(entity)
        count = count + 1
    end
    util.toast("Clear World executed succesfully, " .. count .. " entities removed. :)")
end)





local myListFunAnimalsSettings = menu.list(myListFunSettings, "Animals", {}, "Animals Options")
menu.divider(myListFunSettings, "------")
local myListFunAnimalsWildSettings = menu.list(myListFunAnimalsSettings, "Wild", {}, "Wild Animals Options")
local myListFunAnimalsPetSettings = menu.list(myListFunAnimalsSettings, "Pet", {}, "Pet Animals Options")
local myListFunAnimalsMountsSettings = menu.list(myListFunAnimalsSettings, "Mounts", {}, "Animals Mounts Options")
--[[menu.action(myListFunAnimalsSettings, "Populate world !", {}, "Will spawn a lot of random animals here and there around the every player", function ()

    spawn_animals_all(util.joaat(EveryAnimalHashList[math.random(1, #EveryAnimalHashList)]))

end)--]]

    --[[local tigers = {}

    menu.action(myListFunSettings, "Hopeless Boat", {}, "Spawns a boat in infested shark waters", function(on)

       local hashTiger = util.joaat("A_C_SharkTiger")
       local hashHammer = util.joaat("A_C_SharkHammer")
       local hashBoat = util.joaat("marquis")
       util.request_model(hashTiger)
       util.request_model(hashHammer)
       util.request_model(hashBoat)
       local pedm = players.user_ped()
       local radius = 15

       local BoatSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0) --math.random(-radius, radius)
       local Boat = entities.create_vehicle(hashBoat, BoatSpawnLoc, 0)
       SET_PED_INTO_VEHICLE(pedm, Boat, -1)

       for i = 6, 0, -1 do
       local randomSharkLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), -5)

       tigers = entities.create_ped(0, hashTiger, randomSharkLoc, 0)
       end

       for i = 6, 0, -1 do
           local randomSharkLoc2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), -5)
           entities.create_ped(0, hashHammer, randomSharkLoc2, 0)
       end

       util.create_tick_handler(function()

           local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
           SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(tigers, true)
           TASK_GO_TO_COORD_ANY_MEANS(tigers, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
           local TigerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(tigers, 0, 0, 0)
           APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(tigers, 1, 0, 1, 0, true, true, true, true)
           set_entity_face_entity(tigers, pedm, false)

           if IS_ENTITY_DEAD(tigers) then
               entities.delete(tigers)
               --util.toast("RIP :'(")
               return false
           end
       end)

   end)--]]

local function set_entity_face_entity(entity, target, usePitch)
    local pos1 = GET_ENTITY_COORDS(entity, false)
    local pos2 = GET_ENTITY_COORDS(target, false)
    local rel = v3.new(pos2)
    rel:sub(pos1)
    local rot = rel:toRot()
    if not usePitch then
        SET_ENTITY_HEADING(entity, rot.z)
    else
        SET_ENTITY_ROTATION(entity, rot.x, rot.y, rot.z, 2, 0)
    end
end

   local myListFunMinigamesSettings = menu.list(myListFunSettings, "Minigames", {}, "Play minigames !")
   local myListFunMissionsSettings = menu.list(myListFunMinigamesSettings, "Missions", {}, "Play missions ! IMPORTANT : It is very advised to stop and start the script each time you want to redo a mission !! Also do not play it a very populated lobby or some missions entities will dissapear due to most likely entity cap, thus softlocking the mission. Best is to play it in solo mode")
   --local myListFunTronSettings = menu.list(myListFunMinigamesSettings, "Tron", {}, "Play Tron !")
   local myListFunSumoSettings = menu.list(myListFunMinigamesSettings, "Sumo !", {}, "Play Sumo !")
   local myListFunBowlingSettings = menu.list(myListFunMinigamesSettings, "Bowling !", {}, "Play Bowling !")
   local myListFunWreckItSettings = menu.list(myListFunMinigamesSettings, "Wreck It !", {}, "Play Wreck It !")
   local myListFunWreckItM1Settings = menu.list(myListFunWreckItSettings, "The Big Bowl !", {}, "Play in The Big Bowl !")
   local myListFunWreckItM2Settings = menu.list(myListFunWreckItSettings, "The Wave !", {}, "Play in The Wave !")




--[[local wreckItEnabled = 0
local wreckItStarted = 0
local wreckItFloorElements = {}
local wreckItPowerUps = {}
local wreckItBaloons = {}
local wreckItCars = {}




local function spawnPowerUps(location)



                local PUsNames = {"prop_mp_rocket_01", "prop_mp_spike_01", "prop_mp_boost_01", "prop_mk_arrow_3d"}
                
            
                local wreckItPowerUpsHash = util.joaat("xm_prop_moderncrate_xplv_01") -- ba_prop_battle_crate_closed_bc
                local SpawnLoc = v3.new(0, 0, 0)
            
                util.request_model(wreckItPowerUpsHash)
                local wreckItPU = entities.create_object(wreckItPowerUpsHash, location, 0)
                table.insert(wreckItPowerUps, 1, wreckItPU)
                --local randomLoc = wreckItPowerUpsLocations[math.random(1, #wreckItPowerUpsLocations)]
                --while wreckItPU:distance() do
                --    SET_ENTITY_COORDS_NO_OFFSET(wreckItPU, randomLoc.x, randomLoc.y, randomLoc.z)
                --end

                

                SET_ENTITY_ROTATION(wreckItPU, 0, 0, 0, 2, true)
                PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItPU)
                FREEZE_ENTITY_POSITION(wreckItPU, true)
                SET_ENTITY_COLLISION(wreckItPU, false, false)
                SET_ENTITY_AS_MISSION_ENTITY(wreckItPU, true, true)

    util.create_tick_handler(function()
        
        local rot = GET_ENTITY_ROTATION(wreckItPU, 2)
        SET_ENTITY_ROTATION(wreckItPU, 0, 0, rot.z+1, 2, true)
            

        if wreckItStarted == 0 then
            if DOES_ENTITY_EXIST(wreckItPU) then
                entities.delete(wreckItPU)
            end
            return false
        end
    end)

    util.create_tick_handler(function()



        if wreckItStarted == 0 then
            return false
        end
    end)
end



function spawnWreckItCars(location, rotation)
    
    local BaloonsLocations = {
        v3.new(0, 0, 2),
        v3.new(0, 0, 2.5),
        v3.new(0, 0, 3)
    }

    local BaloonSpawnLoc = v3.new(0, 0, 0)


    local wreckItBaloonHash = util.joaat("prop_mk_arrow_3d")
    local wreckItCarHash = util.joaat("dukes2")
    --local wreckItHaloHash = util.joaat("prop_mp_halo_rotate_lrg")
    local wreckItRocketPUHash = util.joaat("prop_mp_rocket_01")
    local wreckItRailgunPUHash = util.joaat("prop_mp_spike_01")
    local wreckItBoostPUHash = util.joaat("prop_mp_boost_01")
    local wreckItJumpPUHash = util.joaat("prop_mk_arrow_3d")

    local Player
    local pname
    

    util.request_model(wreckItCarHash)
    local wreckItCar = entities.create_vehicle(wreckItCarHash, location, 0)
    table.insert(wreckItCars, 1, wreckItCar)
    SET_ENTITY_ROTATION(wreckItCar, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItCar)
    FREEZE_ENTITY_POSITION(wreckItCar, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItCar, true, true)

    --[[util.request_model(wreckItHaloHash)
    local wreckItHalo = entities.create_object(wreckItHaloHash, location, 0)
    table.insert(wreckItBaloons, 1, wreckItHalo)
    SET_ENTITY_ROTATION(wreckItHalo, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItHalo)
    FREEZE_ENTITY_POSITION(wreckItHalo, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItHalo, true, true)
    ATTACH_ENTITY_TO_ENTITY(wreckItHalo, wreckItCar, 0, 0, 0, -0.25, 0, 0, 0, true, false, false, true, 0, true, 0)
    SET_ENTITY_COLLISION(wreckItHalo, false, false)]]

    --[[local PUiconeHeight = 2

    util.request_model(wreckItRocketPUHash)
    local wreckItRocketPU = entities.create_object(wreckItRocketPUHash, location, 0)
    table.insert(wreckItBaloons, 1, wreckItRocketPU)
    SET_ENTITY_ROTATION(wreckItRocketPU, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItRocketPU)
    FREEZE_ENTITY_POSITION(wreckItRocketPU, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItRocketPU, true, true)
    SET_ENTITY_COLLISION(wreckItRocketPU, false, false)

    util.request_model(wreckItRailgunPUHash)
    local wreckItRailgunPU = entities.create_object(wreckItRailgunPUHash, location, 0)
    table.insert(wreckItBaloons, 1, wreckItRailgunPU)
    SET_ENTITY_ROTATION(wreckItRailgunPU, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItRailgunPU)
    FREEZE_ENTITY_POSITION(wreckItRailgunPU, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItRailgunPU, true, true)
    SET_ENTITY_COLLISION(wreckItRailgunPU, false, false)

    util.request_model(wreckItBoostPUHash)
    local wreckItBoostPU = entities.create_object(wreckItBoostPUHash, location, 0)
    table.insert(wreckItBaloons, 1, wreckItBoostPU)
    SET_ENTITY_ROTATION(wreckItBoostPU, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItBoostPU)
    FREEZE_ENTITY_POSITION(wreckItBoostPU, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItBoostPU, true, true)
    SET_ENTITY_COLLISION(wreckItBoostPU, false, false)

    util.request_model(wreckItJumpPUHash)
    local wreckItJumpPU = entities.create_object(wreckItJumpPUHash, location, 0)
    table.insert(wreckItBaloons, 1, wreckItJumpPU)
    SET_ENTITY_ROTATION(wreckItJumpPU, 0, 0, rotation.z, 2, true)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(wreckItJumpPU)
    FREEZE_ENTITY_POSITION(wreckItJumpPU, true)
    --entities.set_can_migrate(wreckItCar, false)
    SET_ENTITY_AS_MISSION_ENTITY(wreckItJumpPU, true, true)
    SET_ENTITY_COLLISION(wreckItJumpPU, false, false)


    ATTACH_ENTITY_TO_ENTITY(wreckItJumpPU, wreckItCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
    ATTACH_ENTITY_TO_ENTITY(wreckItBoostPU, wreckItCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
    ATTACH_ENTITY_TO_ENTITY(wreckItRailgunPU, wreckItCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
    ATTACH_ENTITY_TO_ENTITY(wreckItRocketPU, wreckItCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
    
    
    
    --SET_VEHICLE_BODY_HEALTH(wreckItCar, 1000)
    --for i = 1, 3, 1 do

      --  util.request_model(wreckItBaloonHash)
      --  local wreckItBaloon = entities.create_object(wreckItBaloonHash, BaloonSpawnLoc, 0)
      --  table.insert(wreckItBaloons, 1, wreckItBaloon)
     --   SET_ENTITY_ROTATION(wreckItBaloon, 0, 0, 0, 2, true)
     --   FREEZE_ENTITY_POSITION(wreckItBaloon, true)
     --   ATTACH_ENTITY_TO_ENTITY(wreckItBaloon, wreckItCar, 0, 0, 0, BaloonsLocations[1].z, 180, 0, 0, true, false, false, true, 0, true, 0)
        --entities.set_can_migrate(wreckItBaloon, false)
      --  SET_ENTITY_AS_MISSION_ENTITY(wreckItBaloon, true, true)

    --end

    local CurrentPowerUp = 0 -- Change Number For Power Up Testing, 0 Default, no power up -- 1 = 2138347493 -- 2 = 3800181289


    util.create_tick_handler(function()

        --[[if CurrentPowerUp ~= 0 then
            SET_ENTITY_VISIBLE(wreckItHalo, true, true)
        else
            SET_ENTITY_VISIBLE(wreckItHalo, false, false)
        end]]

        --local SphereCenter = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 0, 0)
        --DRAW_MARKER_SPHERE(SphereCenter.x, SphereCenter.y, SphereCenter.z, 5, 100, 50, 100, 255)

        --[[if CurrentPowerUp == 1 then
            SET_ENTITY_VISIBLE(wreckItRocketPU, true, true)
        else
            SET_ENTITY_VISIBLE(wreckItRocketPU, false, false)
        end

        if CurrentPowerUp == 2 then
            SET_ENTITY_VISIBLE(wreckItRailgunPU, true, true)
        else
            SET_ENTITY_VISIBLE(wreckItRailgunPU, false, false)
        end

        if CurrentPowerUp == 3 then
            SET_ENTITY_VISIBLE(wreckItBoostPU, true, true)
        else
            SET_ENTITY_VISIBLE(wreckItBoostPU, false, false)
        end

        if CurrentPowerUp == 4 then
            SET_ENTITY_VISIBLE(wreckItJumpPU, true, true)
        else
            SET_ENTITY_VISIBLE(wreckItJumpPU, false, false)
        end

        for k,p in pairs(players.list(true, true, true)) do
            local Pedm = GET_PLAYER_PED(p)
            if IS_PED_IN_VEHICLE(Pedm, wreckItCar, false) then
                Player = GET_PLAYER_PED_SCRIPT_INDEX(p)
                pname = GET_PLAYER_NAME(p)
                local carVelocityRaw = GET_ENTITY_VELOCITY(wreckItCar)
                local carVelocityY = math.abs(carVelocityRaw.y)
                local carVelocityX = math.abs(carVelocityRaw.x)
                local SpeedDistanceMultiplier = 0.2
                local PayerLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 0, 0) 


            
                for i, PU in wreckItPowerUps do
                    local PUlocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItPowerUps[i], 0, 0, 0) 
                    local loc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PU, 0, 0, 0)
                    if PayerLocation:distance(PUlocation) < 2.5 then
                        
                        if IS_ENTITY_VISIBLE(PU) then
                            SET_ENTITY_VISIBLE(PU, false, false)
                            CurrentPowerUp = math.random(1, 4)
                            util.yield(2000)
                            SET_ENTITY_VISIBLE(PU, true, true)
                        end
                        
                    if CurrentPowerUp ~= 0 then
                        util.yield(1000)
                    end
                        
                    end
                    

                end

                --util.toast(GET_VEHICLE_BODY_HEALTH(wreckItCar))

                if GET_VEHICLE_BODY_HEALTH(wreckItCar) < 10 then
                    
                    APPLY_DAMAGE_TO_PED(p, 100000, true, 0)
                elseif GET_VEHICLE_BODY_HEALTH(wreckItCar) < 300 and GET_VEHICLE_BODY_HEALTH(wreckItCar) > 9 then
                    SET_VEHICLE_COLOURS(wreckItCar, 30, 30)
                elseif GET_VEHICLE_BODY_HEALTH(wreckItCar) < 600 and GET_VEHICLE_BODY_HEALTH(wreckItCar) > 299  then
                    SET_VEHICLE_COLOURS(wreckItCar, 42, 42)
                elseif GET_VEHICLE_BODY_HEALTH(wreckItCar) > 599 then
                    SET_VEHICLE_COLOURS(wreckItCar, 55, 55)
                    
                end

                

            if CurrentPowerUp == 1 then
                
                local WeaponPlacementOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 3 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX, 0.5)
                local WeaponAimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 3000, 0)
                local MissleSpeed = 500 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX
                local MissleDamage = 15
                --util.draw_centred_text(carVelocityY)
                --util.draw_centred_text(carVelocityX)
                if IS_PLAYER_PRESSING_HORN(p) then
                    
                    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(WeaponPlacementOffset.x, WeaponPlacementOffset.y, WeaponPlacementOffset.z, WeaponAimOffset.x, WeaponAimOffset.y, WeaponAimOffset.z, MissleDamage, true, 3169388763, p, true, false, MissleSpeed, wreckItCar, true)
                    CurrentPowerUp = 0
                end
            end


            if CurrentPowerUp == 2 then
                
                local WeaponPlacementOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 3 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX, 0.25)
                local WeaponAimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(wreckItCar, 0, 3000, 0)
                local MissleSpeed = 500 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX
                local MissleDamage = 15
                --util.draw_centred_text(carVelocityY)
                --util.draw_centred_text(carVelocityX)
                if IS_PLAYER_PRESSING_HORN(p) then
                    
                    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(WeaponPlacementOffset.x, WeaponPlacementOffset.y, WeaponPlacementOffset.z, WeaponAimOffset.x, WeaponAimOffset.y, WeaponAimOffset.z, MissleDamage, true, 3800181289, p, true, false, MissleSpeed, wreckItCar, true)
                    CurrentPowerUp = 0
                end
            end


            if CurrentPowerUp == 3 then
                
                
                --util.draw_centred_text(carVelocityY)
                --util.draw_centred_text(carVelocityX)
                if IS_PLAYER_PRESSING_HORN(p) then
                    APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(wreckItCar, 1, 0, 100, 0, 0, true, true, 1)
                    util.yield(100)
                    CurrentPowerUp = 0
                end
            end

            if CurrentPowerUp == 4 then
                
                
                --util.draw_centred_text(carVelocityY)
                --util.draw_centred_text(carVelocityX)
                if IS_PLAYER_PRESSING_HORN(p) then
                    APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(wreckItCar, 1, 0, 0, 30, 0, true, true, 1)
                    util.yield(100)
                    CurrentPowerUp = 0
                end
            end



                --util.toast(Player)
                --util.toast(pname)
           
            end
        end

        if wreckItEnabled == 0 then
            return false
        end
        
    end)

    

end


menu.toggle_loop(myListFunWreckItSettings, "Enable Wreck It", {"enableWreckIt"}, "Sets up the minigame", function()

    if wreckItEnabled == 0 then
        wreckItEnabled = 1





        local wreckItFloorHash = util.joaat("ar_prop_ar_bblock_huge_05")

        local wreckItFloorLoc = v3.new(0, 0, 1000)
        local wreckItFloorRot = v3.new(0, 0, 0)

        local wreckItCarsLocations = {
            v3.new(30, 75, 1001),
            v3.new(-30, 75, 1001),
            v3.new(-30, -75, 1001),
            v3.new(30, -75, 1001),
            v3.new(30, 30, 1001),
            v3.new(30, -30, 1001),
            v3.new(-30, -30, 1001),
            v3.new(-30, 30, 1001)
        }

        local wreckItCarsRotations = {
            v3.new(0, 0, 135),
            v3.new(0, 0, -135),
            v3.new(0, 0, -45),
            v3.new(0, 0, 45),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
            v3.new(0, 0, -90)
        }


       
        util.request_model(wreckItFloorHash)
        local wreckItFloor = entities.create_object(wreckItFloorHash, wreckItFloorLoc, 0)
        table.insert(wreckItFloorElements, 1, wreckItFloor)
        SET_ENTITY_ROTATION(wreckItFloor, wreckItFloorRot.x, wreckItFloorRot.y, wreckItFloorRot.z, 2, true)
        FREEZE_ENTITY_POSITION(wreckItFloor, true)
        entities.set_can_migrate(wreckItFloor, false)
        SET_ENTITY_AS_MISSION_ENTITY(wreckItFloor, true, true)

        SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 1003)

        for i = 1, #wreckItCarsLocations, 1 do
            spawnWreckItCars(wreckItCarsLocations[i], wreckItCarsRotations[i])
        end

        
        






        
    end
    
end, function()

    wreckItEnabled = 0

    for i, element in wreckItFloorElements do
        entities.delete(element)
    end
    wreckItFloorElements = {}

    

    for i, car in wreckItCars do
        entities.delete(car)
    end
    wreckItCars = {}

    for i, baloon in wreckItBaloons do
        entities.delete(baloon)
    end
    wreckItBaloons = {}
    
    menu.trigger_commands("playWreckIt off")

    
end)


menu.toggle_loop(myListFunWreckItSettings, "Wreck It", {"playWreckIt"}, "Wreck the other player's cars 3 times to disqualify them !", function()

if wreckItEnabled == 1 then
    if wreckItStarted == 0 then
        wreckItStarted = 1
        
        local wreckItPowerUpsLocations = {
            v3.new(0, 75, 1002),
            v3.new(0, 56.25, 1002),
            v3.new(0, 37.5, 1002),
            v3.new(0, 18.75, 1002),
            v3.new(0, -18.75, 1002),
            v3.new(0, -37.5, 1002),
            v3.new(0, -56.25, 1002),
            v3.new(0, -75, 1002) -- 8
        }

        for i = 1, 8, 1 do
            spawnPowerUps(wreckItPowerUpsLocations[i])
        end

        for i, car in wreckItCars do
            FREEZE_ENTITY_POSITION(car, false)
        end

    end

else
    util.toast("Please Enable the minigame before trying to play it !")
    menu.trigger_commands("playWreckIt off")
end

end, function()

    wreckItStarted = 0
    triggerOnce = 0

    for i, car in wreckItCars do
        FREEZE_ENTITY_POSITION(car, true)
    end

    for i, PU in wreckItPowerUps do
        entities.delete(PU)
    end
    wreckItPowerUps = {}

end)]]

function know_object_dimension(modelHash)
    local min = v3.new()
    local max = v3.new()

    GET_MODEL_DIMENSIONS(modelHash, min, max)
    
    --util.toast("---------------")

    util.toast("max x : " .. max.x)
    util.toast("max y : " .. max.y)
    util.toast("max z : " .. max.z)
    
    --util.toast"~~~~~~~~~~~~~~~~~~"

    --util.toast("min x : " .. min.x)
    --util.toast("min y : " .. min.y)
    --util.toast("min z : " .. min.z)
    
    --util.toast("---------------")
    

end

local setupSumoArena = 0
local setupSumoCars = 0
local SumoElements = {}
local SumoCars = {}

menu.toggle_loop(myListFunSumoSettings, "Setup Sumo", {"setupSumo"}, "Spawns The Sumo Arena !", function()

    if setupSumoArena == 0 then
        setupSumoArena = 1



        local Locations = {
            --floor
            v3.new(0, 0, 994),
            

            
           
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            
            
            
            
            
        }

     

        local Hashes = {
            --floor
            "stt_prop_stunt_target",
           
        }

     

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(SumoElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the arena to load fully before playing !")
        end

        if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
            local PlayerCar = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
            SET_ENTITY_COORDS_NO_OFFSET(PlayerCar, 0, 0, 1003)
        else
            SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 1003)
        end

        util.show_corner_help("The arena is fully loaded ! You can spawn the cars !")


    end

end, function()

    for i, element in SumoElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    SumoElements = {}

    setupSumoArena = 0

end)

menu.toggle_loop(myListFunSumoSettings, "2 Players", {"2Psumo"}, "Spawns The Sumo Cars !", function()

if setupSumoArena == 1 then

    if setupSumoCars == 0 then
        setupSumoCars = 1



        local Locations = {
            --floor
            v3.new(0, -20, 994),
            v3.new(0, 20, 994),
            

            
           
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            v3.new(0, 0, 180),
            
            
            
            
            
        }

     

        local Hashes = {
            --floor
            "voltic2", --zhaba
            "voltic2",
           
        }

     local car
        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            car = entities.create_vehicle(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(SumoCars, 1, car)
            SET_ENTITY_ROTATION(car, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(car, true)
            SET_VEHICLE_COLOURS(car, 70, 70)
            SET_SCRIPT_ROCKET_BOOST_RECHARGE_TIME(car, 0.1)
            entities.set_can_migrate(car, false)
            SET_ENTITY_AS_MISSION_ENTITY(car, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before playing !")
        end

        util.show_corner_help("The cars are fully loaded ! You can start the Sumo when ready !")

            for j = 1, #SumoCars, 2 do
                SET_VEHICLE_COLOURS(car, 30, 30)
            end


    end
    


else
    util.show_corner_help("Please load the Sumo Arena first !")
    menu.trigger_commands("2Psumo off")
end
end, function()

    for i, car in SumoCars do
        entities.set_can_migrate(car, true)
        entities.delete(car)
    end
    SumoCars = {}

    setupSumoCars = 0

end)


menu.toggle_loop(myListFunSumoSettings, "4 Players", {"4Psumo"}, "Spawns The Sumo Cars !", function()

    if setupSumoArena == 1 then
    
        if setupSumoCars == 0 then
            setupSumoCars = 1
    
    
    
            local Locations = {
                --floor
                v3.new(0, -20, 994),
                v3.new(0, 20, 994),
                v3.new(20, 0, 994),
                v3.new(-20, 0, 994),
                
    
                
               
            }
    
            local Rotations = {
                --floor
                v3.new(0, 0, 0),
                v3.new(0, 0, 180),
                v3.new(0, 0, 90),
                v3.new(0, 0, -90),
                
                
                
                
                
            }
    
         
    
            local Hashes = {
                --floor
                "voltic2", --zhaba
                "voltic2",
                "voltic2",
                "voltic2",
               
            }
    
         local car
            for i = 1, #Hashes, 1 do
                local Hash = util.joaat(Hashes[i])
                util.request_model(Hash)
    
                car = entities.create_vehicle(Hash, Locations[i], 0)
                --Get_Entity(prop)
                table.insert(SumoCars, 1, car)
                SET_ENTITY_ROTATION(car, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
                FREEZE_ENTITY_POSITION(car, true)
                SET_VEHICLE_COLOURS(car, 70, 70)
                if i >= 3 then
                    SET_VEHICLE_COLOURS(car, 30, 30)
                end
                SET_SCRIPT_ROCKET_BOOST_RECHARGE_TIME(car, 0.1)
                entities.set_can_migrate(car, false)
                SET_ENTITY_AS_MISSION_ENTITY(car, true, true)
                LOAD_ALL_OBJECTS_NOW()
                NETWORK_UPDATE_LOAD_SCENE()
                util.yield(50)
                --know_object_dimension(Hash)
                util.show_corner_help("Please wait for the map to load fully before playing !")
            end
    
            util.show_corner_help("The cars are fully loaded ! You can start the Sumo when ready !")
    
                for j = 1, #SumoCars, 2 do
                    --SET_VEHICLE_COLOURS(j, 30, 30)
                end
    
    
        end
        
    
    
    else
        util.show_corner_help("Please load the Sumo Arena first !")
        menu.trigger_commands("4Psumo off")
    end
    end, function()
    
        for i, car in SumoCars do
            entities.set_can_migrate(car, true)
            entities.delete(car)
        end
        SumoCars = {}
    
        setupSumoCars = 0
    
    end)

    menu.toggle_loop(myListFunSumoSettings, "8 Players", {"8Psumo"}, "Spawns The Sumo Cars !", function()

        if setupSumoArena == 1 then
        
            if setupSumoCars == 0 then
                setupSumoCars = 1
        
        
        
                local Locations = {
                    --floor
                    v3.new(0, -20, 994),
                    v3.new(0, 20, 994),
                    v3.new(20, 0, 994),
                    v3.new(-20, 0, 994),
                    v3.new(14.142, 14.142, 994),
                    v3.new(-14.142, 14.142, 994),
                    v3.new(14.142, -14.142, 994),
                    v3.new(-14.142, -14.142, 994),
                    
        
                    
                   
                }
        
                local Rotations = {
                    --floor
                    v3.new(0, 0, 0),
                    v3.new(0, 0, 180),
                    v3.new(0, 0, 90),
                    v3.new(0, 0, -90),
                    v3.new(0, 0, 135),
                    v3.new(0, 0, -135),
                    v3.new(0, 0, 45),
                    v3.new(0, 0, -45),
                    
                    
                    
                    
                    
                }
        
             
        
                local Hashes = {
                    --floor
                    "voltic2", --zhaba
                    "voltic2",
                    "voltic2",
                    "voltic2",
                    "voltic2",
                    "voltic2",
                    "voltic2",
                    "voltic2",
                   
                }
        
             local car
                for i = 1, #Hashes, 1 do
                    local Hash = util.joaat(Hashes[i])
                    util.request_model(Hash)
        
                    car = entities.create_vehicle(Hash, Locations[i], 0)
                    --Get_Entity(prop)
                    table.insert(SumoCars, 1, car)
                    SET_ENTITY_ROTATION(car, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
                    FREEZE_ENTITY_POSITION(car, true)
                    SET_VEHICLE_COLOURS(car, 70, 70)
                    if i >= 5 then
                        SET_VEHICLE_COLOURS(car, 30, 30)
                    end
                    SET_SCRIPT_ROCKET_BOOST_RECHARGE_TIME(car, 0.1)
                    entities.set_can_migrate(car, false)
                    SET_ENTITY_AS_MISSION_ENTITY(car, true, true)
                    LOAD_ALL_OBJECTS_NOW()
                    NETWORK_UPDATE_LOAD_SCENE()
                    util.yield(50)
                    --know_object_dimension(Hash)
                    util.show_corner_help("Please wait for the map to load fully before playing !")
                end
        
                util.show_corner_help("The cars are fully loaded ! You can start the Sumo when ready !")
        
                    for j = 1, #SumoCars, 2 do
                        --SET_VEHICLE_COLOURS(j, 30, 30)
                    end
        
        
            end
            
        
        
        else
            util.show_corner_help("Please load the Sumo Arena first !")
            menu.trigger_commands("8Psumo off")
        end
        end, function()
        
            for i, car in SumoCars do
                entities.set_can_migrate(car, true)
                entities.delete(car)
            end
            SumoCars = {}
        
            setupSumoCars = 0
        
        end)

menu.action(myListFunSumoSettings, "Start !", {"StartSumo"}, "Allows the cars to move !", function()
    if setupSumoArena == 1 and setupSumoCars == 1 then
        for i, car in SumoCars do
            entities.set_can_migrate(car, true)
            FREEZE_ENTITY_POSITION(car, false)
            util.create_tick_handler(function()

                local carLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(car, 0, 0, 0)
                if carLocation.z < 990 then
                    ADD_EXPLOSION(carLocation.x, carLocation.y, carLocation.z, 59, 1, true, false, 1.0, false)
                    ADD_EXPLOSION(carLocation.x, carLocation.y, carLocation.z, 59, 1, true, false, 1.0, false)
                    ADD_EXPLOSION(carLocation.x, carLocation.y, carLocation.z, 59, 1, true, false, 1.0, false)
                    ADD_EXPLOSION(carLocation.x, carLocation.y, carLocation.z, 59, 1, true, false, 1.0, false)
                    ADD_EXPLOSION(carLocation.x, carLocation.y, carLocation.z, 59, 1, true, false, 1.0, false)
                    return false 
                end

                if IS_ROCKET_BOOST_ACTIVE(car) then
                    --util.toast("BOOOOP!")
                    --Get_Entity(car)
                    --APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(car, 1, 0, -1.5, 0, 0, true, true, 1)
                end

                if setupSumoCars == 0 then
                    return false                    
                end
            end)
        end
        
    else
        util.show_corner_help("Please load the Sumo Arena and Cars first !")
    end
end)


local setupBOarena = 0
local BowlingElements = {}

local setupBOarenaS = 0
local BowlingElementsS = {}

menu.toggle_loop(myListFunBowlingSettings, "Setup Bowling", {"setupBowling"}, "Spawns The Bowling Layout !", function()

    if setupBOarena == 0 then
        setupBOarena = 1
        

        local Locations = {
            --floor
            v3.new(0, 0, 1000),
            v3.new(0, 84, 1000),
            --Gutters
            v3.new(22, 44, 990),
            v3.new(-22, 44, 990),
            --Pins
            v3.new(9, 105, 1000.2),
            v3.new(-9, 105, 1000.2),
            v3.new(3, 105, 1000.2),
            v3.new(-3, 105, 1000.2),
            v3.new(0, 100, 1000.2),
            v3.new(6, 100, 1000.2),
            v3.new(-6, 100, 1000.2),
            v3.new(3, 95, 1000.2),
            v3.new(-3, 95, 1000.2),
            v3.new(0, 90, 1000.2),
            --Ball
            v3.new(0, 0, 1002.9),

            
           
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            --Gutters
            v3.new(0, 180, 90),
            v3.new(0, 180, 90),
            --Pins
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            --Ball
            v3.new(0, 0, 0),
            
            
            
            
        }

     

        local Hashes = {
            --floor
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            --Gutters
            "stt_prop_stunt_tube_m",
            "stt_prop_stunt_tube_m",
        }

        local PropHashes = {
            --Pins
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            "stt_prop_stunt_bowling_pin",
            --Ball
            "stt_prop_stunt_bowling_ball",
        }

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(BowlingElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before playing !")
        end

        for i = 1, #PropHashes, 1 do
            local Hash = util.joaat(PropHashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[4 + i], 0)
            SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION(prop, false)
            --Get_Entity(prop)
            table.insert(BowlingElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[4 + i].x, Rotations[4 + i].y, Rotations[4 + i].z, 2, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before playing !")
        end

        --[[if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
            local PlayerCar = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
            SET_ENTITY_COORDS_NO_OFFSET(PlayerCar, 0, -10, 1003)
        else
            SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, -10, 1003)
        end]]

        util.show_corner_help("The map is fully loaded ! You can roll the ball ! Enable Spectator Quarter to TP to the Bowling Layout")


    end

end, function()

    for i, element in BowlingElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    BowlingElements = {}

    setupBOarena = 0

end)


menu.action(myListFunBowlingSettings, "Take your chance and roll !", {"PlayBowling"}, "Rolls the ball !", function()

    if setupBOarena == 1 then
        
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(BowlingElements[1], 1, math.random(-8, 8), math.random(100, 350), math.random(5, 12), 0, true, true, 1)

    else
        util.show_corner_help("Please load the Bowling Layout first !")
    end

end)


menu.toggle_loop(myListFunBowlingSettings, "Setup Bowling Spectator Quarter", {"setupBowlingSQ"}, "Spawns The Spectator Bowling Quarter !", function()

    if setupBOarena == 1 then
    if setupBOarenaS == 0 then
        setupBOarenaS = 1
        

        local Locations = {
            --floor
            v3.new(60, 50, 1030),
    

            
           
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
 
            
            
            
            
        }

     

        local Hashes = {
            --floor
            "ar_prop_ar_bblock_huge_01",
          
        }

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(BowlingElementsS, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before playing !")
        end

        if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
            local PlayerCar = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
            SET_ENTITY_COORDS_NO_OFFSET(PlayerCar, 60, 50, 1032)
        else
            SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 60, 50, 1032)
        end

        util.show_corner_help("The Spectator Quarter is fully loaded ! You can Reset the Bowling Layout without fear of them falling down in the void !")


    end
else
    util.show_corner_help("Please load the Bowling Layout first !")
end

end, function()

    for i, element in BowlingElementsS do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    BowlingElementsS = {}

    setupBOarenaS = 0

end)


local setupWIarena = 0
local ArenaElements = {}
local playerWreckItElements = {}
local GiftsElements = {}

menu.toggle_loop(myListFunWreckItM1Settings, "Setup Arena", {"setupWreckItM1"}, "Spawns The Arena!", function()

    if setupWIarena == 0 then
        setupWIarena = 1
        
        menu.trigger_commands("setupWreckItM2 off")
        menu.trigger_commands("setupWreckItPowerUpsM2 off")

        local Locations = {
            --floor
            v3.new(0, 0, 968.52),
            --corners
            v3.new(60, 60, 1000-0.8),
            v3.new(-60, 60, 1000-0.8),
            v3.new(-60, -60, 1000-0.8),
            v3.new(60, -60, 1000-0.8),
            --walls
            v3.new(60, 0, 1000),
            v3.new(0, 60, 1000),
            v3.new(-60, 0, 1000),
            v3.new(0, -60, 1000),
            --ramps
            v3.new(0, -15, 968.5),
            v3.new(0, 15, 968.5),
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            --corners
            v3.new(0, 0, 0),
            v3.new(0, 0, 90),
            v3.new(0, 0, 180),
            v3.new(0, 0, 270),
            --walls
            v3.new(0, 0, 0),
            v3.new(0, 0, 90),
            v3.new(0, 0, 180),
            v3.new(0, 0, 270),
            --ramps
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
        }

     

        local Hashes = {
            --floor
            "bkr_prop_biker_bblock_huge_04",
            --corners
            "bkr_prop_biker_bblock_cor",
            "bkr_prop_biker_bblock_cor",
            "bkr_prop_biker_bblock_cor",
            "bkr_prop_biker_bblock_cor",
            --walls
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            --ramps
            "stt_prop_ramp_jump_xs",
            "stt_prop_ramp_jump_xs",
        }

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            table.insert(ArenaElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)

            util.yield(500)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before spawning the power ups and cars !")
        end

        SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 972)
        util.show_corner_help("The map is fully loaded ! You can spawn the power ups and cars !")


    end

end, function()

    for i, element in ArenaElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    ArenaElements = {}

    for i, element in playerWreckItElements do
        entities.delete(element)
    end
    playerWreckItElements = {}

    setupWIarena = 0
    menu.trigger_commands("setupWreckItPowerUpsM1 off")

end)



local setupWIpowerups = 0
local PowerUpsElements = {}
local allTampas = {}
local randomPU = 0



--[[function managePowerUps(Tampa)

    for i, gift in GiftsElements do

        local PUloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(gift, 0, 0, 0)
        local Tampaloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Tampa, 0, 0, 0)

        if Tampaloc:distance(PUloc) < 3 and randomPU == 0 then

            --[[randomPU = 2 --math.random(1, 2)
            
            if randomPU == 1 then
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 10, 0, false)
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 10, -1, false)
                randomPU = 0
            end

            if randomPU == 2 then
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 0, 100, 0, false, true, 1)
                util.yield(5000)--cooldown to prevent jumping 10000x times within a second
                randomPU = 0
            end--]]

    --[[        if GET_ENTITY_MODEL(gift) == 1219257666 and IS_ENTITY_VISIBLE(gift) then
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 10, 0, false)
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 10, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == -1633273698 and IS_ENTITY_VISIBLE(gift) then
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 0, 25, 0, false, true, 1)
                util.yield(5000)--cooldown to prevent jumping 10000x times within a second
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == 1709896882 and IS_ENTITY_VISIBLE(gift) then
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 30, 0, 0, true, true, 1)
                util.yield(5000)--cooldown to prevent boosting 10000x times within a second
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == -1531914544 and IS_ENTITY_VISIBLE(gift) then
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 1, 0, false)
                SET_VEHICLE_MOD(Tampa, 2, 0, false)
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 1, -1, false)
                SET_VEHICLE_MOD(Tampa, 2, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == 1944414445 and IS_ENTITY_VISIBLE(gift) then
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 9, 0, false)
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 9, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end


        end
    end

end--]]


menu.toggle_loop(myListFunWreckItM1Settings, "Setup Power Ups and Vehicles", {"setupWreckItPowerUpsM1"}, "Spawns Power Ups and vehicles !", function()
    if setupWIarena == 1 then
        if setupWIpowerups == 0 then
            setupWIpowerups = 1

            
            local giftsLocations = {
                --tampas
                v3.new(50, 0, 970),
                v3.new(-50, 0, 970),
                v3.new(0, -50, 970),
                v3.new(0, 50, 970),
                v3.new(0, 0, 976),
            }
            local giftsRotations = {
                --tampas
                v3.new(0, 0, 0),
                v3.new(0, 0, 90),
                v3.new(0, 0, 180),
                v3.new(0, 0, 270),
                v3.new(0, 0, 0),
            }


            local BoostsLocations = {
                --tampas
                v3.new(0, 0, 970),
            }

            local JumpsLocations = {
                --tampas
                v3.new(30, -30, 970),
                v3.new(-30, -30, 970),
                v3.new(30, 30, 970),
                v3.new(-30, 30, 970),
            }

            local TampaLocations = {
                --floor
                v3.new(40, 0, 970),
                v3.new(-40, 0, 970),
                v3.new(0, -40, 970),
                v3.new(0, 40, 970),
            }

            local TampaRotations = {
                --floor
                v3.new(0, 0, 90),
                v3.new(0, 0, -90),
                v3.new(0, 0, 0),
                v3.new(0, 0, -180)
            }

            local Hashes = {
                --predefined
                "prop_mp_boost_01", --xm_prop_rsply_crate04a
                "prop_mk_race_chevron_02",
                --random
                "prop_mp_repair_01",
                "prop_mp_rocket_01",
                "prop_mp_spike_01"
            }

            for i = 1, #Hashes, 1 do
                local Hash = util.joaat(Hashes[math.random(3, #Hashes)])
                util.request_model(Hash)

                local gift = entities.create_object(Hash, giftsLocations[i], 0)
                table.insert(GiftsElements, 1, gift)
                SET_ENTITY_ROTATION(gift, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(gift, true)
                entities.set_can_migrate(gift, false)
                SET_ENTITY_AS_MISSION_ENTITY(gift, true, true)
                SET_ENTITY_COLLISION(gift, false, false)

                util.yield(500)
                --know_object_dimension(Hash)
            end

            for i = 1, #BoostsLocations, 1 do
                local Hash = util.joaat(Hashes[1])
                util.request_model(Hash)

                local boost = entities.create_object(Hash, BoostsLocations[i], 0)
                table.insert(GiftsElements, 1, boost)
                SET_ENTITY_ROTATION(boost, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(boost, true)
                entities.set_can_migrate(boost, false)
                SET_ENTITY_AS_MISSION_ENTITY(boost, true, true)
                SET_ENTITY_COLLISION(boost, false, false)

                util.yield(500)
                --know_object_dimension(Hash)
            end

            for i = 1, #JumpsLocations, 1 do
                local Hash = util.joaat(Hashes[2])
                util.request_model(Hash)

                local jump = entities.create_object(Hash, JumpsLocations[i], 0)
                table.insert(GiftsElements, 1, jump)
                SET_ENTITY_ROTATION(jump, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(jump, true)
                entities.set_can_migrate(jump, false)
                SET_ENTITY_AS_MISSION_ENTITY(jump, true, true)
                SET_ENTITY_COLLISION(jump, false, false)

                util.yield(500)
                --know_object_dimension(Hash)
            end

            --local allVehicles = entities.get_all_vehicles_as_handles()
            local Player
            local pname 

            if next(allTampas) == nil then

                    for i = 1, 4, 1 do
                        local Hash = util.joaat("tampa3")
                        util.request_model(Hash)
            
                        local Tampa = entities.create_vehicle(Hash, TampaLocations[i], 0)
                        table.insert(allTampas, 1, Tampa)
                        SET_ENTITY_ROTATION(Tampa, TampaRotations[i].x, TampaRotations[i].y, TampaRotations[i].z, 2, true)
                        --FREEZE_ENTITY_POSITION(Tampa, true)
                        SET_ENTITY_AS_MISSION_ENTITY(Tampa, true, true)
                        SET_VEHICLE_MOD_KIT(Tampa, 0)
                        SET_VEHICLE_MOD(Tampa, 5, 2, false)
            
                        util.yield(500)

                        util.create_tick_handler(function()
                            for k,p in pairs(players.list(true, true, true)) do
                                local Pedm = GET_PLAYER_PED(p)
                                if IS_PED_IN_VEHICLE(Pedm, Tampa, false) then
                                    Player = GET_PLAYER_PED_SCRIPT_INDEX(p)
                                    pname = GET_PLAYER_NAME(p)
                                    --util.toast(Player)

                                    managePowerUps(Tampa)
                            
                                end
                            end
                    
                            if not DOES_ENTITY_EXIST(Tampa) then
                                return false
                            end
                            
                        end)

                    end
                    
                end

        
        
            --SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 1003)


        end
    else
    
        util.toast("Please spawn the arena first !")
        menu.trigger_commands("setupWreckItPowerUpsM1 off")

    end

end, function()

    for i, element in PowerUpsElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    PowerUpsElements = {}

    for i, element in GiftsElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    GiftsElements = {}

    for i, car in allTampas do
        entities.delete(car)
    end
    allTampas = {}

    rotatePU = 0

    setupWIpowerups = 0

end)




-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------



--[[menu.toggle_loop(myListFunWreckItM2Settings, "Setup Arena", {"setupWreckItM2"}, "Spawns The Arena!", function()

    if setupWIarena == 0 then
        setupWIarena = 1
        
        menu.trigger_commands("setupWreckItM1 off")
        menu.trigger_commands("setupWreckItPowerUpsM1 off")

        local Locations = {
            --floors
            v3.new(0, 0, 1000),
            v3.new(-32, 0, 1000),
            v3.new(32, 0, 1000),
            
            v3.new(-96, 0, 1000),
            v3.new(96, 0, 1000),
            
            v3.new(-64, 20, 1000),
            v3.new(64, -20, 1000),
            
            v3.new(-96, 60, 1000),
            v3.new(-64, 60, 1000),
            v3.new(-32, 60, 1000),
            v3.new(0, 60, 1000),
            v3.new(32, 60, 1000),
            v3.new(64, 60, 1000),
            v3.new(96, 60, 1000),
            
            v3.new(-96, -60, 1000),
            v3.new(-64, -60, 1000),
            v3.new(-32, -60, 1000),
            v3.new(0, -60, 1000),
            v3.new(32, -60, 1000),
            v3.new(64, -60, 1000),
            v3.new(96, -60, 1000),
            --wave
            v3.new(0, 113, 1031.48),
            v3.new(-102.4, 113, 1031.48),
            v3.new(102.4, 113, 1031.48),
            v3.new(-51.2, 112.95, 1031.52),
            v3.new(51.2, 112.95, 1031.52),
            
            v3.new(0, 113, 1070),
            v3.new(-102.4, 113, 1070),
            v3.new(102.4, 113, 1070),
            v3.new(-51.2, 112.95, 1069.95),
            v3.new(51.2, 112.95, 1069.95),
            --slope
            v3.new(-96, -150, 1020.4),
            v3.new(-64, -150, 1020.4),
            v3.new(-32, -150, 1020.4),
            v3.new(0, -150, 1020.4),
            v3.new(32, -150, 1020.4),
            v3.new(64, -150, 1020.4),
            v3.new(96, -150, 1020.4),
            
            v3.new(-96, -190, 1020.4),
            v3.new(-64, -190, 1020.4),
            v3.new(-32, -190, 1020.4),
            v3.new(0, -190, 1020.4),
            v3.new(32, -190, 1020.4),
            v3.new(64, -190, 1020.4),
            v3.new(96, -190, 1020.4),
            
            v3.new(-96, -88.25, 1006),
            v3.new(-64, -88.25, 1006),
            v3.new(-32, -88.25, 1006),
            v3.new(0, -88.25, 1006),
            v3.new(32, -88.25, 1006),
            v3.new(64, -88.25, 1006),
            v3.new(96, -88.25, 1006),
            --walls
            v3.new(-96, -210, 1040),
            v3.new(-64, -210, 1040),
            v3.new(-32, -210, 1040),
            v3.new(0, -210, 1040),
            v3.new(32, -210, 1040),
            v3.new(64, -210, 1040),
            v3.new(96, -210, 1040),
            --ramps
            v3.new(0, -134, 1020.2),
            v3.new(-3, -134, 1020.2),
            v3.new(3, -134, 1020.2),
            v3.new(-6, -134, 1020.2),
            v3.new(6, -134, 1020.2),
            
            v3.new(70, -134, 1020.2),
            v3.new(67, -134, 1020.2),
            v3.new(73, -134, 1020.2),
            v3.new(64, -134, 1020.2),
            v3.new(76, -134, 1020.2),
            
            v3.new(-70, -134, 1020.2),
            v3.new(-73, -134, 1020.2),
            v3.new(-67, -134, 1020.2),
            v3.new(-76, -134, 1020.2),
            v3.new(-64, -134, 1020.2),
            --upper floor
            v3.new(128, -190, 1020.4),
            v3.new(128, -150, 1020.4),
            v3.new(128, -110, 1020.4),
            v3.new(128, -70, 1020.4),
            v3.new(128, -30, 1020.4),
            v3.new(128, 60, 1000),
            v3.new(-128, -190, 1020.4),
            v3.new(-128, -150, 1020.4),
            v3.new(-128, -110, 1020.4),
            v3.new(-128, -70, 1020.4),
            v3.new(-128, -30, 1020.4),
            v3.new(-128, 60, 1000),
            
            v3.new(128, 31.75, 1006),
            v3.new(-128, 31.75, 1006),
            
            v3.new(111.5, 26.25, 990.85),
            v3.new(-111.5, 26.25, 990.85),
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            --wave
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            
            v3.new(180, 0, 90),
            v3.new(180, 0, 90),
            v3.new(180, 0, 90),
            v3.new(180, 0, 90),
            v3.new(180, 0, 90),
            --slope
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            --walls
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            v3.new(90, 0, 0),
            --ramps
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            --upper floor
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(-20, 0, 0),
            v3.new(-20, 0, 0),
            
            v3.new(-20, 90, 0),
            v3.new(-20, 90, 0),
        }

     

        local Hashes = {
            --floor
            "ar_prop_ar_bblock_huge_02",--89
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",--80
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",--70        -- ar_prop_ar_bblock_huge_01
            --wave
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",--60
            --slope
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01", 
            
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",--50
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01", 
            
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",
            "ar_prop_ar_bblock_huge_02",--40
            "ar_prop_ar_bblock_huge_02",
            --walls
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",  
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01", -- stt_prop_ramp_jump_s
            --ramps
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",--30
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",--20
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            --upper floor
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",--10
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
        }

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(ArenaElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before spawning the power ups and cars !")
        end

        --SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 1003)
        util.show_corner_help("The map is fully loaded ! You can spawn the power ups and cars !")


    end

end, function()

    for i, element in ArenaElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    ArenaElements = {}

    for i, element in playerWreckItElements do
        entities.delete(element)
    end
    playerWreckItElements = {}

    setupWIarena = 0
    menu.trigger_commands("setupWreckItPowerUpsM2 off")

end),--]]


menu.toggle_loop(myListFunWreckItM2Settings, "Setup Arena", {"setupWreckItM2"}, "Spawns The Arena!", function()

    if setupWIarena == 0 then
        setupWIarena = 1
        
        menu.trigger_commands("setupWreckItM1 off")
        menu.trigger_commands("setupWreckItPowerUpsM1 off")

        local Locations = {
            --floors
            v3.new(0, 0, 1000),
            v3.new(-155, 0, 1015),
            v3.new(-55.5, 0, 1001.89),
            --wave
            v3.new(75, 32.5, 1031.48),
            v3.new(75, -32.5, 1031.48),
            v3.new(75, 116, 1031.48),
            v3.new(75, -116, 1031.48),
            
            v3.new(75, 32.5, 1065),
            v3.new(75, -32.5, 1065),
            v3.new(75, 116, 1065),
            v3.new(75, -116, 1065),
            --sides
            v3.new(30, 120, 1000),
            v3.new(30, -120, 1000),
            
            v3.new(13.5, 149, 917),
            v3.new(13.5, -149, 917),
            
            v3.new(-84.5, 148.8, 1015),
            v3.new(-84.5, -148.8, 1015),
            --walls
            v3.new(-84.5, 98.3, 964.5),
            v3.new(-84.5, -98.3, 964.5),
            
            v3.new(-180, 98, 1050),
            v3.new(-180, -98, 1050),
            
            v3.new(13.5, 140.4, 1000),
            v3.new(13.5, -140.4, 1000),
            
            v3.new(13.5, 140.4, 1050),
            v3.new(13.5, -140.4, 1050),
            
            v3.new(-182.5, 140.4, 1050),
            v3.new(-182.5, -140.4, 1050),
            --ramps
            v3.new(-16, 106.8, 1015),
            v3.new(-16, -106.8, 1015),
            v3.new(-20, 106.8, 1015),
            v3.new(-20, -106.8, 1015),
            v3.new(-12, 106.8, 1015),
            v3.new(-12, -106.8, 1015),
            --pipes
            v3.new(-16, -55, 1025),
            v3.new(-16, 55, 1025),
            v3.new(-16, 0, 1020),
            v3.new(-16, 0, 986),
            --deco
            v3.new(-140, 0, 1014.5),
            v3.new(-140, 0, 1014.5),
            v3.new(-136, 0, 1000),
            v3.new(-140, 0, 982),
            v3.new(-141, 0, 1000),
            --upper floor
            v3.new(-180, 148, 1050),
            v3.new(-180, -148, 1050),

            
           
        }

        local Rotations = {
            --floor
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 15, 0),
            --wave
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(0, 180, 180),
            v3.new(0, 180, 180),
            v3.new(0, 180, 180),
            v3.new(0, 180, 180),
            --sides
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            
            v3.new(90, 0, 90),
            v3.new(90, 0, 90),
            
            v3.new(0, 0, 90),
            v3.new(0, 0, 90),
            --walls
            v3.new(0, 90, 90),
            v3.new(0, 90, 90),
            
            v3.new(0, 90, 0),
            v3.new(0, 90, 0),
            
            v3.new(0, 90, 90),
            v3.new(0, 90, 90),
            
            v3.new(0, 90, 90),
            v3.new(0, 90, 90),
            
            v3.new(0, 90, 90),
            v3.new(0, 90, 90),
            --ramps
            v3.new(0, 0, -90),
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
            v3.new(0, 0, 90),
            --pipes
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
            v3.new(180, 0, 90),
            v3.new(0, 0, 0),
            --deco
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 0),
            v3.new(0, 0, 180),
            v3.new(0, 0, 90),
            --upper floor
            v3.new(0, 0, 90),
            v3.new(0, 0, -90),
            
            
            
            
        }

     

        local Hashes = {
            --floor
            "ar_prop_ar_bblock_huge_05",
            "ar_prop_ar_bblock_huge_05",
            "ar_prop_ar_bblock_huge_05",
            --wave
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",
            "bkr_prop_biker_bblock_qp",--10
            "bkr_prop_biker_bblock_qp",
            --sides
            "ar_prop_ar_bblock_huge_01",
            "ar_prop_ar_bblock_huge_01",
            
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            --walls
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            
            "stt_prop_stunt_bblock_huge_05",--20
            "stt_prop_stunt_bblock_huge_05",
            
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            
            "stt_prop_stunt_bblock_huge_05",
            "stt_prop_stunt_bblock_huge_05",
            --ramps
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",--30
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            "stt_prop_ramp_jump_s",
            --pipes
            "stt_prop_stunt_tube_jmp",
            "stt_prop_stunt_tube_jmp",
            "ar_prop_inflategates_cp_loop_h1",
            "stt_prop_stunt_jump_loop",
            --deco
            "xs_prop_ar_tunnel_01a_sf",
            "xs_prop_ar_gate_01a_sf",
            "ar_prop_ig_jackal_cp_single",--40
            "xs_propint4_waste_06_neon",
            "ar_prop_inflategates_cp_loop_01a",
            --upper floor
            "ar_prop_ar_arrow_wide_xl",
            "ar_prop_ar_arrow_wide_xl",
        }

        for i = 1, #Hashes, 1 do
            local Hash = util.joaat(Hashes[i])
            util.request_model(Hash)

            local prop = entities.create_object(Hash, Locations[i], 0)
            --Get_Entity(prop)
            table.insert(ArenaElements, 1, prop)
            SET_ENTITY_ROTATION(prop, Rotations[i].x, Rotations[i].y, Rotations[i].z, 2, true)
            FREEZE_ENTITY_POSITION(prop, true)
            entities.set_can_migrate(prop, false)
            SET_ENTITY_AS_MISSION_ENTITY(prop, true, true)
            LOAD_ALL_OBJECTS_NOW()
            NETWORK_UPDATE_LOAD_SCENE()
            util.yield(50)
            --know_object_dimension(Hash)
            util.show_corner_help("Please wait for the map to load fully before spawning the power ups and cars !")
        end

        if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
            local PlayerCar = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
            SET_ENTITY_COORDS_NO_OFFSET(PlayerCar, 0, 0, 1003)
        else
            SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 40, 0, 1003)
        end

        util.show_corner_help("The map is fully loaded ! You can spawn the power ups and cars !")


    end

end, function()

    for i, element in ArenaElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    ArenaElements = {}

    for i, element in playerWreckItElements do
        entities.delete(element)
    end
    playerWreckItElements = {}

    setupWIarena = 0
    menu.trigger_commands("setupWreckItPowerUpsM2 off")

end)



local setupWIpowerups = 0
local PowerUpsElements = {}
local allTampas = {}
local randomPU = 0
local rotatePU = 0


function rotatePowerUps()
    if rotatePU == 0 then
        rotatePU = 1
        for i, gift in GiftsElements do
        util.create_tick_handler(function()
                local rot = GET_ENTITY_ROTATION(gift, 2)
                util.yield(5)
                SET_ENTITY_ROTATION(gift, 0, 0, rot.z+2, 2, true)
            if setupWIpowerups == 0 then
                return false
            end
        end)
    end
    end
end

function managePowerUps(Tampa)

    for i, gift in GiftsElements do

        local PUloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(gift, 0, 0, 0)
        local Tampaloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Tampa, 0, 0, 0)

        if Tampaloc:distance(PUloc) < 3 and randomPU == 0 then

            --[[randomPU = 2 --math.random(1, 2)
            
            if randomPU == 1 then
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 10, 0, false)
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 10, -1, false)
                randomPU = 0
            end

            if randomPU == 2 then
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 0, 100, 0, false, true, 1)
                util.yield(5000)--cooldown to prevent jumping 10000x times within a second
                randomPU = 0
            end--]]

            if GET_ENTITY_MODEL(gift) == 1219257666 and IS_ENTITY_VISIBLE(gift) then -- Minigun
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 10, 0, false)
                util.toast("Hold -Right Click- to shoot with the rotating miniguns ! (10 seconds)")
                util.yield(10000)
                SET_VEHICLE_MOD(Tampa, 10, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == -1633273698 and IS_ENTITY_VISIBLE(gift) then -- jump
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 0, 45, 0, false, true, 1)
                util.toast("Up we go !")
                util.yield(1000)--cooldown to prevent jumping 10000x times within a second
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == 1709896882 and IS_ENTITY_VISIBLE(gift) then -- boost
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Tampa, 1, 0, 50, 0, 0, true, true, 1)
                util.toast("Weee !")
                util.yield(1000)--cooldown to prevent boosting 10000x times within a second
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == -1531914544 and IS_ENTITY_VISIBLE(gift) then -- rocket
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 1, 0, false)
                SET_VEHICLE_MOD(Tampa, 2, 0, false)
                util.toast("Use -Scroll Wheel- to change weapon and press -Right Click- to shoot ! (5 seconds)")
                util.yield(5000)
                SET_VEHICLE_MOD(Tampa, 1, -1, false)
                SET_VEHICLE_MOD(Tampa, 2, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end

            if GET_ENTITY_MODEL(gift) == 1944414445 and IS_ENTITY_VISIBLE(gift) then -- mine
                SET_ENTITY_VISIBLE(gift, false, false)
                Get_Entity(Tampa)
                SET_VEHICLE_MOD_KIT(Tampa, 0)
                SET_VEHICLE_MOD(Tampa, 9, 0, false)
                util.toast("Press -Horn Key- to place mines ! (5 seconds)")
                util.yield(5000)
                SET_VEHICLE_MOD(Tampa, 9, -1, false)
                SET_ENTITY_VISIBLE(gift, true, true)
                randomPU = 0
            end


        end
    end

end


menu.toggle_loop(myListFunWreckItM2Settings, "Setup Power Ups and Vehicles", {"setupWreckItPowerUpsM2"}, "Spawns Power Ups and vehicles !", function()
    if setupWIarena == 1 then
        if setupWIpowerups == 0 then
            setupWIpowerups = 1

            
            local giftsLocations = {
                --tampas
                v3.new(-140.1, 61.2, 1016.2),
                v3.new(-140.1, -61.2, 1016.2),
                v3.new(-16, 0, 1078.75),
                v3.new(-16.84, -20.86, 1001.2),
                v3.new(-16.84, 20.86, 1001.2),
                v3.new(-16, 0, 1021),
                v3.new(-140, 0, 1016.2),
                v3.new(50.5, 98.27, 1001.2),
                v3.new(50.5, -98.27, 1001.2),
                v3.new(50.5, 0, 1001.2),
                v3.new(-173.2, 131.7, 1052.2),
                v3.new(-173.2, -131.7, 1052.2),
            }
            local giftsRotations = {
                --tampas
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
                v3.new(0, 0, 0),
            }


            local BoostsLocations = {
                --tampas
                v3.new(50.5, -56.135, 1001.2),
                v3.new(50.5, 56.135, 1001.2),
                v3.new(-115.5, -120, 1016.2),
                v3.new(-115.5, 120, 1016.2),
            }

            local JumpsLocations = {
                --tampas
                v3.new(-136.51, 97.67, 1016.2),
                v3.new(-136.51, -97.67, 1016.2),
                v3.new(11.57, 100, 1016.2),
                v3.new(11.57, -100, 1016.2),
            }
            

            local TampaLocations = {
                --floor
                v3.new(0, 127.5, 1017),
                v3.new(0, -127.5, 1017),
                v3.new(-150, -30, 1017),
                v3.new(-150, 30, 1017),
                v3.new(28.8, 130, 1002),
                v3.new(28.8, -130, 1002),
                v3.new(-17, 83, 1002),
                v3.new(-17, -50, 1002),
                v3.new(-17, 50, 1002),
                v3.new(-16, -83, 1002),
                v3.new(-16, -60, 1016),
                v3.new(-16, 60, 1016),
            }

            local TampaRotations = {
                --floor
                v3.new(0, 0, 90),
                v3.new(0, 0, 90),
                v3.new(0, 0, -90),
                v3.new(0, 0, -90),
                v3.new(0, 0, -180),
                v3.new(0, 0, 0),
                v3.new(0, 0, -90),
                v3.new(0, 0, -90),
                v3.new(0, 0, 90),
                v3.new(0, 0, 90),
                v3.new(0, 0, 0),
                v3.new(0, 0, 180),
            }

            local Hashes = {
                --predefined
                "prop_mp_boost_01", --xm_prop_rsply_crate04a
                "prop_mk_race_chevron_02",
                --random
                "prop_mp_repair_01",
                "prop_mp_rocket_01",
                "prop_mp_spike_01"
            }

            for i = 1, #giftsLocations, 1 do
                local Hash = util.joaat(Hashes[math.random(3, #Hashes)])
                util.request_model(Hash)

                local gift = entities.create_object(Hash, giftsLocations[i], 0)
                table.insert(GiftsElements, 1, gift)
                SET_ENTITY_ROTATION(gift, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(gift, true)
                entities.set_can_migrate(gift, false)
                SET_ENTITY_AS_MISSION_ENTITY(gift, true, true)
                SET_ENTITY_COLLISION(gift, false, false)

                util.yield(50)
                util.show_corner_help("Please wait for the assets to load fully before playing !")
                --know_object_dimension(Hash)
            end

            for i = 1, #BoostsLocations, 1 do
                local Hash = util.joaat(Hashes[1])
                util.request_model(Hash)

                local boost = entities.create_object(Hash, BoostsLocations[i], 0)
                table.insert(GiftsElements, 1, boost)
                SET_ENTITY_ROTATION(boost, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(boost, true)
                entities.set_can_migrate(boost, false)
                SET_ENTITY_AS_MISSION_ENTITY(boost, true, true)
                SET_ENTITY_COLLISION(boost, false, false)

                util.yield(50)
                util.show_corner_help("Please wait for the assets to load fully before playing !")
                --know_object_dimension(Hash)
            end

            for i = 1, #JumpsLocations, 1 do
                local Hash = util.joaat(Hashes[2])
                util.request_model(Hash)

                local jump = entities.create_object(Hash, JumpsLocations[i], 0)
                table.insert(GiftsElements, 1, jump)
                SET_ENTITY_ROTATION(jump, 0, 0, 0, 2, true)
                FREEZE_ENTITY_POSITION(jump, true)
                entities.set_can_migrate(jump, false)
                SET_ENTITY_AS_MISSION_ENTITY(jump, true, true)
                SET_ENTITY_COLLISION(jump, false, false)

                util.yield(50)
                util.show_corner_help("Please wait for the assets to load fully before playing !")
                --know_object_dimension(Hash)
            end

            --local allVehicles = entities.get_all_vehicles_as_handles()
            local Player
            local pname 

            if next(allTampas) == nil then

                    for i = 1, #TampaLocations, 1 do
                        local Hash = util.joaat("tampa3")
                        util.request_model(Hash)
            
                        local Tampa = entities.create_vehicle(Hash, TampaLocations[i], 0)
                        table.insert(allTampas, 1, Tampa)
                        SET_ENTITY_ROTATION(Tampa, TampaRotations[i].x, TampaRotations[i].y, TampaRotations[i].z, 2, true)
                        --FREEZE_ENTITY_POSITION(Tampa, true)
                        SET_ENTITY_AS_MISSION_ENTITY(Tampa, true, true)
                        SET_VEHICLE_MOD_KIT(Tampa, 0)
                        SET_VEHICLE_MOD(Tampa, 5, 2, false)
            
                        util.yield(500)

                        util.create_tick_handler(function()
                            for k,p in pairs(players.list(true, true, true)) do
                                local Pedm = GET_PLAYER_PED(p)
                                if IS_PED_IN_VEHICLE(Pedm, Tampa, false) then
                                    Player = GET_PLAYER_PED_SCRIPT_INDEX(p)
                                    pname = GET_PLAYER_NAME(p)
                                    --util.toast(Player)

                                    managePowerUps(Tampa)
                                    rotatePowerUps()
                                    local TampaLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Tampa, 0, 0, 0)
                                    if TampaLoc.z < 950 then
                                        APPLY_DAMAGE_TO_PED(Player, 100000, true, 0)
                                        entities.delete(Tampa)
                                    end
                            
                                end
                            end
                    
                            if not DOES_ENTITY_EXIST(Tampa) then
                                return false
                            end
                            
                        end)

                    end
                    
                util.show_corner_help("Please wait for the assets to load fully before playing !")
                end

        

    
            --SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 1003)
            util.show_corner_help("The assets are fully loaded ! You can now play !")


        end
    else
    
        util.toast("Please spawn the arena first !")
        menu.trigger_commands("setupWreckItPowerUpsM2 off")

    end

end, function()

    for i, element in PowerUpsElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    PowerUpsElements = {}

    for i, element in GiftsElements do
        entities.set_can_migrate(element, true)
        entities.delete(element)
    end
    GiftsElements = {}

    for i, car in allTampas do
        entities.delete(car)
    end
    allTampas = {}

    setupWIpowerups = 0

end)

--menu.action(myListFunWreckItSettings, "Player List", {}, "Select a player and spawn them a car for Wreck It !", function()
--    menu.trigger_commands("tplayer")
--end)




    local AvalancheFloors = {}
    local AvalancheSnowElements = {}
    local AvalancheSpawned = 0
    local avalancheTime = 0
    local AvalancheHighscore = 0

    menu.toggle_loop(myListFunMinigamesSettings, "Avalanche", {"playAvalanche"}, "How long can you survive when a ton of stuff rolls down toward you ?", function()
   
    if AvalancheSpawned == 0 then
        AvalancheSpawned = 1
        avalancheTime = 0

        local AvalancheFloorGutterHash = util.joaat("stt_prop_stunt_bblock_qp")
        local AvalancheFloorHash = util.joaat("ar_prop_ar_arrow_wide_xl")
        local AvalancheFloorBoundHash = util.joaat("stt_prop_stunt_bblock_qp")

        local AvalancheFloorGutterLoc = v3.new(0, 0, 800)
        local AvalancheFloorGutterRot = v3.new(45, 45, 0)
        
        local AvalancheFloorLoc = v3.new(0, 0, 755)
        local AvalancheFloorRot = v3.new(0, 0, 90)
        
        local AvalancheFloorBoundLoc = v3.new(0, 35, 850)
        local AvalancheFloorBoundRot = v3.new(60, 45, 0)

        util.request_model(AvalancheFloorGutterHash)
        local AvalancheFloorGutter = entities.create_object(AvalancheFloorGutterHash, AvalancheFloorGutterLoc, 0)
        table.insert(AvalancheFloors, 1, AvalancheFloorGutter)
        SET_ENTITY_ROTATION(AvalancheFloorGutter, AvalancheFloorGutterRot.x, AvalancheFloorGutterRot.y, AvalancheFloorGutterRot.z, 2, true)
        FREEZE_ENTITY_POSITION(AvalancheFloorGutter, true)
        entities.set_can_migrate(AvalancheFloorGutter, false)
        SET_ENTITY_AS_MISSION_ENTITY(AvalancheFloorGutter, true, true)

        util.request_model(AvalancheFloorHash)
        local AvalancheFloor = entities.create_object(AvalancheFloorHash, AvalancheFloorLoc, 0)
        table.insert(AvalancheFloors, 2, AvalancheFloor)
        SET_ENTITY_ROTATION(AvalancheFloor, AvalancheFloorRot.x, AvalancheFloorRot.y, AvalancheFloorRot.z, 2, true)
        FREEZE_ENTITY_POSITION(AvalancheFloor, true)
        entities.set_can_migrate(AvalancheFloor, false)
        SET_ENTITY_AS_MISSION_ENTITY(AvalancheFloor, true, true)

        util.request_model(AvalancheFloorBoundHash)
        local AvalancheFloorBound = entities.create_object(AvalancheFloorBoundHash, AvalancheFloorBoundLoc, 0)
        table.insert(AvalancheFloors, 3, AvalancheFloorBound)
        SET_ENTITY_ROTATION(AvalancheFloorBound, AvalancheFloorBoundRot.x, AvalancheFloorBoundRot.y, AvalancheFloorBoundRot.z, 2, true)
        FREEZE_ENTITY_POSITION(AvalancheFloorBound, true)
        entities.set_can_migrate(AvalancheFloorBound, false)
        SET_ENTITY_AS_MISSION_ENTITY(AvalancheFloorBound, true, true)

        SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, -20, 760)
        SET_RUN_SPRINT_MULTIPLIER_FOR_PLAYER(players.user_ped(), 1.49)

        util.create_tick_handler(function()
            local state = SLIDE_OBJECT(AvalancheFloor, 0, 22.5, 755, 0, 0.0035, 0, true)

            if state then
                util.toast("Minimal platform space reached !")
                return false
            end
        end)
        
        --util.create_tick_handler(function()
            --util.yield(100)
            --AvalancheSnowflakes()
            --if AvalancheSpawned == 0 then
            --    return false
            --end
        --end)

        util.create_tick_handler(function()
            util.yield(1000)
            avalancheTime = avalancheTime + 1
            util.show_corner_help("Your score so far is " .. avalancheTime .. " seconds ! The minigame will become harder and harder as you survive. The platform getting smaller and more balls falling at once")
            local playerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            if playerOffset.z < 750 then
                menu.trigger_commands('playAvalanche off')
                return false
            end

        end)
        
    end


    util.yield(1000 - avalancheTime*2)
    AvalancheSnow()


    end, function()

        for i, Element in AvalancheFloors do
            entities.delete(Element)
        end
        AvalancheFloors = {}

        for i, SnowElement in AvalancheSnowElements do
            entities.delete(SnowElement)
        end
        AvalancheSnowElements = {}

        AvalancheSpawned = 0
        SET_RUN_SPRINT_MULTIPLIER_FOR_PLAYER(players.user_ped(), 1.0)

        if avalancheTime > AvalancheHighscore then
            AvalancheHighscore = avalancheTime
        end
        util.toast("Your highscore is " .. AvalancheHighscore .. " seconds !")
        util.toast("Your score is " .. avalancheTime .. " seconds !")
        avalancheTime = 0

    end)

    local AvalancheSnowHashes = {"stt_prop_stunt_bowling_ball", "prop_juicestand", "stt_prop_stunt_soccer_lball"}
    local AvalancheSnowflakeHashes = {"v_ilev_exball_blue", "v_ilev_exball_grey", "v_res_mexball", "p_ld_am_ball_01", "p_ld_soc_ball_01", "prop_tennis_ball", "v_16_basketball", "prop_beach_volball01", "prop_beach_volball02", "prop_beachball_01", "prop_beachball_02", "prop_bowling_ball", "prop_golf_ball", "prop_golf_ball_p2", "prop_golf_ball_p3", "prop_golf_ball_p4", "prop_poolball_1", "prop_poolball_10", "prop_poolball_11", "prop_poolball_12", "prop_poolball_13", "prop_poolball_14", "prop_poolball_15", "prop_poolball_2", "prop_poolball_3", "prop_poolball_4", "prop_poolball_5", "prop_poolball_6", "prop_poolball_7", "prop_poolball_8", "prop_poolball_9", "prop_poolball_cue", "prop_swiss_ball_01", "imp_prop_bomb_ball", "vw_prop_casino_art_basketball_01a", "vw_prop_casino_art_basketball_02a", "sf_prop_sf_art_basketball_01a", "xm3_prop_xm3_balloon_01a"}
    
    function AvalancheSnow()

        
        local randomSnowLoc = v3.new(math.random(-20, 20), 65, 900)
        local AvalancheSnowHash = util.joaat(AvalancheSnowHashes[math.random(1, 2)])
        util.request_model(AvalancheSnowHash)
        local AvalancheSnow = entities.create_object(AvalancheSnowHash, randomSnowLoc, math.random(-180, 180))
        table.insert(AvalancheSnowElements, 1, AvalancheSnow)
        SET_OBJECT_TINT_INDEX(AvalancheSnow, math.random(1, 15))
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AvalancheSnow, 0, 0, 0)
        util.create_tick_handler(function()
            SHOOT_SINGLE_BULLET_BETWEEN_COORDS(Offset.x, Offset.y - 10, Offset.z, Offset.x, Offset.y, Offset.z, 0, false, util.joaat("weapon_heavysniper_mk2"), players.user_ped(), false, false, 1.0)
            --util.toast("boop")
            if Offset.z < 850 then
                return false
            end
        end)
        util.create_tick_handler(function()
            if Offset.z < 750 then
                entities.delete(AvalancheSnow)
                return false
            end

        end)
        SET_ENTITY_VELOCITY(AvalancheSnow, 0, 0, -100)

    end
    function AvalancheSnowflakes()

        
        local randomSnowLoc = v3.new(math.random(-25, 25), 65, 900)
        local AvalancheSnowflakeHashes = util.joaat(AvalancheSnowflakeHashes[math.random(1, #AvalancheSnowflakeHashes)])
        util.request_model(AvalancheSnowflakeHashes)
        local AvalancheSnow = entities.create_object(AvalancheSnowflakeHashes, randomSnowLoc, math.random(-180, 180))
        table.insert(AvalancheSnowElements, 1, AvalancheSnow)
        SET_OBJECT_TINT_INDEX(AvalancheSnow, math.random(1, 15))
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AvalancheSnow, 0, 0, 0)
            SHOOT_SINGLE_BULLET_BETWEEN_COORDS(Offset.x, Offset.y - 10, Offset.z, Offset.x, Offset.y, Offset.z, 0, false, util.joaat("weapon_heavysniper_mk2"), players.user_ped(), false, false, 1.0)
        util.create_tick_handler(function()
            if Offset.z < 750 then
                entities.delete(AvalancheSnow)
                return false
            end

        end)
        SET_ENTITY_VELOCITY(AvalancheSnow, math.random(-10, 10), 0, -100)

    end


   menu.action(myListFunMinigamesSettings, "Flappy flap", {}, "Totally not a rip off of flappy bird that allows you to play using your own car and to flap using the space key", function()
       FlappyFlapminigamestarted = 0
       if IS_CONTROL_PRESSED(0, 68) and FlappyFlapminigamestarted == 0 then
           FlappyFlapminigamestarted= 1
           util.yield(1000)
       local time = 0
       
   
       local pedm = players.user_ped()
       local playerVehicle = GET_VEHICLE_PED_IS_IN(pedm)
       local FlappyCam = CREATE_CAMERA(26379945, true)
   
       local FloorHash = util.joaat("stt_prop_stunt_landing_zone_01")
       local RoofHash = util.joaat("stt_prop_stunt_landing_zone_01")
       local Pillar = util.joaat("port_xr_cont_03")
       util.request_model(FloorHash)
       util.request_model(RoofHash)
       util.request_model(Pillar)
       
       
           local floorloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(floor, 0, -5, 0)
           local roofloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(roof, 0, 5, 0)
   
   
   
       if IS_PED_IN_VEHICLE(pedm, playerVehicle, false) then
           
   
           HARD_ATTACH_CAM_TO_ENTITY(FlappyCam, playerVehicle, 0, 0, 90, 12, 0, 0, true)
                               --                          xrot,yrot,zrot,xloc,yloc,zloc
           RENDER_SCRIPT_CAMS(true, true, 500, 1, 0, 0);
   
           local heading = 0 --GET_ENTITY_HEADING(playerVehicle)
           SET_ENTITY_VELOCITY(playerVehicle, 0, 0, 0)
           SET_ENTITY_ROTATION(playerVehicle, 0, 0, heading)
           util.yield(10)
           SET_ENTITY_VELOCITY(playerVehicle, 0, 0, 100)
           util.yield(500)
   
           
           local FloorOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, -10)
           local RoofOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 10)
   
           floor = entities.create_object(FloorHash, FloorOffset, heading)
           roof = entities.create_object(FloorHash, RoofOffset, heading)
           local roofloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(roof, 0, 5, 0)
           SET_ENTITY_COLLISION(floor, false, false)
           SET_ENTITY_COLLISION(roof, false, false)
   
           util.create_tick_handler(function ()
               util.toast("Hold Right Mouse Click few seconds to give up")
   
               SET_ENTITY_ROTATION(playerVehicle, 0, 0, heading)
   
               if IS_CONTROL_PRESSED(0, 179) then
                   --util.toast("blep")
                   SET_ENTITY_VELOCITY(playerVehicle, 0, 0, 12)
               else
                   SET_ENTITY_VELOCITY(playerVehicle, 0, 0, -7)
               end
   
               if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) or FlappyFlapminigamestarted == 0 then
                   --util.toast("boop")
                   RENDER_SCRIPT_CAMS(false, true, 500, 1, 0, 0);
                   DESTROY_CAM(FlappyCam, true)
                   FlappyFlapminigamestarted = 0
                   entities.delete(floor)
                   entities.delete(roof)
                   return false
               end
   
   
               if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) then
                   RENDER_SCRIPT_CAMS(false, true, 500, 1, 0, 0);
                   DESTROY_CAM(FlappyCam, true)
   
                   entities.delete(floor)
                   entities.delete(roof)
                   util.toast("Total score of this run : " .. time)
                   FlappyFlapminigamestarted = 0
                   return false
               end
   
   
               
   
           end)
           util.yield(500)
   util.create_tick_handler(function ()
           
       local floorloc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(floor, 0, -5, 0)
           local currLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(playerVehicle, 0, 0, 0)
       if currLoc:distance(floorloc) > 19 then
           RENDER_SCRIPT_CAMS(false, true, 500, 1, 0, 0);
           DESTROY_CAM(FlappyCam, true)
   
           entities.delete(floor)
           entities.delete(roof)
           util.toast("Total score of this run : " .. time)
           FlappyFlapminigamestarted = 0
           return false
       end
       if currLoc:distance(roofloc) > 18 then
           RENDER_SCRIPT_CAMS(false, true, 500, 1, 0, 0);
           DESTROY_CAM(FlappyCam, true)
   
           entities.delete(floor)
           entities.delete(roof)
           util.toast("Total score of this run : " .. time)
           FlappyFlapminigamestarted = 0
           return false
       end
       
   end)
   
   
           util.create_tick_handler(function ()
           
               FlappyFlapPillar()
               util.yield(500)
   
   
               if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) then
                   --util.toast("boop")
   
                   return false
               end
   
           end)
   
   
           util.create_tick_handler(function()
           
   
               time = time + 1
               util.yield(1000)
       
       
               if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) then
                   return false
               end
           end)
           
           util.create_tick_handler(function()
               util.draw_debug_text("you survived : " .. time .. "  seconds")
               SET_ENTITY_ROTATION(playerVehicle, 0, 0, heading)
   
               if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) then
                   FlappyFlapminigamestarted = 0
                   
                   return false
               end
           end)
   
   
   
   
   
           
       else
           util.toast("Player is not in a vehicle !")
       end
   
   
   else
       util.toast("Please hold right click for 5 seconds to prevent bugs. Then hold right click while you start the minigame and release, the game will start within a second :)")
   end
   end)
   
   function FlappyFlapPillar()
   
       local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
       local playerVehicle = GET_VEHICLE_PED_IS_IN(pedm)
       local heading = 0 --GET_ENTITY_HEADING(playerVehicle)
   
       
       local PillarHash = util.joaat("port_xr_cont_03")
       util.request_model(PillarHash)
   
       local randomFlappyPillarHeight = math.random(2, 14)
       PillarSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(floor, 0, 20, 5 + randomFlappyPillarHeight) -- + 2
       PillarSpawnPoint2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(floor, 0, 20, 5 + randomFlappyPillarHeight - 16.5) -- + 2 -- + 14
   
   
       local Pillar = entities.create_object(PillarHash, PillarSpawnPoint, heading)
       local Pillar2 = entities.create_object(PillarHash, PillarSpawnPoint2, heading)
       
   
       util.create_tick_handler(function()
   
           if FlappyFlapminigamestarted == 1 then
           SET_ENTITY_VELOCITY(Pillar, 0, -10, 0)
           SET_ENTITY_ROTATION(Pillar, 90, 90, heading)
           
           SET_ENTITY_VELOCITY(Pillar2, 0, -10, 0)
           SET_ENTITY_ROTATION(Pillar2, 90, 90, heading)
   
   
           if IS_CONTROL_PRESSED(0, 68) or HAS_ENTITY_COLLIDED_WITH_ANYTHING(playerVehicle) then
               --util.toast("boop")
   
               entities.delete(Pillar)
               entities.delete(Pillar2)
               FlappyFlapminigamestarted = 0
               return false
           end
           
       end
       end)
       
       
   
       
       util.yield(3500)
   
       entities.delete(Pillar)
       entities.delete(Pillar2)
   
   end



  --[[ local TronArenaElements = {}

   local TronArenaFloorLocations = {
    v3.new(0, 0, 600),
    v3.new(0, 90, 600),
    v3.new(0, -90, 600),
    v3.new(90, 0, 600),
    v3.new(-90, 0, 600),
    v3.new(90, 90, 600),
    v3.new(-90, -90, 600),
    v3.new(-90, 90, 600),
    v3.new(90, -90, 600)            }
    
   local TronBikes = {}
--   local TronBikesColoursP = {--[[red]]--28, --[[blue]]67, --[[yellow]]89, --[[green]]128}
--   local TronBikesColoursS = {--[[red]]28, --[[blue]]67, --[[yellow]]89, --[[green]]128}
--   local TronWallsColours = {--[[red]]2, --[[blue]]0, --[[yellow]]3, --[[green]]1}
--[[
menu.toggle_loop(myListFunTronSettings, "Spawn Tron Arena", {}, "Play Tron with your friends !", function()

    local ArenaFloorHash = util.joaat("ar_prop_ar_bblock_huge_04")

        if not DOES_ENTITY_EXIST(TronArenaFloor) then
            
            SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 0, 0, 603)
            for i = 1, 9, 1 do
                local ArenaFloorSpawnLoc = TronArenaFloorLocations[i]
                util.request_model(ArenaFloorHash)
                TronArenaFloor = entities.create_object(ArenaFloorHash, ArenaFloorSpawnLoc, 0)
                table.insert(TronArenaElements, 1, TronArenaFloor)
                FREEZE_ENTITY_POSITION(TronArenaFloor, true)
                entities.set_can_migrate(TronArenaFloor, false)
                SET_ENTITY_AS_MISSION_ENTITY(TronArenaFloor, true, true)
                util.yield(100)
            end

        end

   
end, function()

        for i, element in TronArenaElements do
            entities.delete(element)
        end
        TronArenaElements = {}

end)

menu.toggle_loop(myListFunTronSettings, "Spawn Tron Bikes", {"SpawnTronBikes"}, "Play Tron with your friends !", function()


    if DOES_ENTITY_EXIST(TronArenaFloor) then
        if next(TronBikes) == nil then

            for i = 1, 4, 1 do
                
                TronBikeFunc(TronBikesColoursP[i], TronBikesColoursS[i], TronWallsColours[i])
                
            end

        end
    else
        util.toast("Spawn the Arena first !")
        menu.trigger_commands('SpawnTronBikes off')
    end
    
   
end, function()

        for i, bike in TronBikes do
            entities.delete(bike)
        end
        TronBikes = {}

end)

local TronLightWallLoop = 0
local TronWalls = {}

local function TronWallSpawner(TronWallHash, SpawnOffset, Bike, WallColour, owner, ownername, wallsTable)
local canSpawnWalls = 0
if canSpawnWalls == 0 then
    local TronWall = entities.create_object(TronWallHash, SpawnOffset, 0)
    SET_OBJECT_TINT_INDEX(TronWall, TronWallsColours[WallColour])
    table.insert(wallsTable, 1, TronWall)
    FREEZE_ENTITY_POSITION(TronWall, true)
    entities.set_can_migrate(TronWall, false)
    SET_ENTITY_AS_MISSION_ENTITY(TronWall, true, true)
    local WallRot = GET_ENTITY_ROTATION(Bike, 2)
    SET_ENTITY_ROTATION(TronWall,  WallRot.x + 90, WallRot.y, WallRot.z)

    local pname
    local Player

    util.create_tick_handler(function()

        



        for k,b in pairs(TronBikes) do

            for l,p in pairs(players.list(true, true, true)) do
                local Pedm = GET_PLAYER_PED(p)
                if IS_PED_IN_VEHICLE(Pedm, b, false) then
                    Player = GET_PLAYER_PED_SCRIPT_INDEX(p)
                    pname = GET_PLAYER_NAME(p)
               
                end
            end
            
            if HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TronWall, b, 1) then
                util.toast(pname .. " has hit " .. ownername .. "'s' wall !")
                --util.toast(ownername)
                APPLY_DAMAGE_TO_PED(Player, 100000, true, 0)
                canSpawnWalls = 1
                for i, wallPart in wallsTable do
                    entities.delete(wallPart)
                end
                wallsTable = {}

                util.yield(5000)
                canSpawnWalls = 0
                return false
            end
        end

        if not DOES_ENTITY_EXIST(TronWall) then
            return false
        end
    end)

    util.create_tick_handler(function()
        util.yield(3000)
        entities.delete(TronWall)
        return false
    end)
end
end

local function TronLightWalls(pid, PlayerName, Bike, SpawnOffset, WallColour, wallsTable)

    if TronGameStarted == 1 then
        local TronWallHash = util.joaat("stt_prop_stunt_domino") --stt_prop_stunt_domino stt_prop_corner_sign_13

        util.request_model(TronWallHash)
        TronWallSpawner(TronWallHash, SpawnOffset, Bike, WallColour, pid, PlayerName, wallsTable)
        util.yield(40)
        
        
        
    end
end

function TronBikeFunc(ColourP, ColourS, WallColour)

    local TronBikeSpawnLocation = v3.new(math.random(-100, 100), math.random(-100, 100), 603)
    local TronBikeHash = util.joaat("shotaro")

    util.request_model(TronBikeHash)
    local TronBike = entities.create_vehicle(TronBikeHash, TronBikeSpawnLocation, 0)
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(TronBike)
    table.insert(TronBikes, 1, TronBike)
    set_entity_face_entity(TronBike, TronArenaElements[9], false)
    --entities.set_can_migrate(TronBike, false)
    --SET_ENTITY_AS_MISSION_ENTITY(TronBike, true, true)
    SET_VEHICLE_COLOURS(TronBike, ColourP, ColourS)

    local Player = 69420
    local pname = "John Doe"
    local wallSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TronBike, 0, 0, 0)
    local localTronWalls = {}

    util.create_tick_handler(function()
        for k,p in pairs(players.list(true, true, true)) do
            local Pedm = GET_PLAYER_PED(p)
            if IS_PED_IN_VEHICLE(Pedm, TronBike, false) then
                Player = GET_PLAYER_PED_SCRIPT_INDEX(p)
                pname = GET_PLAYER_NAME(p)
                wallSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TronBike, 0, -4, -0.5)
                --util.toast(Player)
                TronLightWalls(Player, pname, TronBike, wallSpawnOffset, WallColour, localTronWalls)
           
            end
        end

        if not DOES_ENTITY_EXIST(TronBike) then
            return false
        end
        
    end)
    
end



menu.toggle_loop(myListFunTronSettings, "Play !", {"StartTron"}, "Starts the minigame !", function()


    if next(TronBikes) ~= nil then

            TronGameStarted = 1

    else
        util.toast("Spawn the Arena and Bikes first !")
        menu.trigger_commands('StartTron off')
    end
    
   
end, function()

        for i, wall in TronWalls do
            entities.delete(wall)
        end
        TronWalls = {}

        TronLightWallLoop = 0

end) ]]



   enablemissions = menu.action(myListFunMissionsSettings, "Generate Missions", {}, "Generates the missions. This is not done automatically due to it taking time/causing lag.", function()
 
    menu.delete(enablemissions)
    --missionTest()
    --[[REQUEST_IPL("xm_siloentranceclosed_x17");
    SET_ENTITY_COORDS_NO_OFFSET(GET_VEHICLE_PED_IS_IN(players.user_ped()), 1561.562, 410.45, -48.0)
    util.yield(2000)
    util.toast(IS_IPL_ACTIVE("xm_siloentranceclosed_x17"))
    util.yield(20000)
    REMOVE_IPL("xm_siloentranceclosed_x17")--]]

    TheBigDiveMission()


end)





  menu.divider(myListFunSettings, "------")

   --Spawn Ramp
   menu.action(myListFunSettings, "Spawn Ramp", {}, "This will spawn a ramp in front of you (Works best with small vehicles)", function()

       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 20, -1)
       local hash = 2108723836
       util.request_model(hash)
       local heading = GET_ENTITY_HEADING(players.user_ped())
       local CurrentVehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
       local Ramp = entities.create_object(hash, Offset)
       local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
       --SET_ENTITY_HEADING(Ramp, heading + 90)
       SET_ENTITY_ROTATION(Ramp, rot.y, -rot.x, heading + 90)
       util.toast("Ready for take off !")

       util.yield(2000)
       entities.delete_by_handle(Ramp)
       --util.toast(CurrentVehicle)
       --util.toast("rot x :" .. rot.x)
       --util.toast("rot y :" .. rot.y)
       --util.toast("rot z :" .. rot.z)

   end)

   menu.action(myListFunSettings, "Spawn Loop", {}, "This will spawn a Loop in front of you (Works best with small vehicles)", function()

       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 50, -1)
       local BoosterOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0,80, 30)
       local BoosterOffset1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0,25, 0)
       local BoosterOffset2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0,90, 50)
       local hash = 4119906142
       util.request_model(hash)
       local heading = GET_ENTITY_HEADING(players.user_ped())
       local CurrentVehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
       local boosterhash = 4228722453
       util.request_model(boosterhash)
       local Booster = entities.create_object(boosterhash, BoosterOffset)
       local Booster1 = entities.create_object(boosterhash, BoosterOffset1)
       local Booster2 = entities.create_object(boosterhash, BoosterOffset2)
       local Loop = entities.create_object(hash, Offset)
       local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
       --SET_ENTITY_HEADING(Loop, heading + 90)
       SET_ENTITY_ROTATION(Loop, rot.y, -rot.x, heading + 90)
       SET_ENTITY_ROTATION(Booster, rot.y, -rot.x, heading + 90)
       SET_ENTITY_ROTATION(Booster1, rot.y, -rot.x, heading + 90)
       SET_ENTITY_ROTATION(Booster2, rot.y, -rot.x, heading + 90)
       util.toast("Gotta Go Fast !")

       util.yield(10000)
       entities.delete_by_handle(Loop)
       entities.delete_by_handle(Booster)
       entities.delete_by_handle(Booster1)
       entities.delete_by_handle(Booster2)
       --util.toast(CurrentVehicle)
       --util.toast("rot x :" .. rot.x)
       --util.toast("rot y :" .. rot.y)
       --util.toast("rot z :" .. rot.z)

   end)



   --Spawn Loop
   --[[menu.action(myListFunVehicleSettings, "Spawn Loop", {}, "This will spawn a Loop in front of you (Works best with small vehicles)", function()

       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 80, -1)
       local BoosterOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,10, 0)
        local hash = 4119906142
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(players.user_ped())
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(players.user_ped())
        local Loop = entities.create_object(hash, Offset)
        local boosterhash = 4228722453
        util.request_model(boosterhash)
        local Loop = entities.create_object(boosterhash, BoosterOffset)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
        --SET_ENTITY_HEADING(Loop, heading + 90)
        SET_ENTITY_ROTATION(Loop, rot.y, -rot.x, heading + 90)
        util.toast("Gotta Go Fast !")

        util.yield(20000)
        entities.delete_by_handle(Loop)
        --util.toast(CurrentVehicle)
        --util.toast("rot x :" .. rot.x)
        --util.toast("rot y :" .. rot.y)
        --util.toast("rot z :" .. rot.z)

   end)--]]



   menu.action(myListFunSettings, "Spawn Boosters", {}, "This will spawn a ring of Booster, should work on absolutely any vehicle", function()

       local pedm = players.user_ped() -- get the players model
       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 10, 0)

       local hash = 993442923
       util.request_model(hash)
       local heading = GET_ENTITY_HEADING(pedm)
       local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
       local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)

       local Booster = entities.create_object(hash, Offset)
       SET_ENTITY_ROTATION(Booster, rot.y, -rot.x, heading + 0)

       util.yield(1000)
       entities.delete_by_handle(Booster)

   end)

   menu.action(myListFunSettings, "Spawn Slowers", {}, "This will spawn a row of Slowers", function()

       local pedm = players.user_ped() -- get the players model
       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 5, -2)

       local hash = 1431235846
       util.request_model(hash)
       local heading = GET_ENTITY_HEADING(pedm)
       local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
       local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)

       local Slower = entities.create_object(hash, Offset)
       SET_ENTITY_ROTATION(Slower, rot.y, -rot.x, heading + 0)

       util.yield(1000)
       entities.delete_by_handle(Slower)

   end)

   menu.toggle_loop(myListFunSettings, "Hamsterball", {}, "Spawns a Hamsterball (Make sure only ONE hamsterball is loaded in the world to avoid bugs)", function(on)
       local hashLoop = 1768956181 --2138347493 --util.joaat("Snowball") 1768956181 -1125864094-

       local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
       local owner = players.user_ped()
       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 0, 0, -1)

       if not DOES_ENTITY_EXIST(OBJ) then
           ---------------------------------------------------------------------------------------------
           OBJ = entities.create_object(hashLoop, Offset)
           OBJ1 = entities.create_object(hashLoop, Offset)
           OBJ2 = entities.create_object(hashLoop, Offset)
           OBJ3 = entities.create_object(hashLoop, Offset)
           OBJ4 = entities.create_object(hashLoop, Offset)
           OBJ5 = entities.create_object(hashLoop, Offset)
           OBJ6 = entities.create_object(hashLoop, Offset)
           OBJ7 = entities.create_object(hashLoop, Offset)
           OBJ8 = entities.create_object(hashLoop, Offset)
           OBJ9 = entities.create_object(hashLoop, Offset)
           OBJ10 = entities.create_object(hashLoop, Offset)
           OBJ11 = entities.create_object(hashLoop, Offset)
           OBJ12 = entities.create_object(hashLoop, Offset)
           OBJ13 = entities.create_object(hashLoop, Offset)
           OBJ14 = entities.create_object(hashLoop, Offset)
           OBJ15 = entities.create_object(hashLoop, Offset)
           OBJ16 = entities.create_object(hashLoop, Offset)
           OBJ17 = entities.create_object(hashLoop, Offset)
           ---------------------------------------------------------------------------------------------
           ---------------------------------------------------------------------------------------------
           SET_ENTITY_ROTATION(OBJ, 0, 0, 0)
           SET_ENTITY_ROTATION(OBJ1, 0, 0, 10)
           SET_ENTITY_ROTATION(OBJ2, 0, 0, 20)
           SET_ENTITY_ROTATION(OBJ3, 0, 0, 30)
           SET_ENTITY_ROTATION(OBJ4, 0, 0, 40)
           SET_ENTITY_ROTATION(OBJ5, 0, 0, 50)
           SET_ENTITY_ROTATION(OBJ6, 0, 0, 60)
           SET_ENTITY_ROTATION(OBJ7, 0, 0, 70)
           SET_ENTITY_ROTATION(OBJ8, 0, 0, 80)
           SET_ENTITY_ROTATION(OBJ9, 0, 0, 90)
           SET_ENTITY_ROTATION(OBJ10, 0, 0, 100)
           SET_ENTITY_ROTATION(OBJ11, 0, 0, 110)
           SET_ENTITY_ROTATION(OBJ12, 0, 0, 120)
           SET_ENTITY_ROTATION(OBJ13, 0, 0, 130)
           SET_ENTITY_ROTATION(OBJ14, 0, 0, 140)
           SET_ENTITY_ROTATION(OBJ15, 0, 0, 150)
           SET_ENTITY_ROTATION(OBJ16, 0, 0, 160)
           SET_ENTITY_ROTATION(OBJ17, 0, 0, 170)
           ---------------------------------------------------------------------------------------------

       end

       --util.toast("loop")


   end, function()
       entities.delete(OBJ)
       entities.delete(OBJ1)
       entities.delete(OBJ2)
       entities.delete(OBJ3)
       entities.delete(OBJ4)
       entities.delete(OBJ5)
       entities.delete(OBJ6)
       entities.delete(OBJ7)
       entities.delete(OBJ8)
       entities.delete(OBJ9)
       entities.delete(OBJ10)
       entities.delete(OBJ11)
       entities.delete(OBJ12)
       entities.delete(OBJ13)
       entities.delete(OBJ14)
       entities.delete(OBJ15)
       entities.delete(OBJ16)
       entities.delete(OBJ17)
   end)

   menu.toggle_loop(myListFunSettings, "Giant Hamsterball", {}, "Spawns a Giant Hamsterball (Make sure only ONE Giant hamsterball is loaded in the world to avoid bugs)", function(on)
       local hashLoop = 430430733 --2138347493 --util.joaat("Snowball") 1768956181 -1125864094- 234083239 430430733

       local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
       local owner = players.user_ped()
       local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 0, 0, 37)
       GHexist = 0

       if not DOES_ENTITY_EXIST(gOBJ) and GHexist == 0 then
           ---------------------------------------------------------------------------------------------
           GHexist = 1
           gOBJ = entities.create_object(hashLoop, Offset)
           gOBJ1 = entities.create_object(hashLoop, Offset)
           gOBJ2 = entities.create_object(hashLoop, Offset)
           gOBJ3 = entities.create_object(hashLoop, Offset)
           gOBJ4 = entities.create_object(hashLoop, Offset)
           gOBJ5 = entities.create_object(hashLoop, Offset)
           gOBJ6 = entities.create_object(hashLoop, Offset)
           gOBJ7 = entities.create_object(hashLoop, Offset)
           gOBJ8 = entities.create_object(hashLoop, Offset)
           gOBJ9 = entities.create_object(hashLoop, Offset)
           gOBJ10 = entities.create_object(hashLoop, Offset)
           gOBJ11 = entities.create_object(hashLoop, Offset)
           gOBJ12 = entities.create_object(hashLoop, Offset)
           gOBJ13 = entities.create_object(hashLoop, Offset)
           gOBJ14 = entities.create_object(hashLoop, Offset)
           gOBJ15 = entities.create_object(hashLoop, Offset)
           gOBJ16 = entities.create_object(hashLoop, Offset)
           gOBJ17 = entities.create_object(hashLoop, Offset)
           ---------------------------------------------------------------------------------------------
           ---------------------------------------------------------------------------------------------
           SET_ENTITY_ROTATION(gOBJ, 0, 90, 0)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ1, 0, 90, 20)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ2, 0, 90, 40)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ3, 0, 90, 60)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ4, 0, 90, 80)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ5, 0, 90, 100)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ6, 0, 90, 120)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ7, 0, 90, 140)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ8, 0, 90, 160)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ9, 0, 90, 180)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ10, 0, 90, 200)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ11, 0, 90, 220)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ12, 0, 90, 240)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ13, 0, 90, 260)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ14, 0, 90, 280)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ15, 0, 90, 300)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ16, 0, 90, 320)
           util.yield(100)
           SET_ENTITY_ROTATION(gOBJ17, 0, 90, 340)
           util.yield(100)
           ---------------------------------------------------------------------------------------------

       end

       --util.toast("loop")


   end, function()
       GHexist = 0
       entities.delete(gOBJ)
       entities.delete(gOBJ1)
       entities.delete(gOBJ2)
       entities.delete(gOBJ3)
       entities.delete(gOBJ4)
       entities.delete(gOBJ5)
       entities.delete(gOBJ6)
       entities.delete(gOBJ7)
       entities.delete(gOBJ8)
       entities.delete(gOBJ9)
       entities.delete(gOBJ10)
       entities.delete(gOBJ11)
       entities.delete(gOBJ12)
       entities.delete(gOBJ13)
       entities.delete(gOBJ14)
       entities.delete(gOBJ15)
       entities.delete(gOBJ16)
       entities.delete(gOBJ17)
   end)




--menu.toggle(myListVehicle, "Toggle!", {}, "Description of Toggle", function (on_change)

--if on_change == true then

-- end


--end)
--      min, max, default, increment
--menu.click_slider(myListVehicle,"Slider", {}, "description of Slider", 0, 10000, 10, 10, function (slider)
--    util.toast('Slided')
--end)


--Spawns a car
--menu.click_slider(myListVehicle,"Spawn Vehicle", {}, "Spawns the selected vehicle", 1, 10, 1, 1, function (SpawnVehicleSlider)
--local vehicles = { "deluxo", "rcbandito", "", "", "", "", "", "", "" ,""}


--local hash = util.joaat(vehicles[SpawnVehicleSlider])
--Streammodel(hash, 2000)
--local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 3, 0)
--entities.create_vehicle(hash, pos, 0)
--end)



--local SpawnableVehicles = { "Deluxo", "RC Bandito", "Nightmare Issi", "Z-Type", "Bulldozer", "Tropic", "Weaponised Buzzard", "F-160 Raiju", "Inductor" ,"Dump", "Molotok"}
--menu.textslider(myListVehicleSpawner, "Spawn Vehicle", {}, "Spawns the selected vehicle", SpawnableVehicles, function (SpawnVehicleSlider, index, opt)

--    local vehicles = { "deluxo", "rcbandito", "issi6", "ztype", "bulldozer", "tropic2", "buzzard", "raiju", "inductor" ,"dump", "molotok"}

--    local hash = util.joaat(vehicles[SpawnVehicleSlider])
--    Streammodel(hash, 2000)
--    local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 3, 0)
--    local Prot = GET_ENTITY_HEADING(players.user_ped())
--    local spawnedCar = entities.create_vehicle(hash, pos, GET_ENTITY_HEADING(Prot))


--local vehicle = Ped.getVehicle(myPed)
--    SET_PED_INTO_VEHICLE(ourPlayer, spawnedCar, -1)
--Vehicles.drive(hash)

--end)



-- its better to put both of the tables outside the onchange function so u don't create ur 'vehicles' table every onchange that is called
local SpawnableVehicles = {"Deluxo", "RC Bandito", "Nightmare Issi", "Z-Type", "Bulldozer", "Tropic", "Weaponised Buzzard", "F-160 Raiju", "Inductor" ,"Dump", "Molotok"}
local vehicles = {"deluxo", "rcbandito", "issi6", "ztype", "bulldozer", "tropic2", "buzzard", "raiju", "inductor" ,"dump", "molotok"}

-- just changed the root to be here u can pick what u want
myListVehicleSpawner:textslider("Spawn Vehicle", {}, "Spawns the selected vehicle", SpawnableVehicles, function (index, name) -- changed these value names to be more sense
    local hash = util.joaat(vehicles[index])
    util.request_model(hash) -- its better to call as less functions as possible because more performance
    local offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 3, 0) -- changed the name to be offset u can still pick pos but i like offset more because it tells u what it is
    local heading = GET_ENTITY_HEADING(players.user_ped()) -- changed to heading same reason as above
    local spawnedCar = entities.create_vehicle(hash, offset, heading) -- only put heading in here because you already got the heading of ur own ped and there is no need to get the heading of the heading you already got
    SET_PED_INTO_VEHICLE(players.user_ped(), spawnedCar, -1)
end)




--Horn Boost
menu.toggle_loop(myListVehicleSettings, "Toggle Horn Boost !", {}, "Horn Boost On/Off", function (on_change)
    local p = GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
    if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) and IS_PLAYER_PRESSING_HORN(p) then
        local car = GET_VEHICLE_PED_IS_IN(players.user_ped())
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(car, 1, 0, 8, 0, 0, true, true, 1)
    end
end, function()

end)

menu.toggle_loop(myListVehicleSettings, "Toggle Stick to Walls/Roofs !", {}, "Stick to Walls/Roofs On/Off", function (on_change)
    if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
        local car = GET_VEHICLE_PED_IS_IN(players.user_ped())
        --Took that from LanceScript
        local vel = GET_ENTITY_VELOCITY(car)
        vel['z'] = -vel['z']
        APPLY_FORCE_TO_ENTITY(car, 2, 0, 0, -50 -vel['z'], 0, 0, 0, 0, true, false, true, false, true)
    end
end, function()

end)

--Gravity 0 Vehicle
menu.toggle(myListVehicleSettings, "Toggle Zero Gravity !", {}, "Zero Gravity On/Off", function (on_change)
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
    local address = entities.handle_to_pointer(current_vehicle_handle_or_ptr)
    Get_Entity(current_vehicle_handle_or_ptr)
    if on_change == true then
        entities.set_gravity(address, 0)
    else
        entities.set_gravity(address, 9.8)
    end
end)

--Detaches wheels
menu.action(myListVehicleSettings, 'Detach wheels', {''}, 'Button that detaches wheels', function ()
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 0)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 1)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 2)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 3)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 4)
    entities.detach_wheel( current_vehicle_handle_or_ptr, 5)
end)

menu.action(myListVehicleSettings, 'Burst tyres', {''}, 'Button that burst wheels tyres', function ()
    local  pname = GET_PLAYER_NAME(pid)
    --to do it better it would be good to specatate them first as things tend to work better that way
    --menu.trigger_commands('spectate'..pname)
    --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
    --local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
    --if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
    --local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
    --if DOES_ENTITY_EXIST(vmod) and Get_Entity(vmod) then --get control
    SET_VEHICLE_TYRES_CAN_BURST(current_vehicle_handle_or_ptr, true)
    for wheelId = 0, 7 do SET_VEHICLE_TYRE_BURST(current_vehicle_handle_or_ptr, wheelId, true, 1000.0) end
    --end
    --end
end)





---------------------------
--Spawn Vehicle Settings
---------------------------

menu.divider(myListVehicle, "------")


--Freeze driving vehicle
menu.action(myListVehicle, "Freeze Vehicle ?", {}, "Freeze Current Vehicle On/Off", function (on_change)
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
    FREEZE_ENTITY_POSITION(current_vehicle_handle_or_ptr, true)
    util.toast("Vehicle frozen !")
end)

menu.action(myListVehicle, "Unfreeze Vehicle ?", {}, "This will unfreeze the current vehicle", function(on)
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)

    FREEZE_ENTITY_POSITION(current_vehicle_handle_or_ptr, false)
    util.toast("Vehicle unfrozen !")
end)


-- God mode driving vehicle
menu.action(myListVehicle, "Vehicle Godmode ?", {}, "This will make the vehicle unable to take damage.", function(on)
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)

    SET_ENTITY_INVINCIBLE(current_vehicle_handle_or_ptr, true)
    util.toast("The vehicle is now invincible !")


end)

menu.action(myListVehicle, "RemoveVehicle Godmode ?", {}, "This will make the vehicle able to take damage.", function(on)
    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)

    SET_ENTITY_INVINCIBLE(current_vehicle_handle_or_ptr, false)
    util.toast("The vehicle can now be destroyed !")

end)

--[[local KittyRingSettings = {"Default", "Invincible"}

    menu.textslider(myListFunSettings, "Spawn Kitties", {}, "Spawns a ring of kitties with selected settings", KittyRingSettings, function (index, name) -- changed these value names to be more sense


        local hashKitty = util.joaat("A_C_Cat_01")
        --local pedm = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        local pos1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 8, 0)
        local pos2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 8, 0, 0)
        local pos3 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, -8, 0)
        local pos4 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -8, 0, 0)

        local pos5 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 2.5, 2.5, 0)
        local pos6 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -2.5, 2.5, 0)
        local pos7 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 2.5, -2.5, 0)
        local pos8 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -2.5, -2.5, 0)



            if name == "Default" then

                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos1, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos2, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos3, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos4, 0), false)

                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos5, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos6, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos7, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos8, 0), false)

            elseif name == "Invincible" then

                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos1, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos2, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos3, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos4, 0), true)

                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos5, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos6, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos7, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashKitty, pos8, 0), true)

            end
    end)



    local DoggyRingSettings = {"Default", "Invincible"}

    menu.textslider(myListFunSettings, "Spawn Doggies", {}, "Spawns a ring of doggies with selected settings", DoggyRingSettings, function (index, name) -- changed these value names to be more sense


        local hashDoggy = util.joaat("a_c_chop")
        util.request_model(hashDoggy)
        --local pedm = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        local pos1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 8, 0)
        local pos2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 8, 0, 0)
        local pos3 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, -8, 0)
        local pos4 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -8, 0, 0)

        local pos5 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 2.5, 2.5, 0)
        local pos6 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -2.5, 2.5, 0)
        local pos7 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 2.5, -2.5, 0)
        local pos8 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -2.5, -2.5, 0)



            if name == "Default" then

                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos1, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos2, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos3, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos4, 0), false)

                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos5, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos6, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos7, 0), false)
                   SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos8, 0), false)

            elseif name == "Invincible" then

                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos1, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos2, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos3, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos4, 0), true)

                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos5, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos6, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos7, 0), true)
                SET_ENTITY_INVINCIBLE(entities.create_ped(0, hashDoggy, pos8, 0), true)

            end
    end)--]]

local SelectedWildAnimal
local SelectedPetAnimal

-----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    ----------------------------------WILD
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------

    menu.action(myListFunAnimalsWildSettings, "Spawn Rats", {}, "Spawns a random ammount of rats near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Rat")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Rabbits", {}, "Spawns a random ammount of rabbits near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Rabbit_01")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Giant Rabbits", {}, "Spawns a random ammount of giant rabbits near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Rabbit_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Kitties", {}, "Spawns a random ammount of kitties near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Cat_01")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Poodles", {}, "Spawns a random ammount of poodles near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Poodle")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Westies", {}, "Spawns a random ammount of westies near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Westy")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Pugs", {}, "Spawns a random ammount of pugs near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Pug")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Zombie Pugs", {}, "Spawns a random ammount of zombie pugs near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Pug_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Rottweilers", {}, "Spawns a random ammount of rottweilers near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Rottweiler")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Retrievers", {}, "Spawns a random ammount of retrievers near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Retriever")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Shepherds", {}, "Spawns a random ammount of shepherds near you", function ()

        SelectedWildAnimal = util.joaat("A_C_shepherd")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Huskies", {}, "Spawns a random ammount of huskies near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Husky")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Coyotes", {}, "Spawns a random ammount of coyotes near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Coyote")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Zombie Coyotes", {}, "Spawns a random ammount of zombie coyotes near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Coyote_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Mountain Lions", {}, "Spawns a random ammount of mountain lions near you", function ()

        SelectedWildAnimal = util.joaat("A_C_MtLion")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Zombie Mountain Lions", {}, "Spawns a random ammount of zombie mountain lions near you", function ()

        SelectedWildAnimal = util.joaat("A_C_MtLion_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Panthers", {}, "Spawns a random ammount of panthers near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Panther")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Rhesuses", {}, "Spawns a random ammount of rhesuses near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Rhesus")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Chimps", {}, "Spawns a random ammount of chimps near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Chimp_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Pigs", {}, "Spawns a random ammount of pigs near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Pig")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Boars", {}, "Spawns a random ammount of boars near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Boar")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn zombie boars", {}, "Spawns a random ammount of zombie boars near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Boar_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Cows", {}, "Spawns a random ammount of cows near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Cow")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Deers", {}, "Spawns a random ammount of deers near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Deer")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Zombie Deers", {}, "Spawns a random ammount of zombie deers near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Deer_02")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Fishies", {}, "Spawns a random ammount of fishies near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Fish")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Stingrays", {}, "Spawns a random ammount of stingrays near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Stingray")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Dolphins", {}, "Spawns a random ammount of dolphins near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Dolphin")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Hammerhead Sharks", {}, "Spawns a random ammount of hammerhead sharks near you", function ()

        SelectedWildAnimal = util.joaat("A_C_SharkHammer")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Tiger Sharks", {}, "Spawns a random ammount of tiger sharks near you", function ()

        SelectedWildAnimal = util.joaat("A_C_SharkTiger")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Killer Whales", {}, "Spawns a random ammount of killer whales near you", function ()

        SelectedWildAnimal = util.joaat("A_C_KillerWhale")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Hump Back Whales", {}, "Spawns a random ammount of hump back whales near you", function ()

        SelectedWildAnimal = util.joaat("A_C_HumpBack")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Pigeons", {}, "Spawns a random ammount of pigeons near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Pigeon")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Crows", {}, "Spawns a random ammount of crows near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Crow")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Hens", {}, "Spawns a random ammount of hens near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Hen")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Seagulls", {}, "Spawns a random ammount of seagulls near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Seagull")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Chickehawks", {}, "Spawns a random ammount of chickenhawks near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Chickenhawk")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    menu.action(myListFunAnimalsWildSettings, "Spawn Cormorants", {}, "Spawns a random ammount of cormorants near you", function ()

        SelectedWildAnimal = util.joaat("A_C_Cormorant")
        SpawnWildAnimal(SelectedWildAnimal)

    end)

    local PetNamesList = {"Ako", "Niko", "Izika", "Whiskers", "Nina", "Caramel", "Leonardo", "Jack", "Doodle", "Sonic", "Mario", "Sakuro", "Johnathan", "Therese", "Asuka", "Rei", "Hanna", "Dawn", "Sunshine", "Midnight", "Apauline", "Ernest", "Charles", "Sugar", "Squishy", "boo", "Peepo", "Raphael", "Sebastian", "Orlando", "Alyssa", "Yannis", "Joshua", "Peter", "Soup", "Dracula", "Alucard", "teemo", "yuki", "daboo", "pashoo", "squat", "Felix", "Lola", "Tigris", "Isoa", "Hannah", "Capucine", "Minette", "Tamagochi", "Pikachu", "Eevee", "Evely", "Evelyn", "Amygale"}

    function SpawnWildAnimal (SelectedWildAnimal)

        local AnimalHash = SelectedWildAnimal
        util.request_model(AnimalHash)
        local pedm = players.user_ped()

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local randomWildAnimalNumber = math.random(1, 30)

        for i = randomWildAnimalNumber, 0, -1 do
            radius = math.random(8, 22)
            randomWildAnimalNumber = math.random(1, 30)
            SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
            local Animal = entities.create_ped(28, AnimalHash, SpawnOffset, 0)
        end

    end

    function SpawnPetAnimal (SelectedPetAnimal, Target)

        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        local pedm = Target

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)


        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, 0)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(PetAnimal)



        util.create_tick_handler(function()

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
            TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                return false
            end
        end)

        util.create_tick_handler(function()

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                util.toast("RIP " .. PetNamesList[math.random(1, #PetNamesList)] .. " :'(")
                return false
            end
        end)

    end





    menu.divider(myListFunSettings, "------")

    --[[menu.action(myListFunAnimalsPetSettings, "Kitty Friend", {}, "Spawns a kitty friend that will follow you", function(on)

        local Kitty = util.joaat("A_C_Cat_01")
        util.request_model(Kitty)
        local pedm = players.user_ped()
        local radius = 5
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local Kitty_pet = entities.create_ped(28, Kitty, SpawnOffset, 0)
        entities.set_can_migrate(Kitty_pet, false)
        SET_PED_COMPONENT_VARIATION(Kitty_pet, 0, 0, 1, 0)
        --SET_ENTITY_INVINCIBLE(Kitty_pet, true)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(Kitty_pet)

        util.create_tick_handler(function()

                local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
                SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Kitty_pet, true)
                TASK_GO_TO_COORD_ANY_MEANS(Kitty_pet, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
                local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Kitty_pet, 0, 0, 0)
                util.yield(1500)

                if IS_ENTITY_DEAD(Kitty_pet) then
                    entities.delete(Kitty_pet)
                    util.toast("RIP :'(")
                    return false
                end
        end)

    end)


    menu.action(myListFunAnimalsPetSettings, "Doggy Friend", {}, "Spawns a Doggy friend that will follow you", function(on)

        local Doggy = util.joaat("a_c_chop")
        util.request_model(Doggy)
        local pedm = players.user_ped()
        local radius = 5
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local Doggy_pet = entities.create_ped(28, Doggy, SpawnOffset, 0)
        entities.set_can_migrate(Doggy_pet, false)
        SET_PED_COMPONENT_VARIATION(Doggy_pet, 0, 0, 1, 0)
        --SET_ENTITY_INVINCIBLE(Doggy_pet, true)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(Doggy_pet)

        util.create_tick_handler(function()

                local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
                SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Doggy_pet, true)
                TASK_GO_TO_COORD_ANY_MEANS(Doggy_pet, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
                local DoggyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Doggy_pet, 0, 0, 0)
                util.yield(3500)

                if IS_ENTITY_DEAD(Doggy_pet) then
                    entities.delete(Doggy_pet)
                    util.toast("RIP :'(")
                    return false
                end
        end)

    end)--]]


    --menu.divider(myListFunSettings, "------")

    local myListFunVehicleSettings = menu.list(myListFunSettings, "Vehicle", {}, "Fun Vehicle Options")
    

    --local SimulatePlayerInputTimerMax = 600
    local SimulatePlayerInputTimer = 1000
    local SimulatePlayerInputTimerMax = 1000
    --local myListFunBombVan = menu.list(myListFunSettings, "Bomb Van", {}, "Bomb Van Options")
    myListFunSettings:action("Bomb Van", {}, "Spawns van contening a bomb (Right click to detonate prematuraly)", function () -- changed these value names to be more sense





        local hash = util.joaat("speedo2")
        util.request_model(hash) -- its better to call as less functions as possible because more performance
        local offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0) -- changed the name to be offset u can still pick pos but i like offset more because it tells u what it is
        local heading = GET_ENTITY_HEADING(players.user_ped()) -- changed to heading same reason as above
        local spawnedCar = entities.create_vehicle(hash, offset, heading) -- only put heading in here because you already got the heading of ur own ped and there is no need to get the heading of the heading you already got
        SET_ENTITY_INVINCIBLE(spawnedCar, false)
        SET_PED_INTO_VEHICLE(players.user_ped(), spawnedCar, -1)
        SimulatePlayerInputTimer = SimulatePlayerInputTimerMax
        SET_VEHICLE_ENGINE_ON(spawnedCar, true, true, true)

        util.create_tick_handler(function(SimulatePlayerInput)
            SIMULATE_PLAYER_INPUT_GAIT(players.user_ped(), 1, 100, 1, 1, 0) --Player will go forward for 100ms
            util.toast('[Right Click] to Detonate !')
            --SimulatePlayerInputTimer = SimulatePlayerInputTimer - 1
            --util.draw_centred_text(SimulatePlayerInputTimer)
            local Bomboffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(spawnedCar, 0, 0, 0)
            if SimulatePlayerInputTimer < 1 then
                --USE_FX_ASSET("scr_xm_orbital")
                ADD_EXPLOSION(Bomboffset.x, Bomboffset.y, Bomboffset.z, 59, 1, true, false, 1.0, false)
                ANIMPOSTFX_PLAY("FocusIn", 0, true)
                PLAY_SOUND_FROM_ENTITY(-1, "DLC_XM_Explosions_Orbital_Cannon", players.user_ped(), 0, true, false)
                util.yield(1000)
                entities.delete_by_handle(spawnedCar)
                ANIMPOSTFX_STOP("FocusIn", 0, true)

                return false
            end
            if IS_CONTROL_PRESSED(0, 68) then
                SimulatePlayerInputTimer = 0
            end
        end)

        util.create_tick_handler(function(HonkSpam)
            START_VEHICLE_HORN(spawnedCar, 300, 1330140418, false)
            util.yield(500)
        end)


    end)

    local myListFunSquadron = menu.list(myListFunSettings, "Plane Squadron", {}, "Plane Squadron Options")



    

    local EpicJumpSettings = {"Low", "Medium", "High", "Very High"}

    menu.textslider(myListFunSettings, "Epic Plane Jump", {}, "Jump out from a plane ! (If on foot : a Toreador will be given. If in a vehicle : You will be teleported in the plane with your vehicle; It may be buggy a little if using your own car )", EpicJumpSettings, function(index, name)


        local SpawnHeight = 0

        if name == "Low" then
            SpawnHeight = 100
        end

        if name == "Medium" then
            SpawnHeight = 250
        end

        if name == "High" then
            SpawnHeight = 500
        end

        if name == "Very High" then
            SpawnHeight = 1000
        end



        local pedm = players.user_ped() -- get the players model
        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)

        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            --get the vehicle they are in
            Get_Entity(vmod) --get control
        end
        --util.toast("Party mode ON !")

        local PlaneHash = 368211810 --Cargoplane
        local CarHash = 1455990255 --Stromberg 886810209 --Toreador 1455990255
        util.request_model(PlaneHash)
        util.request_model(CarHash)
        local heading = GET_ENTITY_HEADING(pedm)

        local PlaneSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, SpawnHeight)
        local CarSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, SpawnHeight + 4) --104

        local Plane = entities.create_vehicle(PlaneHash, PlaneSpawnLoc, heading)
        --SET_ENTITY_HEADING(Plane, heading)
        SET_ENTITY_INVINCIBLE(Plane, true)
        local Car
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then
            Car = entities.get_user_vehicle_as_handle()
            SET_ENTITY_HEADING(Car, heading + 180)
            SET_ENTITY_VELOCITY(Car, 0, 100, 0)
        else
            Car = entities.create_vehicle(CarHash, CarSpawnLoc, 0)
            SET_ENTITY_HEADING(Car, heading + 180)
            SET_PED_INTO_VEHICLE(pedm, Car, -1)
        end
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Plane, 1, 0, 100, 0, true, true, true, true)

        util.yield(1)
        SET_ENTITY_COORDS(Car, CarSpawnLoc.x, CarSpawnLoc.y, CarSpawnLoc.z, false, false, false, false)
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Car, 1, 0, -100, 0, true, true, true, true)

        local Timer = 350
        util.create_tick_handler(function()
            Timer = Timer - 1
            util.draw_centred_text("You can jump in : " .. Timer)

            local currPlaneLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Plane, 0, 0, 0)
            local currPlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)

            if currPlaneLoc:distance(currPlayerLoc) > 300.0 then
                entities.delete(Plane)
                return false
            end

            if Timer < 0 then
                SET_VEHICLE_DOOR_OPEN(Plane, 2, false, false)

            end
        end)



        --local doors = GET_NUMBER_OF_VEHICLE_DOORS(Plane)
        --util.toast(doors)



    end)

    local SquadronPlane = util.joaat("Lazer")
    local slowPlaneOffset = 0
    local slowPlaneSpeedDecrease = 0

    local JetSquadronSettings = {"Lazer",--[["Raiju",--]] "V-65 Molotok", "Pyro", "B-11 Strikeforce", "Seabreeze", "Howard NX-25", "Besra", "LF-22 Starling", "Rogue", "Alpha-Z1", "Mallard", "Nimbus", "Luxor Deluxe", "Mogul", "Streamer216", "Vestra", "Cuban 800", "Dodo", "Velum", "Mammatus", "Duster", "Ultralight"}
    local JetSquadronRealNames = {"Lazer",--[["raiju",--]] "molotok", "pyro", "strikeforce", "seabreeze" , "howard", "besra", "starling", "rogue", "Stunt", "alphaz1", "nimbus", "luxor2", "mogul", "streamer216", "vestra", "cuban800", "dodo", "velum", "mammatus", "duster", "microlight"}

    local PlayerSquadronPlane = util.joaat("Lazer")
    local hashJet
    menu.textslider(myListFunSquadron, "Plane Type", {}, "Select your type of plane, if you want a plane that's not in here simply get inside the plane yourself and click this button again regardless of the selected plane", JetSquadronSettings, function (index, name)

        local pedm = players.user_ped()

        if IS_PED_IN_ANY_PLANE(pedm) then
            local name = GET_VEHICLE_PED_IS_IN(pedm, true)
            if IS_VEHICLE_MODEL(name, 621481054) then
                hashJet = util.joaat("luxor")

            elseif IS_VEHICLE_MODEL(name, 1058115860) then
                hashJet = util.joaat("jet")
            elseif IS_VEHICLE_MODEL(name, 368211810) then
                hashJet = util.joaat("cargoplane")
            elseif IS_VEHICLE_MODEL(name, 2336777441) then
                hashJet = util.joaat("cargoplane2")
            elseif IS_VEHICLE_MODEL(name, 1981688531) then
                hashJet = util.joaat("titan")
            elseif IS_VEHICLE_MODEL(name, 165154707) then
                hashJet = util.joaat("Miljet")
            elseif IS_VEHICLE_MODEL(name, 2176659152) then
                hashJet = util.joaat("avenger")
            elseif IS_VEHICLE_MODEL(name, 408970549) then
                hashJet = util.joaat("avenger2")
            elseif IS_VEHICLE_MODEL(name, 3868033424) then
                hashJet = util.joaat("avenger3")
            elseif IS_VEHICLE_MODEL(name, 4225674290) then
                hashJet = util.joaat("avenger4")
            elseif IS_VEHICLE_MODEL(name, 447548909) then
                hashJet = util.joaat("volatol")
            elseif IS_VEHICLE_MODEL(name, 3929093893) then
                hashJet = util.joaat("alkonost")
            elseif IS_VEHICLE_MODEL(name, 1077420264) then
                hashJet = util.joaat("velum2")
            elseif IS_VEHICLE_MODEL(name, 970385471) then
                hashJet = util.joaat("hydra")
            elseif IS_VEHICLE_MODEL(name, 4262088844) then
                hashJet = util.joaat("bombushka")
            elseif IS_VEHICLE_MODEL(name, 1043222410) then
                hashJet = util.joaat("tula")
            elseif IS_VEHICLE_MODEL(name, 1036591958) then
                hashJet = util.joaat("nokota")
            elseif IS_VEHICLE_MODEL(name, 239897677) then
                hashJet = util.joaat("raiju")
            elseif IS_VEHICLE_MODEL(name, 3650256867) then
                hashJet = util.joaat("cuban800")
            elseif IS_VEHICLE_MODEL(name, 970356638) then
                hashJet = util.joaat("duster")
            elseif IS_VEHICLE_MODEL(name, 2172210288) then
                hashJet = util.joaat("Stunt")
            elseif IS_VEHICLE_MODEL(name, 2548391185) then
                hashJet = util.joaat("mammatus")
            elseif IS_VEHICLE_MODEL(name, 2621610858) then
                hashJet = util.joaat("velum")
            elseif IS_VEHICLE_MODEL(name, 3080461301) then
                hashJet = util.joaat("Shamal")
            elseif IS_VEHICLE_MODEL(name, 3013282534) then
                hashJet = util.joaat("Lazer")
            elseif IS_VEHICLE_MODEL(name, 1341619767) then
                hashJet = util.joaat("vestra")
            elseif IS_VEHICLE_MODEL(name, 1824333165) then
                hashJet = util.joaat("besra")
            elseif IS_VEHICLE_MODEL(name, 3393804037) then
                hashJet = util.joaat("dodo")
            elseif IS_VEHICLE_MODEL(name, 3080673438) then
                hashJet = util.joaat("luxor2")
            elseif IS_VEHICLE_MODEL(name, 2999939664) then
                hashJet = util.joaat("nimbus")
            elseif IS_VEHICLE_MODEL(name, 3287439187) then
                hashJet = util.joaat("howard")
            elseif IS_VEHICLE_MODEL(name, 2771347558) then
                hashJet = util.joaat("alphaz1")
            elseif IS_VEHICLE_MODEL(name, 3902291871) then
                hashJet = util.joaat("seabreeze")
            elseif IS_VEHICLE_MODEL(name, 1565978651) then
                hashJet = util.joaat("molotok")
            elseif IS_VEHICLE_MODEL(name, 2594093022) then
                hashJet = util.joaat("starling")
            elseif IS_VEHICLE_MODEL(name, 2531412055) then
                hashJet = util.joaat("microlight")
            elseif IS_VEHICLE_MODEL(name, 3319621991) then
                hashJet = util.joaat("rogue")
            elseif IS_VEHICLE_MODEL(name, 2908775872) then
                hashJet = util.joaat("pyro")
            elseif IS_VEHICLE_MODEL(name, 3545667823) then
                hashJet = util.joaat("mogul")
            elseif IS_VEHICLE_MODEL(name, 1692272545) then
                hashJet = util.joaat("strikeforce")
            elseif IS_VEHICLE_MODEL(name, 191916658) then
                hashJet = util.joaat("streamer216")
            end

            util.toast("You are inside a plane, it will be used instead of the plane you clicked on !")
        else
            SquadronPlane = util.joaat(JetSquadronRealNames[index])
            util.toast(JetSquadronSettings[index] .. " selected !")
            hashJet=SquadronPlane
        end

        if index >= 7 then
            slowPlaneOffset = 20
            slowPlaneSpeedDecrease = 0.2
        else
            slowPlaneOffset = 0
            slowPlaneSpeedDecrease = 0
        end

    end)


    menu.toggle_loop(myListFunSquadron, "Plane Escort !", {}, "Spawns planes that will follow you (Please wait for the planes to catch up before you perfom maneuvers to prevent a funny bug) Protip : Pitchdown while they are catching up in slow planes to prevent said funny bug", function(on)

        local heading = GET_ENTITY_HEADING(players.user_ped())

        --util.toast(hashJet)

        --seabreeze:3902291871 --Lazer:3013282534 --raiju:239897677
        local hashTarget = 1082797888 --:1082797888
        local PlayerhashJet = PlayerSquadronPlane --seabreeze:3902291871 --Lazer:3013282534 --raiju:239897677
        local hashPilot = 2872052743 --S_M_Y_Pilot_01:2872052743
        util.request_model(hashJet)
        util.request_model(hashTarget)
        local aJetSpeed
        local bJetSpeed
        local cJetSpeed
        local dJetSpeed
        --CREATE_PED_INSIDE_VEHICLE
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local owner = players.user_ped()
        local PlayerJetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 0, 0, 200)
        local aJetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, -50, -50, 200) --200
        local bJetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 50, -50, 200)
        local cJetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, -50, -100 - slowPlaneOffset, 200)
        local dJetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 50, -100 - slowPlaneOffset, 200)
        local aJetAimLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, -20, 0, 0)
        local bJetAimLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 20, 0, 0)
        local cJetAimLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, -40, -40 - slowPlaneOffset, 0) --200
        local dJetAimLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 40, -40 - slowPlaneOffset, 0) --200

        if not DOES_ENTITY_EXIST(PlayerJet) then

            if IS_PED_IN_ANY_PLANE(pedm) then
                PlayerJet = GET_VEHICLE_PED_IS_IN(pedm, true)
                SET_ENTITY_COORDS_NO_OFFSET(PlayerJet, PlayerJetOffset.x, PlayerJetOffset.y, PlayerJetOffset.z, false, false, false)
            else
                PlayerJet = entities.create_vehicle(hashJet, PlayerJetOffset, heading)

            end

            aTarget = entities.create_object(hashTarget, aJetAimLoc)
            bTarget = entities.create_object(hashTarget, bJetAimLoc)
            cTarget = entities.create_object(hashTarget, cJetAimLoc)
            dTarget = entities.create_object(hashTarget, dJetAimLoc)

            SET_ENTITY_COLLISION(aTarget, false, false)
            SET_ENTITY_VISIBLE(aTarget, false, false)

            SET_ENTITY_COLLISION(bTarget, false, false)
            SET_ENTITY_VISIBLE(bTarget, false, false)

            SET_ENTITY_COLLISION(cTarget, false, false)
            SET_ENTITY_VISIBLE(cTarget, false, false)

            SET_ENTITY_COLLISION(dTarget, false, false)
            SET_ENTITY_VISIBLE(dTarget, false, false)

            SET_PED_INTO_VEHICLE(owner, PlayerJet, -1)

            CONTROL_LANDING_GEAR(PlayerJet, 3)

            CONTROL_LANDING_GEAR(JetA, 3)
            CONTROL_LANDING_GEAR(JetB, 3)
            CONTROL_LANDING_GEAR(JetC, 3)
            CONTROL_LANDING_GEAR(JetD, 3)

            util.yield(1)
            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(PlayerJet, 1, 0, 100, 0, true, true, true, true)

            JetA = entities.create_vehicle(hashJet, aJetOffset, heading)
            JetB = entities.create_vehicle(hashJet, bJetOffset, heading)
            JetC = entities.create_vehicle(hashJet, cJetOffset, heading)
            JetD = entities.create_vehicle(hashJet, dJetOffset, heading)

            PilotA = CREATE_RANDOM_PED_AS_DRIVER(JetA, 1)
            SET_VEHICLE_ENGINE_ON(JetA, true, true, 0)

            PilotB = CREATE_RANDOM_PED_AS_DRIVER(JetB, 1)
            SET_VEHICLE_ENGINE_ON(JetB, true, true, 0)

            PilotC = CREATE_RANDOM_PED_AS_DRIVER(JetC, 1)
            SET_VEHICLE_ENGINE_ON(JetC, true, true, 0)

            PilotD = CREATE_RANDOM_PED_AS_DRIVER(JetD, 1)
            SET_VEHICLE_ENGINE_ON(JetD, true, true, 0)


            SET_ENTITY_INVINCIBLE(PlayerJet, true)
            SET_ENTITY_INVINCIBLE(JetA, true)
            SET_ENTITY_INVINCIBLE(JetB, true)
            SET_ENTITY_INVINCIBLE(JetC, true)
            SET_ENTITY_INVINCIBLE(JetD, true)


        end

        --TASK_VEHICLE_CHASE(PilotA, owner)
        set_entity_face_entity(JetA, aTarget, true)
        set_entity_face_entity(JetB, bTarget, true)
        set_entity_face_entity(JetC, cTarget, true)
        set_entity_face_entity(JetD, dTarget, true)

        local aJetRealLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(JetA, 0, 0, 0)
        local bJetRealLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(JetB, 0, 0, 0)
        local cJetRealLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(JetC, 0, 0, 0)
        local dJetRealLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(JetD, 0, 0, 0)

        local aDistance = GET_DISTANCE_BETWEEN_COORDS(aJetRealLoc['x'], aJetRealLoc['y'], aJetRealLoc['z'], aJetAimLoc['x'], aJetAimLoc['y'], aJetAimLoc['z'], true)
        local bDistance = GET_DISTANCE_BETWEEN_COORDS(bJetRealLoc['x'], bJetRealLoc['y'], bJetRealLoc['z'], bJetAimLoc['x'], bJetAimLoc['y'], bJetAimLoc['z'], true)
        local cDistance = GET_DISTANCE_BETWEEN_COORDS(cJetRealLoc['x'], cJetRealLoc['y'], cJetRealLoc['z'], cJetAimLoc['x'], cJetAimLoc['y'], cJetAimLoc['z'], true)
        local dDistance = GET_DISTANCE_BETWEEN_COORDS(dJetRealLoc['x'], dJetRealLoc['y'], dJetRealLoc['z'], dJetAimLoc['x'], dJetAimLoc['y'], dJetAimLoc['z'], true)

        local aDrawDistance = aDistance/100-0.3
        if aDistance < 40 + slowPlaneOffset then
            aJetSpeed = -0.8 - slowPlaneSpeedDecrease
        else
            aJetSpeed = 0.5 + slowPlaneSpeedDecrease
        end

        if bDistance < 40 + slowPlaneOffset then
            bJetSpeed = -0.8 - slowPlaneSpeedDecrease
        else
            bJetSpeed = 0.5 + slowPlaneSpeedDecrease
        end

        if cDistance < 40 + slowPlaneOffset then
            cJetSpeed = -0.8 - slowPlaneSpeedDecrease
        else
            cJetSpeed = 0.5 + slowPlaneSpeedDecrease
        end

        if dDistance < 40 + slowPlaneOffset then
            dJetSpeed = -0.8 - slowPlaneSpeedDecrease
        else
            dJetSpeed = 0.5 + slowPlaneSpeedDecrease
        end

        --util.draw_debug_text(aDistance)

        if not IS_PED_ON_FOOT(owner) then

            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(JetA, 1, 0, aJetSpeed, 0, true, true, true, true)
            SET_ENTITY_COORDS_NO_OFFSET(aTarget, aJetAimLoc.x, aJetAimLoc.y, aJetAimLoc.z, false, false, false)

            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(JetB, 1, 0, bJetSpeed, 0, true, true, true, true)
            SET_ENTITY_COORDS_NO_OFFSET(bTarget, bJetAimLoc.x, bJetAimLoc.y, bJetAimLoc.z, false, false, false)

            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(JetC, 1, 0, cJetSpeed, 0, true, true, true, true)
            SET_ENTITY_COORDS_NO_OFFSET(cTarget, cJetAimLoc.x, cJetAimLoc.y, cJetAimLoc.z, false, false, false)

            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(JetD, 1, 0, dJetSpeed, 0, true, true, true, true)
            SET_ENTITY_COORDS_NO_OFFSET(dTarget, dJetAimLoc.x, dJetAimLoc.y, dJetAimLoc.z, false, false, false)

        end

        --TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(PilotA, JetA, PlayerJetOffset.x, PlayerJetOffset.y, PlayerJetOffset.z, 50, 1, 3)

    end, function()

        entities.delete(PlayerJet)

        entities.delete(JetA)
        entities.delete(aTarget)

        entities.delete(JetB)
        entities.delete(bTarget)

        entities.delete(JetC)
        entities.delete(cTarget)

        entities.delete(JetD)
        entities.delete(dTarget)

    end)

    menu.action(myListFunSettings, "Yacht", {}, "Spawns a controllable yacht", function ()
    
        local CoreSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local CoreSpawnHeading = GET_ENTITY_HEADING(players.user_ped())

        local CoreHash = util.joaat("kosatka")
        util.request_model(CoreHash)
    
        local Core = entities.create_vehicle(CoreHash, CoreSpawnPoint, CoreSpawnHeading)
        SET_PED_INTO_VEHICLE(players.user_ped(), Core, -1)

        SET_ENTITY_VISIBLE(Core, false, false)
        local YachtHash = util.joaat("prop_cj_big_boat")
        util.request_model(YachtHash)
    
        local Yacht = entities.create_object(YachtHash, CoreSpawnPoint, CoreSpawnHeading)

        ATTACH_ENTITY_TO_ENTITY(Yacht, Core, 0, 0, 0, 0, 0, 0, 0, true, false, false, true, 0, true, 0)
        SET_ENTITY_COLLISION(Yacht, true, false)
        SET_ENTITY_COLLISION(Core, false, false)
            

    end)

menu.action(myListFunSettings, "vehicle Stealer", {}, "-Left arrow key- to steal the nearby vehicle", function ()
    
        local FlatbedSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local FlatbedSpawnHeading = GET_ENTITY_HEADING(players.user_ped())

        local FlatbedHash = util.joaat("flatbed")
        util.request_model(FlatbedHash)
    
        local Flatbed = entities.create_vehicle(FlatbedHash, FlatbedSpawnPoint, FlatbedSpawnHeading)
        SET_PED_INTO_VEHICLE(players.user_ped(), Flatbed, -1)

        

    util.create_tick_handler(function()
        
        local FlatbedSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Flatbed, 0, 0, 0)

        local SelectedCar = GET_CLOSEST_VEHICLE(FlatbedSpawnPoint.x, FlatbedSpawnPoint.y, FlatbedSpawnPoint.z, 30, 0, 131078);
        local height = GET_ENTITY_HEIGHT_ABOVE_GROUND(SelectedCar)
        local Flatbedheight = GET_ENTITY_HEIGHT_ABOVE_GROUND(Flatbed)
        local Offset = 0

       

        if height > Flatbedheight then
            Offset = Flatbedheight + 0.5
        else
            Offset = 0
        end


        if IS_CONTROL_PRESSED(0, 189) and not IS_ENTITY_ATTACHED(SelectedCar) then

            
            
            ATTACH_ENTITY_TO_ENTITY(SelectedCar, Flatbed, 0, 0, -2, 0.5 + height - Offset, 0, 0, 0, true, false, false, true, 0, true, 0)
            util.yield(500)
            VEHICLE_START_PARACHUTING(Flatbed, true)
            end

        
        if IS_CONTROL_PRESSED(0, 189) and IS_ENTITY_ATTACHED(SelectedCar) then
            DETACH_ENTITY(SelectedCar, true, true)
            util.yield(500)
        end
        

        if not DOES_ENTITY_EXIST(Flatbed) then
            return false
        end

        if not IS_PED_IN_VEHICLE(players.user_ped(), Flatbed) then
            --return false
        end

        
    end)

end)

menu.action(myListFunSettings, "Planet", {}, "Spawns a planet you can drive on at your location", function ()

    local CoreSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, -25)
    local GravityCore = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    local CoreSpawnHeading = GET_ENTITY_HEADING(players.user_ped())
    local rotOffset = 0

    local RingHash = util.joaat("stt_prop_hoop_tyre_01a")
    util.request_model(RingHash)
    
    local banditoHash = util.joaat("issi3")
    
    util.request_model(banditoHash)

    local bandito = entities.create_vehicle(banditoHash, CoreSpawnPoint, CoreSpawnHeading)

    SET_PED_INTO_VEHICLE(players.user_ped(), bandito, -1)


    util.create_tick_handler(function()

        local carLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local newGravityX = GravityCore.x - carLoc.x
        local newGravityY = GravityCore.y - carLoc.y
        local newGravityZ = GravityCore.z - carLoc.z
        local gravityDivider = 15
        --util.toast(newGravityX)
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(bandito, 1, newGravityX / gravityDivider, newGravityY / gravityDivider, newGravityZ / gravityDivider, 0, false, true, 1)
    end)

    for i = 36, 1, -1 do
        rotOffset = rotOffset + 10
        util.request_model(RingHash)
        local wing = entities.create_object(RingHash, CoreSpawnPoint, CoreSpawnHeading)
        SET_ENTITY_ROTATION(wing, 0, 0, rotOffset)
        FREEZE_ENTITY_POSITION(wing, true)
    end



end)

menu.action(myListFunSettings, "Inverted Planet", {}, "Spawns a planet you can drive on at your location", function ()

    local CoreSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    local GravityCore = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    local CoreSpawnHeading = GET_ENTITY_HEADING(players.user_ped())
    local rotOffset = 0

    local RingHash = util.joaat("ar_prop_ar_jump_loop")
    util.request_model(RingHash)
    
    local banditoHash = util.joaat("issi3")
    
    util.request_model(banditoHash)

    local bandito = entities.create_vehicle(banditoHash, CoreSpawnPoint, CoreSpawnHeading)

    SET_PED_INTO_VEHICLE(players.user_ped(), bandito, -1)


    util.create_tick_handler(function()

        local carLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local newGravityX = carLoc.x - GravityCore.x
        local newGravityY = carLoc.y - GravityCore.y
        local newGravityZ = carLoc.z - GravityCore.z
        local gravityDivider = 150
        --util.toast(newGravityX)
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(bandito, 1, newGravityX / gravityDivider, newGravityY / gravityDivider, newGravityZ / gravityDivider, 0, false, true, 1)
    end)

    for i = 36, 1, -1 do
        rotOffset = rotOffset + 10
        util.request_model(RingHash)
        local wing = entities.create_object(RingHash, CoreSpawnPoint, CoreSpawnHeading)
        SET_ENTITY_ROTATION(wing, 0, 0, rotOffset)
        FREEZE_ENTITY_POSITION(wing, true)
    end



end)

--[[menu.action(myListFunSettings, "Planet 2", {}, "Spawns a planet you can drive on at your location", function ()

    local CoreSpawnPoint = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, -10)
    local GravityCore = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    local CoreSpawnHeading = GET_ENTITY_HEADING(players.user_ped())
    local rotOffset = 0

    local RingHash = util.joaat("ar_prop_ar_hoop_med_01")
    util.request_model(RingHash)
    
    local banditoHash = util.joaat("issi3")
    
    util.request_model(banditoHash)

    local bandito = entities.create_vehicle(banditoHash, CoreSpawnPoint, CoreSpawnHeading)

    SET_PED_INTO_VEHICLE(players.user_ped(), bandito, -1)


    util.create_tick_handler(function()

        local carLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local newGravityX = GravityCore.x - carLoc.x
        local newGravityY = GravityCore.y - carLoc.y
        local newGravityZ = GravityCore.z - carLoc.z
        local gravityDivider = 15
        --util.toast(newGravityX)
        APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(bandito, 1, newGravityX / gravityDivider, newGravityY / gravityDivider, newGravityZ / gravityDivider, 0, false, true, 1)
    end)

    for i = 360, 1, -1 do
        rotOffset = rotOffset + 1
        util.request_model(RingHash)
        local wing = entities.create_object(RingHash, CoreSpawnPoint, CoreSpawnHeading)
        SET_ENTITY_ROTATION(wing, 0, 0, rotOffset)
        FREEZE_ENTITY_POSITION(wing, true)
    end



end)--]]

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Clone", {}, "Spawns a pet clone near this player (must spectate or be near of it to work properly)", function ()

        
        local pedm = players.user_ped()
        
        
        
        

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)


        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local PetAnimal = CLONE_PED(pedm, true, false, true)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(PetAnimal)



        util.create_tick_handler(function()

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
            TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                return false
            end
        end)

        util.create_tick_handler(function()

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                util.toast("RIP " .. PetNamesList[math.random(1, #PetNamesList)] .. " :'(")
                return false
            end
        end)

    end)
   


    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Rat", {}, "Spawns a pet rat near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Rat")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Rabbit", {}, "Spawns a pet rabbit near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_01")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Giant Rabbit", {}, "Spawns a pet giant rabbit near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Kitty", {}, "Spawns a pet kitty near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Cat_01")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Poodle", {}, "Spawns a pet poodle near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Poodle")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Westy", {}, "Spawns a pet westy near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Westy")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Pug", {}, "Spawns a pet pug near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Zombie Pug", {}, "Spawns a pet zombie pug near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Rottweiler", {}, "Spawns a pet rottweiler near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Rottweiler")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Retriever", {}, "Spawns a pet retriever near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Retriever")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Shepherd", {}, "Spawns a pet shepherd near you", function ()

        SelectedPetAnimal = util.joaat("A_C_shepherd")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Husky", {}, "Spawns a pet husky near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Husky")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Coyote", {}, "Spawns a pet coyote near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Zombie Coyote", {}, "Spawns a pet zombie coyote near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Mountain Lion", {}, "Spawns a pet mountain lion near you", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Zombie Mountain Lion", {}, "Spawns a pet zombie mountain lion near you", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Panther", {}, "Spawns a pet panther near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Panther")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Rhesus", {}, "Spawns a pet rhesus near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Rhesus")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Chimp", {}, "Spawns a pet chimp near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Chimp_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Pig", {}, "Spawns a pet pig near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Pig")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Boar", {}, "Spawns a pet boar near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet zombie boar", {}, "Spawns a pet zombie boar near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Cow", {}, "Spawns a pet cow near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Cow")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Deer", {}, "Spawns a pet deer near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Zombie Deer", {}, "Spawns a pet zombie deer near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer_02")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Fishy", {}, "Spawns a pet fishy near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Fish")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Stingray", {}, "Spawns a pet stingray near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Stingray")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Dolphin", {}, "Spawns a pet dolphin near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Dolphin")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Hammerhead Shark", {}, "Spawns a pet hammerhead shark near you", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkHammer")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Tiger Shark", {}, "Spawns a pet tiger shark near you", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkTiger")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Killer Whale", {}, "Spawns a pet killer whale near you", function ()

        SelectedPetAnimal = util.joaat("A_C_KillerWhale")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Hump Back Whale", {}, "Spawns a pet hump back whale near you", function ()

        SelectedPetAnimal = util.joaat("A_C_HumpBack")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Pigeon", {}, "Spawns a pet pigeon near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Pigeon")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Crow", {}, "Spawns a pet Crow near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Crow")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Hen", {}, "Spawns a pet hen near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Hen")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Seagull", {}, "Spawns a pet seagull near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Seagull")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Chickehawk", {}, "Spawns a pet chickenhawk near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Chickenhawk")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    menu.action(myListFunAnimalsPetSettings, "Spawn a Pet Cormorant", {}, "Spawns a pet cormorant near you", function ()

        SelectedPetAnimal = util.joaat("A_C_Cormorant")
        SpawnPetAnimal(SelectedPetAnimal, players.user_ped())

    end)

    -------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------

    --[[menu.toggle_loop(menu.my_root(), "Obstacle Course", {}, "Spawns an Obstacle Course at LS International Airport", function(on)

        local HashPalette = util.joaat("prop_pallet_pile_02")
        local hashWhiteContainer = util.joaat("prop_container_ld2")

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local owner = players.user_ped()

        local StructureCenter = v3.new(-1320, -3054, 13)
        local OBJ1_pos = v3.new(-1400, -3054, 12)
        local OBJ2_pos = v3.new(-1390, -3054, 13.75)
        local OBJ3_pos = v3.new(-1380, -3054, 15.25)
        local OBJ4_pos = v3.new(-1370, -3054, 17)
        local OBJ5_pos = v3.new(-1360, -3054, 19.75)

        local OBJ6_pos = v3.new(-1346, -3054, 19.75)
        local OBJ7_pos = v3.new(-1332, -3054, 19.75)
        local OBJ8_pos = v3.new(-1318, -3054, 19.75)

        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 0, 0, -1)



        if not DOES_ENTITY_EXIST(OBJStructureCenter) then
            OBJStructureCenter = entities.create_object(HashPalette, StructureCenter)-- FREEZE_ENTITY_POSITION(, true)
        end
        --SET_ENTITY_COORDS(OBJStructureCenter, StructureCenter.x, StructureCenter.y, StructureCenter.z, false, false, false, false)
        SET_ENTITY_ROTATION(OBJStructureCenter, 0, 0, 0)
        FREEZE_ENTITY_POSITION(OBJStructureCenter, true)



        if not DOES_ENTITY_EXIST(OBJ1) then
            OBJ1 = entities.create_object(hashWhiteContainer, OBJ1_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ1, -20, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ1, true)



        if not DOES_ENTITY_EXIST(OBJ2) then
            OBJ2 = entities.create_object(hashWhiteContainer, OBJ2_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ2, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ2, true)



        if not DOES_ENTITY_EXIST(OBJ3) then
            OBJ3 = entities.create_object(hashWhiteContainer, OBJ3_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ3, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ3, true)



        if not DOES_ENTITY_EXIST(OBJ4) then
            OBJ4 = entities.create_object(hashWhiteContainer, OBJ4_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ4, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ4, true)



        if not DOES_ENTITY_EXIST(OBJ5) then
            OBJ5 = entities.create_object(hashWhiteContainer, OBJ5_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ5, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ5, true)













        if not DOES_ENTITY_EXIST(OBJ6) then
            OBJ6 = entities.create_object(hashWhiteContainer, OBJ6_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ6, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ6, true)



        if not DOES_ENTITY_EXIST(OBJ7) then
            OBJ7 = entities.create_object(hashWhiteContainer, OBJ7_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ7, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ7, true)



        if not DOES_ENTITY_EXIST(OBJ8) then
            OBJ8 = entities.create_object(hashWhiteContainer, OBJ8_pos) --FREEZE_ENTITY_POSITION(, true)
        end
        SET_ENTITY_ROTATION(OBJ8, 0, 0, 90)
        FREEZE_ENTITY_POSITION(OBJ8, true)


    ---------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------


    ---------------------------------------------------------------------------------------------



            --util.toast("loop")


    end, function()
        entities.delete(OBJStructureCenter)
        entities.delete(OBJ1)
        entities.delete(OBJ2)
        entities.delete(OBJ3)
        entities.delete(OBJ4)
        entities.delete(OBJ5)
        entities.delete(OBJ6)
        entities.delete(OBJ7)
        entities.delete(OBJ8)
        --[[entities.delete(OBJ9)
        entities.delete(OBJ10)
        entities.delete(OBJ11)
        entities.delete(OBJ12)
        entities.delete(OBJ13)
        entities.delete(OBJ14)
        entities.delete(OBJ15)
        entities.delete(OBJ16)
        entities.delete(OBJ17)
    end)--]]


    -------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------









    myListFunVehicleSettings:slider("Light Flicker Speed", {}, "Changes the light flicker speed", 0, 10000, 500, 100, function (LightFlickerSpeedSlider)
        FLSpeedSP = LightFlickerSpeedSlider
    end)



    myListFunVehicleSettings:toggle_loop('Flicker Lights', {}, 'Flickers the lights of the players current vehicle', function ()
        local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        --local pedm = GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped()) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(players.user_ped(), true) --get the vehicle they are in
            Get_Entity(vmod) --get control
        end






        local vmod = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
        if vmod ~= 0 then
            --util.toast("ON!")
            SET_VEHICLE_LIGHTS(vmod, 2)
            util.yield(FLSpeedSP)
            SET_VEHICLE_LIGHTS(vmod, 1)
            util.yield(FLSpeedSP)
        end

    end, function()
        local vmod = GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
        if vmod ~= 0 then

        end

    end)




    --myListFunBombVan:slider("Bomb Van Timer", {}, "Changes the timer of the Bomb Van", 0, 10000, 1000, 100, function (BombVanTimerSettings)
    --    SimulatePlayerInputTimerMax = BombVanTimerSettings
    --end)






    myListVehicleSettings:action('Remove doors', {}, 'Removes the players current vehicle doors', function ()
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        -- get the players model
        if IS_PED_IN_ANY_VEHICLE(ourPlayer, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(ourPlayer, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_VEHICLE_DOOR_BROKEN(vmod, 0, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 1, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 2, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 3, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 4, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 5, false)
        end

    end)

    myListVehicleSettings:action('Fix Vehicle', {}, 'Fixes the current vehicle', function ()
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        -- get the players model
        if IS_PED_IN_ANY_VEHICLE(ourPlayer, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(ourPlayer, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_VEHICLE_DEFORMATION_FIXED(vmod)
            SET_VEHICLE_FIXED(vmod)
        end

    end)






    menu.divider(myListFunSettings, "------")






    menu.toggle_loop(myListFunSettings, "Snow Rain", {}, "Rains Snowballs", function(on)
        local hashSnowball = 126349499 --2138347493 --util.joaat("Snowball")
        local radius = 4
        --local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), math.random(-radius, radius), math.random(-radius, radius), 3)


        --local target = GET_ENTITY_COORDS(pedm, false)
        local owner = players.user_ped()
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), math.random(-radius, radius), math.random(-radius, radius), math.random(-radius, radius))

        SHOOT_SINGLE_BULLET_BETWEEN_COORDS(Offset.x, Offset.y, Offset.z+5, Offset.x, Offset.y, Offset.z+2, 0, true, hashSnowball, owner, true, false, 1.0)


        --util.toast("loop")


    end, function()

        --util.toast("not loop")





    end)


    --credit to nowiry
    local function raycast_gameplay_cam(flag, distance)
        local ptr1, ptr2, ptr3, ptr4 = memory.alloc(), memory.alloc(), memory.alloc(), memory.alloc()
        local cam_rot = GET_GAMEPLAY_CAM_ROT(0)
        local cam_pos = GET_GAMEPLAY_CAM_COORD()
        local direction = v3.toDir(cam_rot)
        local destination = 
        { 
            x = cam_pos.x + direction.x * distance, 
            y = cam_pos.y + direction.y * distance, 
            z = cam_pos.z + direction.z * distance 
        }
        GET_SHAPE_TEST_RESULT(
            START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(
                cam_pos.x, 
                cam_pos.y, 
                cam_pos.z+10, 
                destination.x, 
                destination.y+30, 
                destination.z, 
                flag, 
                players.user_ped(), 
                1
            ), ptr1, ptr2, ptr3, ptr4)
        local p1 = memory.read_int(ptr1)
        local p2 = memory.read_vector3(ptr2)
        local p3 = memory.read_vector3(ptr3)
        local p4 = memory.read_int(ptr4)
        return {p1, p2, p3, p4}
    end


    --menu.toggle(myListMiscSettings, "add divider", {}, "Trap the player within its car", function(on_change)

    --    if on_change == true then
    --        divider_1(on_change)
    --    else
    --        divider_1()
    --    end

    --end)
  


    

       --this is taken from Wiriscript
    TraceFlag =
    {
        everything = 4294967295,
        none = 0,
        world = 1,
        vehicles = 2,
        --pedsSimpleCollision = 4,
        --peds = 8,
        objects = 16,
        water = 32,
        foliage = 256,
    }
--same here
    function get_offset_from_cam(dist)
        local rot = GET_FINAL_RENDERED_CAM_ROT(2)
        local pos = GET_FINAL_RENDERED_CAM_COORD()
        local dir = rot:toDir()
        dir:mul(dist)
        local offset = v3.new(pos)
        offset:add(dir)
        return offset
    end

    --this too
    function get_raycast_result_WO(dist, flag)
        local result = {}
        flag = flag or TraceFlag.world
        local didHit = memory.alloc(1)
        local endCoords = v3.new()
        local normal = v3.new()
        local hitEntity = memory.alloc_int()
        local camPos = GET_FINAL_RENDERED_CAM_COORD()
        local offset = get_offset_from_cam(dist)
    
        local handle = START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(
            camPos.x, camPos.y, camPos.z,
            offset.x, offset.y, offset.z,
            flag,
            players.user_ped(), 7
        )
        GET_SHAPE_TEST_RESULT(handle, didHit, endCoords, normal, hitEntity)
    
        result.didHit = memory.read_byte(didHit) ~= 0
        result.endCoords = endCoords
        result.surfaceNormal = normal
        result.hitEntity = memory.read_int(hitEntity)
        return result
    end

    function get_raycast_result_EV(dist, flag)
        local result = {}
        flag = flag or TraceFlag.world
        local didHit = memory.alloc(1)
        local endCoords = v3.new()
        local normal = v3.new()
        local hitEntity = memory.alloc_int()
        local camPos = GET_FINAL_RENDERED_CAM_COORD()
        local offset = get_offset_from_cam(dist)
    
        local handle = START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(
            camPos.x, camPos.y, camPos.z,
            offset.x, offset.y, offset.z,
            flag,
            players.user_ped(), 7
        )
        GET_SHAPE_TEST_RESULT(handle, didHit, endCoords, normal, hitEntity)
    
        result.didHit = memory.read_byte(didHit) ~= 0
        result.endCoords = endCoords
        result.surfaceNormal = normal
        result.hitEntity = memory.read_int(hitEntity)
        return result
    end

    --same for that, i just modified a lil
    
    local KamGunemergencyEscape = 0
    local KamikazeGunPlanesTable = {}

    menu.toggle_loop(myListWeapon, "Kamikaze Gun", {}, "Kamikaze Gun can be buggy under certain circumstances such as alt+tabing out of gta while a plane exist. If you end up with a plane flying forever simply disable and re able this feature", function()

        local raycastResult = get_raycast_result_EV(1000.0)
        if IS_CONTROL_PRESSED(0, 187) then
            KamGunemergencyEscape = 1
           -- util.toast("Blep")
        end
        if raycastResult.didHit then

            --util.toast("Bean")
        if (IS_PED_SHOOTING(players.user_ped())) then
            local ImpactPos = raycastResult.endCoords
            --util.toast("bloop")

             local PH = entities.create_object(1267718013, ImpactPos, 0)
             SET_ENTITY_VISIBLE(PH, false, false)
             SET_ENTITY_COLLISION(PH, false)
             SET_ENTITY_COORDS(PH, ImpactPos.x, ImpactPos.y, ImpactPos.z, false, false, false, false)
           
        

            KamGunemergencyEscape = 0
            local  Ppedm = GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
            local randomPlane = util.joaat(JetSquadronRealNames[math.random(1, #JetSquadronRealNames)])
            util.request_model(randomPlane)
    
            util.toast("LEEROY JENKINS !")
    
            local radius = 200
            local VictimRadius = 50
            local ExplosionRadius = 5
            --local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    
            table.insert(KamikazeGunPlanesTable, 1, 1)
            local KnowVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PH, math.random(-VictimRadius, VictimRadius), math.random(-VictimRadius, VictimRadius), 10)
            local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PH, math.random(-radius, radius), math.random(-radius, radius), math.random(100, 500))
            local Kamikaze = entities.create_vehicle(randomPlane, Offset, math.random(-180, 180))
    
    
            local KamikazeCam = CREATE_CAMERA(26379945, true)
    
    
            util.create_tick_handler(function()
                set_entity_face_entity(Kamikaze, PH, true)
                APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Kamikaze, 1, 0, 1.5, 0.0, true, true, true, true)
    
                --SET_ENTITY_VELOCITY(Kamikaze, 0, 0, -3000)
                RENDER_SCRIPT_CAMS(true, false, 3000, 1, 0, 0)
                SHAKE_CAM(KamikazeCam, "DRUNK_SHAKE", 1)
                ANIMPOSTFX_PLAY("MP_corona_switch_supermod", 0, true)
                ANIMPOSTFX_PLAY("MP_OrbitalCannon", 0, true)
    
                if HAS_ENTITY_COLLIDED_WITH_ANYTHING(Kamikaze) or KamGunemergencyEscape == 1 then
    
                    local KamikazeOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Kamikaze,  math.random(-ExplosionRadius, ExplosionRadius),  math.random(-ExplosionRadius, ExplosionRadius),  math.random(-ExplosionRadius, ExplosionRadius))
    
                    -- func.use_fx_asset("scr_xm_orbital")
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 59, 1, true, false, 1.0, false)
                    PLAY_SOUND_FROM_ENTITY(-1, "DLC_XM_Explosions_Orbital_Cannon", Kamikaze, 0, true, false)
    
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
                    ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                    util.yield(50)
    
                    util.yield(1500)
                    RENDER_SCRIPT_CAMS(false, false, 3000, 1, 0, 0);
                    DESTROY_CAM(KamikazeCam, true)
                    ANIMPOSTFX_STOP("MP_OrbitalCannon", 0, true)
                    ANIMPOSTFX_STOP("MP_OrbitalCannon", 0, true)
                    ANIMPOSTFX_STOP("MP_corona_switch_supermod", 0, true)
                    ANIMPOSTFX_STOP("MP_corona_switch_supermod", 0, true)
                    entities.delete(Kamikaze)
                    entities.delete(PH)
                    KamGunemergencyEscape = 1
                    util.yield(200)
                    table.remove(KamikazeGunPlanesTable, 1)
                    --menu.trigger_commands('spectate'.. pname)
            --util.yield(20000)
                    return false
                else
                    SET_ENTITY_COORDS(PH, ImpactPos.x, ImpactPos.y, ImpactPos.z, false, false, false, false)
                end
    
    
            end)
    
            --SET_ENTITY_COORDS(players.user_ped(), Offset.x, Offset.y, Offset.z, false, false, false, false)
            HARD_ATTACH_CAM_TO_ENTITY(KamikazeCam, Kamikaze, -10, 0, 0, 0, -10, 6, true)
    
            --util.toast(KamikazeCam)
            local cause = GET_VEHICLE_CAUSE_OF_DESTRUCTION(Kamikaze)
            SET_ALLOW_VEHICLE_EXPLODES_ON_CONTACT(Kamikaze, true)
    
            SET_VEHICLE_ENGINE_ON(Kamikaze, true, true, 0)
            KamikazePilot = CREATE_RANDOM_PED_AS_DRIVER(Kamikaze, 1)
            CONTROL_LANDING_GEAR(Kamikaze, 3)
    
        
            --util.yield(20000)
            --KamGunemergencyEscape = 1
    
        end

    end

        




    end, function()
        KamGunemergencyEscape = 1
    end)
    

    

    menu.action(myListFunAnimalsMountsSettings, "Giant Rabbit Riding", {}, "Spawns a giant rabbit for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Rabbit_02")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, 5, -0.3, -0.25, 0, -180+80, 90+180, 180, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, 5, -0.3, -0.25, 0, -180+80, 90+180, 180, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)

    menu.action(myListFunAnimalsMountsSettings, "Boar Riding", {}, "Spawns a boar for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Boar")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        local attachLoc = v3.new(0, 0, 0.3)
        local attachRot = v3.new(0, 0, 90)
        local attachBone = 2
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)


    menu.action(myListFunAnimalsMountsSettings, "Zombie Boar Riding", {}, "Spawns a zombie boar for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Boar_02")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        local attachLoc = v3.new(0, 0, 0.3)
        local attachRot = v3.new(0, 0, 90)
        local attachBone = 2
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)


    menu.action(myListFunAnimalsMountsSettings, "Cow Riding", {}, "Spawns a cow for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Cow")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        local attachLoc = v3.new(0, 0, 0.2)
        local attachRot = v3.new(0, 0, 90)
        local attachBone = 2
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)

    menu.action(myListFunAnimalsMountsSettings, "Deer Riding", {}, "Spawns a deer for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Deer")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        local attachLoc = v3.new(0, 0, 0.35)
        local attachRot = v3.new(-345, 0, 90)
        local attachBone = 2
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)

    menu.action(myListFunAnimalsMountsSettings, "Zombie Deer Riding", {}, "Spawns a zombie deer for you to ride", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Deer_02")
        local pedm = players.user_ped()
        --local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        --util.request_model(BikeHash)
        --local pedm = Target
        local target_ped = players.user_ped()
        local Clone = CLONE_PED(target_ped, true, false, true)

--i stole the raycast bit from Lance's script, and wiriscript

--honestly, if you watch this and wanna do the same, the best thing is to ask me on discord, a lot of stuff there is useless and i'm too
    --scared to remove it bc it took me ages to get this working

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local ArrowSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)


        local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, heading)
        SET_ENTITY_INVINCIBLE(PetAnimal, true)
        local attachLoc = v3.new(0, 0, 0.35)
        local attachRot = v3.new(-345, 0, 90)
        local attachBone = 2
        --local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Clone, PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(players.user_ped(), PetAnimal, attachBone, attachLoc.x, attachLoc.y, attachLoc.z, attachRot.x, attachRot.y, attachRot.z, true, false, false, true, 0, true, 0)
        --SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        --SET_ENTITY_VISIBLE(Bike, false)
        --IS_VEHICLE_VISIBLE(Bike)


        REQUEST_ANIM_DICT("rcmjosh2")
        --From LanceScript
        TASK_PLAY_ANIM(Clone, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        TASK_PLAY_ANIM(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
        util.yield(100)
        FREEZE_ENTITY_POSITION(Clone, true)
        --SET_PED_ALLOW_MINOR_REACTIONS_AS_MISSION_PED(Clone, false)
        --SET_PED_CAN_TORSO_REACT_IK(Clone, false)
        ------------------
        local ArrowHash = 1267718013
        util.request_model(ArrowHash)
        local Arrow = entities.create_object(ArrowHash, ArrowSpawnOffset, heading)
        SET_ENTITY_COLLISION(Arrow, false, false)

        --local hash = util.joaat("v_ind_cfwaste")
        --local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        --util.request_model(hash)
       -- local OBJ = entities.create_object(hash, Player_Pos)

--SET_ENTITY_VISIBLE(players.user_ped(), false, false)
--util.yield(10)

--SET_ENTITY_VISIBLE(players.user_ped(), true, false)
        util.create_tick_handler(function()
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
util.toast("Hold and Release Space to set a destination point | Press down arrow to delete your mount")
            if IS_CONTROL_PRESSED(0, 187) then
                --entities.delete(Bike)
                entities.delete(PetAnimal)
                entities.delete(Arrow)
                entities.delete(Clone)
                STOP_ANIM_TASK(players.user_ped(), "rcmjosh2", "josh_sitting_loop", 8.0)

                return false
            end
            heading = GET_ENTITY_HEADING(players.user_ped())
            SET_ENTITY_ROTATION(Arrow, 0, 180, heading)
            --SET_ENTITY_VISIBLE(players.user_ped(), true, false)

            
            
        end)

        util.create_tick_handler(function()
        local cam_pos = GET_FINAL_RENDERED_CAM_COORD()

        if IS_CONTROL_PRESSED(0, 187) then
            return false
        end

        local Player_Pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
        local distance = 10

        local Cam_v3 = v3.new(cam_pos.x, cam_pos.y, -cam_pos.z)
        --SET_ENTITY_COORDS_NO_OFFSET(OBJ, cam_pos.x, Player_Pos.y, cam_pos.z, false, false, false)
            --SET_ENTITY_COORDS_NO_OFFSET(GiantRabbitGoal, Player_Pos.x+distance, Player_Pos.y, cam_pos.z, false, false, false)
            --local OBJcoords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(OBJ, 0, 0, 0)
            local heading = GET_ENTITY_HEADING(players.get_cam_rot(players.user()))
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            
            local TargetOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 5, 0)
            
            local raycastResult = get_raycast_result_WO(100000.0)
            if raycastResult.didHit and (IS_PED_SHOOTING(players.user_ped()) or IS_CONTROL_PRESSED(0, 179)) then
                GiantRabbitNextPos = raycastResult.endCoords
                TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z, 5.0, 0, false, 0, 0.0)
            
                    SET_ENTITY_COORDS_NO_OFFSET(Arrow, GiantRabbitNextPos.x, GiantRabbitNextPos.y, GiantRabbitNextPos.z+1, false, false, false)
              
       
            end
            --SET_ENTITY_HEADING(PetAnimal, heading)
          --util.yield(500)

          
    
            --if IS_CONTROL_PRESSED(0, 145) then
            --    return false
            --end
        end)






    end)

    local TBDphase = 1 --change phase for testing

    local TBDblips = {}
    local TBDblipsOther = {}

    local TBDpeds = {}
    local TBDpedsOther = {}

    local TBDvehicles = {}

    local TBDobjects = {}
    local TBDobjectsOther = {}
    local TBDobjectsPipes = {}
    
    local TBDipls = {}

    local isTBDrunning = 0
    
    local TBDfailMesageShown = 0

    local TBDtick1CalledonceEver = 0
    local TBDtick2CalledonceEver = 0
    local TBDtick3CalledonceEver = 0
    local TBDtick4CalledonceEver = 0
    local TBDtick5CalledonceEver = 0
    local TBDtick6CalledonceEver = 0
    local TBDtick7CalledonceEver = 0
    local TBDtick8CalledonceEver = 0
    local TBDtick9CalledonceEver = 0
    local TBDtick10CalledonceEver = 0
    local TBDtick11CalledonceEver = 0
    local TBDtick12CalledonceEver = 0
    local TBDtick13CalledonceEver = 0
    local TBDtick14CalledonceEver = 0
    local TBDtick15CalledonceEver = 0
    local TBDtick16CalledonceEver = 0
    local TBDtick17CalledonceEver = 0
    local TBDtick18CalledonceEver = 0
    local TBDtick19CalledonceEver = 0
    local TBDtick20CalledonceEver = 0
    local TBDtick21CalledonceEver = 0
    local TBDtick22CalledonceEver = 0
    local TBDtick23CalledonceEver = 0
    local TBDtick24CalledonceEver = 0
    local TBDtick25CalledonceEver = 0
    local TBDtick26CalledonceEver = 0
    local TBDtick27CalledonceEver = 0
    local TBDtick28CalledonceEver = 0
    local TBDtick29CalledonceEver = 0
    local TBDtick30CalledonceEver = 0
    local TBDtick31CalledonceEver = 0
    local TBDtick32CalledonceEver = 0
    local TBDtick33CalledonceEver = 0
    local TBDtick34CalledonceEver = 0
    local TBDtick35CalledonceEver = 0
    local TBDtick36CalledonceEver = 0
    local TBDtick37CalledonceEver = 0
    local TBDtick38CalledonceEver = 0
    local TBDtick39CalledonceEver = 0
    local TBDtick40CalledonceEver = 0
    local TBDtick41CalledonceEver = 0
    local TBDtick42CalledonceEver = 0
    local TBDtick43CalledonceEver = 0
    local TBDtick44CalledonceEver = 0
    local TBDtick45CalledonceEver = 0
    local TBDtick46CalledonceEver = 0
    local TBDtick47CalledonceEver = 0
    local TBDtick48CalledonceEver = 0
    local TBDtick49CalledonceEver = 0
    local TBDtick50CalledonceEver = 0
    local TBDtick51CalledonceEver = 0
    local TBDtick52CalledonceEver = 0
    local TBDtick53CalledonceEver = 0
    local TBDtick54CalledonceEver = 0
    local TBDtick55CalledonceEver = 0
    local TBDtick56CalledonceEver = 0
    local TBDtick57CalledonceEver = 0
    local TBDtick58CalledonceEver = 0
    local TBDtick59CalledonceEver = 0
    local TBDtick60CalledonceEver = 0
    local TBDtick61CalledonceEver = 0
    local TBDtick62CalledonceEver = 0
    local TBDtick63CalledonceEver = 0
    local TBDtick64CalledonceEver = 0
    local TBDtick65CalledonceEver = 0
    local TBDtick66CalledonceEver = 0
    local TBDtick67CalledonceEver = 0
    local TBDtick68CalledonceEver = 0
    local TBDtick69CalledonceEver = 0
    local TBDtick70CalledonceEver = 0
    
    local phonePickedUp = 0

    local banditoHackSuccessful = 0
    local banditoHackFailed = 0

    local ToreadorCanBeDestroyed = 0
    
    local TBDtargetHacked1 = 0
    local TBDtargetHacked2 = 0
    local TBDtargetHacked3 = 0
    
    local TooLateAntonovCutscene = 0
    local AntonovLostCutscene = 0

function ResetTBD()
            

    for i, blip in TBDblips do
        util.remove_blip(blip)
    end
    TBDblips = {}

    for i, blipO in TBDblipsOther do
        util.remove_blip(blipO)
    end
    TBDblipsOther = {}



    for i, ped in TBDpeds do
        entities.delete(ped)
    end
    TBDpeds = {}

    for i, pedO in TBDpedsOther do
        entities.delete(pedO)
    end
    TBDpedsOther = {}


    for i, vehicle in TBDvehicles do
        entities.delete(vehicle)
    end
    TBDvehicles = {}

    for i, object in TBDobjects do
        entities.delete(object)
    end
    TBDobjects = {} 

    for i, objectO in TBDobjectsOther do
        entities.delete(objectO)
    end
    TBDobjectsOther = {}

    for i, objectP in TBDobjectsPipes do
        entities.delete(objectP)
    end
    TBDobjectsPipes = {}

    --for i, IPL in TBDipls do
    --    REMOVE_IPL(IPL)
    --end
    --TBDipls = {}

    
    menu.trigger_commands('ussluxington off')
    menu.trigger_commands('iplcayopercio off')
    
    menu.trigger_commands('lockwantedlevel on')
    menu.trigger_commands('wanted 0')


    ANIMPOSTFX_STOP("TinyRacerPink", 0, true)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)

    
    RENDER_SCRIPT_CAMS(false, true, 1, 1, 0, 0);

    --if DOES_CAM_EXIST(TBDCutsceneCam) then
    --    DESTROY_CAM(TBDCutsceneCam, true)
    --    DESTROY_ALL_CAMS(true)
    --end

    --TBDCutsceneCam = CREATE_CAMERA(26379945, true)
    --TBDCutsceneCamPos = v3.new(0, 0, 0)
    --TBDCutsceneCamRot = v3.new(0, 0, 0)
    TBD_ph_Step = 0

    TBDPlayerName = players.get_name(players.user())
    TBDdialogue = 0

    TBD_Tip = 0

    --isTBDrunning = 0

    TBDtick1CalledonceEver = 0
    TBDtick2CalledonceEver = 0
    TBDtick3CalledonceEver = 0
    TBDtick4CalledonceEver = 0
    TBDtick5CalledonceEver = 0
    TBDtick6CalledonceEver = 0
    TBDtick7CalledonceEver = 0
    TBDtick8CalledonceEver = 0
    TBDtick9CalledonceEver = 0
    TBDtick10CalledonceEver = 0
    TBDtick11CalledonceEver = 0
    TBDtick12CalledonceEver = 0
    TBDtick13CalledonceEver = 0
    TBDtick14CalledonceEver = 0
    TBDtick15CalledonceEver = 0
    TBDtick16CalledonceEver = 0
    TBDtick17CalledonceEver = 0
    TBDtick18CalledonceEver = 0
    TBDtick19CalledonceEver = 0
    TBDtick20CalledonceEver = 0
    TBDtick21CalledonceEver = 0
    TBDtick22CalledonceEver = 0
    TBDtick23CalledonceEver = 0
    TBDtick24CalledonceEver = 0
    TBDtick25CalledonceEver = 0
    TBDtick26CalledonceEver = 0
    TBDtick27CalledonceEver = 0
    TBDtick28CalledonceEver = 0
    TBDtick29CalledonceEver = 0
    TBDtick30CalledonceEver = 0
    TBDtick31CalledonceEver = 0
    TBDtick32CalledonceEver = 0
    TBDtick33CalledonceEver = 0
    TBDtick34CalledonceEver = 0
    TBDtick35CalledonceEver = 0
    TBDtick36CalledonceEver = 0
    TBDtick37CalledonceEver = 0
    TBDtick38CalledonceEver = 0
    TBDtick39CalledonceEver = 0
    TBDtick40CalledonceEver = 0
    TBDtick41CalledonceEver = 0
    TBDtick42CalledonceEver = 0
    TBDtick43CalledonceEver = 0
    TBDtick44CalledonceEver = 0
    TBDtick45CalledonceEver = 0
    TBDtick46CalledonceEver = 0
    TBDtick47CalledonceEver = 0
    TBDtick48CalledonceEver = 0
    TBDtick49CalledonceEver = 0
    TBDtick50CalledonceEver = 0
    TBDtick51CalledonceEver = 0
    TBDtick52CalledonceEver = 0
    TBDtick53CalledonceEver = 0
    TBDtick54CalledonceEver = 0
    TBDtick55CalledonceEver = 0
    TBDtick56CalledonceEver = 0
    TBDtick57CalledonceEver = 0
    TBDtick58CalledonceEver = 0
    TBDtick59CalledonceEver = 0
    TBDtick60CalledonceEver = 0
    TBDtick61CalledonceEver = 0
    TBDtick62CalledonceEver = 0
    TBDtick63CalledonceEver = 0
    TBDtick64CalledonceEver = 0
    TBDtick65CalledonceEver = 0
    TBDtick66CalledonceEver = 0
    TBDtick67CalledonceEver = 0
    TBDtick68CalledonceEver = 0
    TBDtick69CalledonceEver = 0
    TBDtick70CalledonceEver = 0
    
    phonePickedUp = 0

    TBDtargetHacked1 = 0
    TBDtargetHacked2 = 0
    TBDtargetHacked3 = 0

    banditoHackSuccessful = 0
    banditoHackFailed = 0
    
    
    TooLateAntonovCutscene = 0
    AntonovLostCutscene = 0

end



function TBDphase1()
    if TBDphase == 1 then
    util.toast("Press the down arrow key to get tips if you are stuck :)")

if TBDtick2CalledonceEver == 0 then
    TBDtick2CalledonceEver = 1
    util.create_tick_handler(function ()
        if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 0 then
            util.toast("Get in your car")
        elseif IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 1 then
            util.toast("Find the target by holding down -LeftShift- to enable the signal detector (The closer you are the shorter the bar)")
        elseif IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
            util.toast("Hack the phone by reaching the end of the track fast enough")
        end
        TBDPlayerCurrentExactLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        if IS_CONTROL_PRESSED(0, 187) and IS_PED_IN_VEHICLE(players.user_ped(), TBDvehicles[1]) and  TBD_Tip == 0 then
            TBD_Tip = 1
            
            util.toast("Find the target by holding down -LeftShift- to enable the signal detector (The closer you are the shorter the bar)")
        end

        if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
            
            util.toast("hack the target")
        end

        if TBDphase ~= 1 then
            return false
        end

        if TBDtick2CalledonceEver == 0 then
            return false
        end
    end)
end

    local SpawnPoint = v3.new(-765.5, 774.4, 213.2)
    local SpawnHeading = -72.7

    local PlayerCarSpawnPoint = v3.new(-748.7, 818.2, 213)
    local PlayerCarSpawnHeading = -145

    local MWagent_1_SpawnPoint = v3.new(686.5, -1749.9, 29)
    local MWagent_1_SpawnHeading = -90

    
    local MWagent_2_SpawnPoint = v3.new(-1407.2, -385.0, 37)
    local MWagent_2_SpawnHeading = -150

    
    local MWagent_3_SpawnPoint = v3.new(383.3, 143.4, 103)
    local MWagent_3_SpawnHeading = 72

    local sizeX = 0.95
    local sizeY = 0.03
    local current_y_pos = 0.04

    


    if TBD_ph_Step == 0 then
        TBD_ph_Step = 1
        DO_SCREEN_FADE_OUT(1500)
    util.yield(1500)
        FREEZE_ENTITY_POSITION(players.user_ped(), true)
    util.yield(500)
        SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), SpawnPoint.x, SpawnPoint.y, SpawnPoint.z)
        SET_ENTITY_HEADING(players.user_ped(), SpawnHeading)
    util.yield(500)
        REQUEST_ANIM_DICT("anim@heists@fleeca_bank@ig_7_jetski_owner")
        TASK_PLAY_ANIM(players.user_ped(), "anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", 10.0, 1, -1, 2, 1.0, false, false, false)
    util.yield(500)
        local TBDCutsceneCamPos = v3.new(-741.1, 785.8, 215.0)
--goal--TBDCutsceneCamPos = v3.new(-760.9, 776.0, 213.1)
    local TBDCutsceneCamRot = v3.new(-2, 0, 111)
    util.yield(100)
        local TBDCutsceneCam = CREATE_CAMERA(26379945, true)
        SET_CAM_COORD(TBDCutsceneCam, TBDCutsceneCamPos.x, TBDCutsceneCamPos.y, TBDCutsceneCamPos.z)
        SET_CAM_ROT(TBDCutsceneCam, TBDCutsceneCamRot.x, TBDCutsceneCamRot.y, TBDCutsceneCamRot.z, 2)
        RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0);
        DO_SCREEN_FADE_IN(1500)
    util.yield(1500)
        RENDER_SCRIPT_CAMS(false, true, 42000, 1, 0, 0)

if TBDtick3CalledonceEver == 0 then
    TBDtick3CalledonceEver = 1
    util.create_tick_handler(function () -- Cutscene Dialogues

        if TBDdialogue == 0 then
            util.toast("Earpiece : Thank you for waiting Agent " .. TBDPlayerName .. ". We finally have an oportunity to overthrow Merryweather. We do know that two files contains the logs of all of their criminal doings. Even a single file will allow us to take them all down. However, these files are yet to be located and that's why we need your help.")
        elseif TBDdialogue == 1 then
            util.toast("Earpiece : You will have to hack the phones of multiple goons to get more info. Other agents have located 3 of them. Use your car's signal detector by holding -LeftShift- to find out their exact whereabouts and don't get spotted ! Good luck agent and remember, if you need help at any point, simply press the down arrow key.")
        elseif TBDdialogue == 2 then
            return false
        end

        if TBDphase ~= 1 then
            return false
        end

        if TBDtick3CalledonceEver == 0 then
            return false
        end

    end)
end
    TBDdialogue = 0
    util.yield(20000)
    TBDdialogue = 1
    util.yield(23000)
    TBDdialogue = 2
    DESTROY_CAM(TBDCutsceneCam)

        FREEZE_ENTITY_POSITION(players.user_ped(), false)
        STOP_ANIM_TASK(players.user_ped(), "anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", 0.8)
    
        util.yield(1000)
        util.toast("Get in your car")

        local PlayerCarHash = util.joaat("oracle2")
        local SignalDetectorHash = util.joaat("oracle2")
        local MWagent_1_CarHash = util.joaat("casco")
        local MWagent_2_CarHash = util.joaat("swinger")
        local MWagent_3_CarHash = util.joaat("stinger")

        util.request_model(PlayerCarHash)

        local TBDPlayerCar = entities.create_vehicle(PlayerCarHash, PlayerCarSpawnPoint, PlayerCarSpawnHeading)
        SET_VEHICLE_COLOURS(TBDPlayerCar, 147, 26)
        entities.set_can_migrate(TBDPlayerCar, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(TBDPlayerCar, true, true)
            local blipPlayerCar = ADD_BLIP_FOR_ENTITY(TBDPlayerCar)
            table.insert(TBDblips, 1, blipPlayerCar)
            SET_BLIP_SPRITE(blipPlayerCar, 530)
            SET_BLIP_DISPLAY(blipPlayerCar, 2)
            SET_BLIP_COLOUR(blipPlayerCar, 13)
        table.insert(TBDvehicles, 1, TBDPlayerCar)
        SET_VEHICLE_RADIO_ENABLED(TBDvehicles[1], false)
        local SignalDetector = entities.create_vehicle(SignalDetectorHash, PlayerCarSpawnPoint+10, PlayerCarSpawnHeading)
        --local blipPlayerSignal = ADD_BLIP_FOR_ENTITY(SignalDetector)--remove
        --table.insert(TBDblips, 1, blipPlayerSignal)--remove
        --SET_BLIP_SPRITE(blipPlayerSignal, 50)--remove--remove
        --SET_BLIP_DISPLAY(blipPlayerSignal, 2)--remove
        --SET_BLIP_COLOUR(blipPlayerSignal, 15)--remove
        entities.set_can_migrate(SignalDetector, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(SignalDetector, true, true)
        table.insert(TBDvehicles, 2, SignalDetector)
        SET_ENTITY_COLLISION(SignalDetector, false, false)
        SET_ENTITY_VISIBLE(SignalDetector, false)
        SET_VEHICLE_MOD(SignalDetector, 14, 55, false)
        SET_HORN_PERMANENTLY_ON(SignalDetector)
        
        ATTACH_ENTITY_TO_ENTITY(TBDvehicles[2], TBDvehicles[1], 0, 0, 0, 5, 0, 0, 0, true, false, false, true, 0, true, 0)

        util.request_model(MWagent_1_CarHash)
        local MWagent_1_Car = entities.create_vehicle(MWagent_1_CarHash, MWagent_1_SpawnPoint, MWagent_1_SpawnHeading)
        entities.set_can_migrate(MWagent_1_Car, false)
        --util.yield(500)
        table.insert(TBDvehicles, 3, MWagent_1_Car)
        SET_ENTITY_AS_MISSION_ENTITY(MWagent_1_Car, true, true)
        local MWdriver1 = CREATE_RANDOM_PED_AS_DRIVER(MWagent_1_Car, true)
        table.insert(TBDpeds, 1, MWdriver1)
        TASK_VEHICLE_DRIVE_WANDER(MWdriver1, MWagent_1_Car, 20.0, 1074528292)




        util.request_model(MWagent_2_CarHash)
        local MWagent_2_Car = entities.create_vehicle(MWagent_2_CarHash, MWagent_2_SpawnPoint, MWagent_2_SpawnHeading)
        entities.set_can_migrate(MWagent_2_Car, false)
        --util.yield(500)
        table.insert(TBDvehicles, 4, MWagent_2_Car)
        SET_ENTITY_AS_MISSION_ENTITY(MWagent_2_Car, true, true)
        local MWdriver2 = CREATE_RANDOM_PED_AS_DRIVER(MWagent_2_Car, true)
        table.insert(TBDpeds, 2, MWdriver2)
        TASK_VEHICLE_DRIVE_WANDER(MWdriver2, MWagent_2_Car, 20.0, 1074528292)




        util.request_model(MWagent_3_CarHash)
        local MWagent_3_Car = entities.create_vehicle(MWagent_3_CarHash, MWagent_3_SpawnPoint, MWagent_3_SpawnHeading)
        entities.set_can_migrate(MWagent_3_Car, false)
        --util.yield(500)
        table.insert(TBDvehicles, 5, MWagent_3_Car)
        SET_ENTITY_AS_MISSION_ENTITY(MWagent_3_Car, true, true)
        local MWdriver3 = CREATE_RANDOM_PED_AS_DRIVER(MWagent_3_Car, true)
        table.insert(TBDpeds, 3, MWdriver3)
        TASK_VEHICLE_DRIVE_WANDER(MWdriver3, MWagent_3_Car, 20.0, 1074528292)

        

    if TBDtick34CalledonceEver == 0 then
        TBDtick34CalledonceEver = 1
        util.create_tick_handler(function()
            
            local MWagent_1_CarExactPosBeep = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, 0, 0, 0)
            local MWagent_2_CarExactPosBeep = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, 0, 0, 0)
            local MWagent_3_CarExactPosBeep = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, 0, 0, 0)

            local BeepTarget = MWagent_1_CarExactPosBeep

            local PlayerExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        if IS_PED_IN_VEHICLE(players.user_ped(), TBDvehicles[1]) and IS_CONTROL_PRESSED(0, 131) then
            if TBDtargetHacked1 == 0 and TBDtargetHacked2 == 0 and TBDtargetHacked3 == 0 then
                sizeX = PlayerExactPos:distance(MWagent_1_CarExactPosBeep)/500  
            end
            if TBDtargetHacked1 == 1 and TBDtargetHacked2 == 0 and TBDtargetHacked3 == 0 then
                sizeX = PlayerExactPos:distance(MWagent_2_CarExactPosBeep)/500  
            end
            if TBDtargetHacked1 == 1 and TBDtargetHacked2 == 1 and TBDtargetHacked3 == 0 then
                sizeX = PlayerExactPos:distance(MWagent_3_CarExactPosBeep)/500  
            end
            if TBDtargetHacked1 == 1 and TBDtargetHacked2 == 1 and TBDtargetHacked3 == 1 then
                sizeX = sizeX/PlayerExactPos:distance(PlayerExactPos)  
            end
            directx.draw_rect(0.5 - (sizeX / 2), current_y_pos, sizeX, sizeY, {r=0, g=255, b=0, a=1})
        end
            


            if TBDphase ~= 1 then
                return false
            end

            if TBDtick34CalledonceEver == 0 then
                return false
            end
        end)

        

    end


    if TBDtick4CalledonceEver == 0 then
        TBDtick4CalledonceEver = 1
        util.create_tick_handler(function()--BlipRadius
            --util.toast("radius on") -- debug
            local MWagent_1_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, math.random(-75, 75), math.random(-75, 75), 0)
            local blipMWagent_1_Car = ADD_BLIP_FOR_RADIUS(MWagent_1_CarExactPos.x, MWagent_1_CarExactPos.y, MWagent_1_CarExactPos.z, 250)
            SET_BLIP_ALPHA(blipMWagent_1_Car, 90)
            SET_BLIP_COLOUR(blipMWagent_1_Car, 5)
            SET_BLIP_DISPLAY(blipMWagent_1_Car, 2)
            --table.insert(TBDblipsOther, 1, blipMWagent_1_Car)
            util.yield(5000)
            util.remove_blip(blipMWagent_1_Car)

            if TBDfailMesageShown == 1 then
                util.remove_blip(blipMWagent_1_Car)
                --util.toast("TBDfailMesageShown") -- debug
                return false
            end

            if TBDtargetHacked1 == 1 then
                util.remove_blip(blipMWagent_1_Car)
                --util.toast("TBDtargetHacked1") -- debug
                return false
            end

            if TBDphase ~= 1 then
                util.remove_blip(blipMWagent_1_Car)
                --util.toast("TBDphase") -- debug
                return false
            end

            if TBDtick4CalledonceEver == 0 then
                util.remove_blip(blipMWagent_1_Car)
                --util.toast("TBDtick4CalledonceEver") -- debug
                return false
            end

        end)
    end
        
if TBDtick5CalledonceEver == 0 then
    TBDtick5CalledonceEver = 1
    util.create_tick_handler(function()--BlipRadius
        if TBDtargetHacked1 == 1 then
            local MWagent_2_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, math.random(-75, 75), math.random(-75, 75), 0)
            local blipMWagent_2_Car = ADD_BLIP_FOR_RADIUS(MWagent_2_CarExactPos.x, MWagent_2_CarExactPos.y, MWagent_2_CarExactPos.z, 250)
            SET_BLIP_ALPHA(blipMWagent_2_Car, 90)
            SET_BLIP_COLOUR(blipMWagent_2_Car, 5)
            SET_BLIP_DISPLAY(blipMWagent_2_Car, 2)
            table.insert(TBDblipsOther, 1, blipMWagent_2_Car)
            util.yield(5000)
            util.remove_blip(blipMWagent_2_Car)

            if TBDfailMesageShown == 1 then
                util.remove_blip(blipMWagent_2_Car)
                return false
            end
        

        
        
            if TBDtargetHacked2 == 1 then
                util.remove_blip(blipMWagent_2_Car)
                return false
            end

            if TBDphase ~= 1 then
                util.remove_blip(blipMWagent_2_Car)
                return false
            end

            if TBDtick5CalledonceEver == 0 then
                util.remove_blip(blipMWagent_2_Car)
                return false
            end
        end
        
    end)

end

if TBDtick6CalledonceEver == 0 then
    TBDtick6CalledonceEver = 1
    util.create_tick_handler(function()--BlipRadius
        if TBDtargetHacked2 == 1 then
            local MWagent_3_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, math.random(-75, 75), math.random(-75, 75), 0)
            local blipMWagent_3_Car = ADD_BLIP_FOR_RADIUS(MWagent_3_CarExactPos.x, MWagent_3_CarExactPos.y, MWagent_3_CarExactPos.z, 250)
            SET_BLIP_ALPHA(blipMWagent_3_Car, 90)
            SET_BLIP_COLOUR(blipMWagent_3_Car, 5)
            SET_BLIP_DISPLAY(blipMWagent_3_Car, 2)
            table.insert(TBDblipsOther, 1, blipMWagent_3_Car)
            util.yield(5000)
            util.remove_blip(blipMWagent_3_Car)
            if TBDfailMesageShown == 1 then
                util.remove_blip(blipMWagent_3_Car)
                return false
            end
       

        

            if TBDtargetHacked3 == 1 then
                util.remove_blip(blipMWagent_3_Car)
                return false
            end

            if TBDphase ~= 1 then
                util.remove_blip(blipMWagent_3_Car)
                return false
            end

            if TBDtick6CalledonceEver == 0 then
                util.remove_blip(blipMWagent_3_Car)
                return false
            end
        end
        end)

    end

        local hack1Status = 0
        local hack2Status = 0
        local hack3Status = 0


    if TBDtick7CalledonceEver == 0 then
        TBDtick7CalledonceEver = 1
        util.create_tick_handler(function()
            
            
            local MWagent_1_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, 0, 0, 0)
            local MWagent_2_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, 0, 0, 0)
            local MWagent_3_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, 0, 0, 0)

            local PlayerExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

            if MWagent_1_CarExactPos:distance(PlayerExactPos) < 50 and hack1Status < 99 then
                
                hack1Status = hack1Status + math.random(3, 18)
                if hack1Status >=  99 then
                    hack1Status = 100
                    util.toast("Hack complete")
                    TBDtargetHacked1 = 1
                    TBD_Tip = 1
                else
                util.toast("Hack " .. hack1Status .. "% complete")
                util.yield(math.random(1300, 2900))
                TBD_Tip = 2
                end
            end


            if MWagent_2_CarExactPos:distance(PlayerExactPos) < 50 and hack2Status < 99 then
                hack2Status = hack2Status + math.random(3, 18)
                if hack2Status >=  99 then
                    hack2Status = 100
                    util.toast("Hack complete")
                    TBDtargetHacked2 = 1
                    TBD_Tip = 1
                else
                util.toast("Hack " .. hack2Status .. "% complete")
                util.yield(math.random(1300, 2900))
                TBD_Tip = 2
                end
            end

            if MWagent_3_CarExactPos:distance(PlayerExactPos) < 50 and hack3Status < 99 then
                hack3Status = hack3Status + math.random(3, 18)
                if hack3Status >=  99 then
                    hack3Status = 100
                    util.toast("Hack complete")
                    TBDtargetHacked3 = 1
                    TBD_Tip = 1
                else
                util.toast("Hack " .. hack3Status .. "% complete")
                util.yield(math.random(1300, 2900))
                TBD_Tip = 2
                end
            end
            

            

            if TBDtargetHacked1 == 1 and TBDtargetHacked2 == 1 and TBDtargetHacked3 == 1 then
                isTBDrunning = 0
                TBDphase = 2
                TBD_Tip = 0
                TBDdialogue = 0
                TBD_ph_Step = 0
                return false
            end

            if TBDphase ~= 1 then
                return false
            end

            if TBDtick7CalledonceEver == 0 then
                return false
            end

            
            

        end)

    end


if TBDtick8CalledonceEver == 0 then
    TBDtick8CalledonceEver = 1
    util.create_tick_handler(function()
        local MWagent_1_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, 0, 0, 0)
        local MWagent_2_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, 0, 0, 0)
        local MWagent_3_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, 0, 0, 0)
        local PlayerExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        if MWagent_1_CarExactPos:distance(PlayerExactPos) < 50 and TBDtargetHacked1 == 0 then
            local MWagent_1_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, 0, 0, 0)
            local blipMWagent_1_Car = ADD_BLIP_FOR_ENTITY(MWagent_1_Car)
            SET_BLIP_SPRITE(blipMWagent_1_Car, 459)
            SET_BLIP_COLOUR(blipMWagent_1_Car, 59)
            SET_BLIP_DISPLAY(blipMWagent_1_Car, 2)
            util.yield(5000)
            util.remove_blip(blipMWagent_1_Car)
            
        elseif MWagent_2_CarExactPos:distance(PlayerExactPos) < 50 and TBDtargetHacked2 == 0 and TBDtargetHacked1 == 1 then
            local MWagent_2_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, 0, 0, 0)
            local blipMWagent_2_Car = ADD_BLIP_FOR_ENTITY(MWagent_2_Car)
            SET_BLIP_SPRITE(blipMWagent_2_Car, 459)
            SET_BLIP_COLOUR(blipMWagent_2_Car, 59)
            SET_BLIP_DISPLAY(blipMWagent_2_Car, 2)
            util.yield(5000)
            util.remove_blip(blipMWagent_2_Car)
            
        elseif MWagent_3_CarExactPos:distance(PlayerExactPos) < 50 and TBDtargetHacked3 == 0 and TBDtargetHacked2 == 1 then
            local MWagent_3_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, 0, 0, 0)
            local blipMWagent_3_Car = ADD_BLIP_FOR_ENTITY(MWagent_3_Car)
            SET_BLIP_SPRITE(blipMWagent_3_Car, 459)
            SET_BLIP_COLOUR(blipMWagent_3_Car, 59)
            SET_BLIP_DISPLAY(blipMWagent_3_Car, 2)
            util.yield(5000)
            util.remove_blip(blipMWagent_3_Car)
            
        end


        if TBDphase ~= 1 then
            return false
        end

        if TBDtick8CalledonceEver == 0 then
            return false
        end

    end)

end

    if TBDtick9CalledonceEver == 0 then
        TBDtick9CalledonceEver = 1
        util.create_tick_handler(function ()--Signal Detector Beep

            local MWagent_1_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_1_Car, 0, 0, 0)
            local MWagent_2_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_2_Car, 0, 0, 0)
            local MWagent_3_CarExactPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(MWagent_3_Car, 0, 0, 0)

            if IS_PED_IN_VEHICLE(players.user_ped(), TBDvehicles[1]) and IS_CONTROL_PRESSED(0, 131) and TBDtargetHacked1 == 0 then
                SET_HORN_ENABLED(SignalDetector, true)
                SET_HORN_PERMANENTLY_ON(SignalDetector)
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_1_CarExactPos) * 2)
                --util.draw_centred_text(TBDPlayerCurrentExactLocation:distance(MWagent_1_CarExactPos) * 2)
                SET_HORN_ENABLED(SignalDetector, false)
                PLAY_DEFERRED_SOUND_FRONTEND("Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_1_CarExactPos) * 2)
            elseif IS_PED_IN_VEHICLE(players.user_ped(), TBDvehicles[1]) and IS_CONTROL_PRESSED(0, 131) and TBDtargetHacked1 == 1 and TBDtargetHacked2 == 0 and TBDtargetHacked3 == 0 then
            
                SET_HORN_ENABLED(SignalDetector, true)
                SET_HORN_PERMANENTLY_ON(SignalDetector)
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_2_CarExactPos) * 2)
                --util.draw_centred_text(TBDPlayerCurrentExactLocation:distance(MWagent_1_CarExactPos) * 2)
                SET_HORN_ENABLED(SignalDetector, false)
                PLAY_DEFERRED_SOUND_FRONTEND("Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_2_CarExactPos) * 2)

            elseif IS_PED_IN_VEHICLE(players.user_ped(), TBDvehicles[1]) and IS_CONTROL_PRESSED(0, 131) and TBDtargetHacked2 == 1 and TBDtargetHacked1 == 1 and TBDtargetHacked3 == 0 then
            
                SET_HORN_ENABLED(SignalDetector, true)
                SET_HORN_PERMANENTLY_ON(SignalDetector)
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_3_CarExactPos) * 2)
                --util.draw_centred_text(TBDPlayerCurrentExactLocation:distance(MWagent_1_CarExactPos) * 2)
                SET_HORN_ENABLED(SignalDetector, false)
                PLAY_DEFERRED_SOUND_FRONTEND("Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                util.yield(TBDPlayerCurrentExactLocation:distance(MWagent_3_CarExactPos) * 2)

            end

            if TBDphase ~= 1 then
                return false
            end

            if TBDtick9CalledonceEver == 0 then
                return false
            end

        end)

    end

    if TBDtick10CalledonceEver == 0 then
        TBDtick9CalledonceEver = 1
        util.create_tick_handler(function () --CheckFail

            FailTBD1()

            if TBDfailMesageShown == 1 then
                return false
            end

            if TBDphase ~= 1 then
                return false
            end

            if TBDtick10CalledonceEver == 0 then
                return false
            end

        end)
    end

    end

end
end


function TBDphase2()
    if TBDphase == 2 then

        if TBDtick21CalledonceEver == 0 then
            TBDtick21CalledonceEver = 1
            util.create_tick_handler(function () --CheckFail
    
                FailTBD2()
    
                if TBDfailMesageShown == 1 then
                    return false
                end
    
                if TBDphase ~= 2 then
                    return false
                end
    
                if TBDtick21CalledonceEver == 0 then
                    return false
                end
    
            end)
        end

        local PlayerCarSpawnPoint = v3.new(1129.4, 262.625, 81)
        local PlayerCarSpawnHeading = 112.4

        local HeliSpawnPoint = v3.new(1909.7, 406.6, 163)
        local HeliSpawnPointSpawnHeading = 67.5
        local heliHash = util.joaat("annihilator2")

        local apcSpawnPoint = v3.new(1873.7, 412.0, 162)
        local apcSpawnPointSpawnHeading = -95
        local apcHash = util.joaat("apc")

        local VetirSpawnPoint1 = v3.new(1857.0, 450.7, 164)
        local VetirSpawnPointSpawnHeading1 = -76
        local VetirHash1 = util.joaat("vetir")
        
        local VetirSpawnPoint2 = v3.new(1892.2, 441.9, 166)
        local VetirSpawnPointSpawnHeading2 = 58
        local VetirHash2 = util.joaat("vetir")

        local BarrageSpawnPoint = v3.new(1867.6, 430.0, 164)
        local BarrageSpawnPointSpawnHeading = 22
        local BarrageHash = util.joaat("barrage")



        if TBDtick22CalledonceEver == 0 then
            TBDtick22CalledonceEver = 1
        util.create_tick_handler(function ()
            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 0 then
                
                util.toast("Make your way to the high ranking officer")
            elseif IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 1 then
                util.toast("Search the high ranking officer's body")
            elseif IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
                util.toast("Reach the end of the data tunnel")
            end
    
            if TBDphase ~= 2 then
                return false
            end

            if TBDtick22CalledonceEver == 0 then
                return false
            end


        end)
    end
        if TBD_ph_Step == 0 then
            TBD_ph_Step = 1
            DO_SCREEN_FADE_OUT(1500)
        util.yield(1500)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
        util.yield(500)
        
        local PlayerCarHash = util.joaat("oracle2")
        util.request_model(PlayerCarHash)

        
        
        local TBDPlayerCar = entities.create_vehicle(PlayerCarHash, PlayerCarSpawnPoint, PlayerCarSpawnHeading)
        SET_VEHICLE_COLOURS(TBDPlayerCar, 147, 26)
            entities.set_can_migrate(TBDPlayerCar, false)
            --util.yield(500)
            SET_ENTITY_AS_MISSION_ENTITY(TBDPlayerCar, true, true)
                local blipPlayerCar = ADD_BLIP_FOR_ENTITY(TBDPlayerCar)
                table.insert(TBDblips, 1, blipPlayerCar)
                SET_BLIP_SPRITE(blipPlayerCar, 530)
                SET_BLIP_DISPLAY(blipPlayerCar, 2)
                SET_BLIP_COLOUR(blipPlayerCar, 13)
            table.insert(TBDvehicles, 1, TBDPlayerCar)
            SET_VEHICLE_RADIO_ENABLED(TBDvehicles[1], false)



            util.request_model(heliHash)
            local TBDheli = entities.create_vehicle(heliHash, HeliSpawnPoint, HeliSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDheli, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDheli, true, true)
                table.insert(TBDvehicles, 2, TBDheli)

                util.request_model(apcHash)
            local TBDapc = entities.create_vehicle(apcHash, apcSpawnPoint, apcSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDapc, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDapc, true, true)
                table.insert(TBDvehicles, 3, TBDapc)

                util.request_model(VetirHash1)
            local TBDvetir1 = entities.create_vehicle(VetirHash1, VetirSpawnPoint1, VetirSpawnPointSpawnHeading1)
                entities.set_can_migrate(TBDvetir1, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDvetir1, true, true)
                table.insert(TBDvehicles, 4, TBDvetir1)

                util.request_model(VetirHash2)
            local TBDvetir2 = entities.create_vehicle(VetirHash2, VetirSpawnPoint2, VetirSpawnPointSpawnHeading2)
                entities.set_can_migrate(TBDvetir2, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDvetir2, true, true)
                table.insert(TBDvehicles, 5, TBDvetir2)

                util.request_model(BarrageHash)
            local TBDbarrage = entities.create_vehicle(BarrageHash, BarrageSpawnPoint, BarrageSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDbarrage, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDbarrage, true, true)
                table.insert(TBDvehicles, 6, TBDbarrage)

    

            SET_ENTITY_COORDS_NO_OFFSET(TBDvehicles[1], PlayerCarSpawnPoint.x, PlayerCarSpawnPoint.y, PlayerCarSpawnPoint.z)
            SET_ENTITY_HEADING(TBDvehicles[1], PlayerCarSpawnHeading)
            SET_PED_INTO_VEHICLE(players.user_ped(), TBDvehicles[1], -1)
        util.yield(500)
            local TBDCutsceneCam = CREATE_CAMERA(26379945, true)
            local TBDCutsceneCamPos = v3.new(1129.3, 262.6, 107.0)
    --goal--TBDCutsceneCamPos = v3.new(-760.9, 776.0, 213.1)
            local TBDCutsceneCamRot = v3.new(-90, 0, 112.4)
        util.yield(100)
            SET_CAM_COORD(TBDCutsceneCam, TBDCutsceneCamPos.x, TBDCutsceneCamPos.y, TBDCutsceneCamPos.z)
            SET_CAM_ROT(TBDCutsceneCam, TBDCutsceneCamRot.x, TBDCutsceneCamRot.y, TBDCutsceneCamRot.z, 2)
            RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0);
            DO_SCREEN_FADE_IN(1500)
        util.yield(1500)
            RENDER_SCRIPT_CAMS(false, true, 8000, 1, 0, 0)

            if TBDtick23CalledonceEver == 0 then
                TBDtick23CalledonceEver = 1
        util.create_tick_handler(function () -- Cutscene Dialogues
    
            if TBDdialogue == 0 then
                util.toast("Earpiece : Great work " .. TBDPlayerName .. " ! Let me compile the results of the hacks to locate the place one of their high ranking officer should be at.")
            elseif TBDdialogue == 1 then
                util.toast("Earpiece : Bingo ! I'm sending you the coordinates.")
            elseif TBDdialogue == 2 then
                util.toast("Earpiece : Once you killed him you should be able to hack his phone to obtain the location of the files.")
            elseif TBDdialogue == 3 then
                return false
            end

            if TBDtick23CalledonceEver == 0 then
                return false
            end

    
        end)
    end
    
        TBDdialogue = 0
        util.yield(5000)
        TBDdialogue = 1
        util.yield(4000)
        TBDdialogue = 2
    
            FREEZE_ENTITY_POSITION(players.user_ped(), false)
        
            util.yield(1000)
            util.toast("Make your way to the high ranking officer")

        for i = math.random(8, 14), 0, -1 do
            TBDSpawnMWmercenaries()
        end
    
        TBDSpawnMWmercenaryBoss()
    
        for i = math.random(22, 35), 0, -1 do
            TBDSpawnFlamables()
        end

        util.yield(4000)
        DESTROY_CAM(TBDCutsceneCam)
        for i, pedO in TBDpedsOther do
            SET_ENTITY_INVINCIBLE(TBDpedsOther[i], false)
        end
        SET_ENTITY_INVINCIBLE(TBDpeds[1], false)
        
    
        util.yield(4000)
        TBDdialogue = 3
    
        end
    end

end





function TBDphase3()
if TBDphase == 3 then

    if TBDtick39CalledonceEver == 0 then
        TBDtick39CalledonceEver = 1
        util.create_tick_handler(function () --CheckFail

            FailTBD3()

            if TBDfailMesageShown == 1 then
                return false
            end

            if TBDphase ~= 2 then
                return false
            end

            if TBDtick39CalledonceEver == 0 then
                return false
            end

        end)
    end

    local HeliSpawnPoint = v3.new(1909.7, 406.6, 163)
    local HeliSpawnPointSpawnHeading = 67.5
    local heliHash = util.joaat("annihilator2")

    local apcSpawnPoint = v3.new(1873.7, 412.0, 162)
    local apcSpawnPointSpawnHeading = -95
    local apcHash = util.joaat("apc")

    local VetirSpawnPoint1 = v3.new(1857.0, 450.7, 164)
    local VetirSpawnPointSpawnHeading1 = -76
    local VetirHash1 = util.joaat("vetir")
    
    local VetirSpawnPoint2 = v3.new(1892.2, 441.9, 166)
    local VetirSpawnPointSpawnHeading2 = 58
    local VetirHash2 = util.joaat("vetir")

    local BarrageSpawnPoint = v3.new(1867.6, 430.0, 164)
    local BarrageSpawnPointSpawnHeading = 22
    local BarrageHash = util.joaat("barrage")

    local BlipHangarLoc = v3.new(136, -3200, 6)
    local BlipHangarRadius = 25

    local PlayerCarSpawnPoint = v3.new(1906.8, 569.5, 176)
    local PlayerCarSpawnHeading = -114.5

    local FlatbedSpawnPoint = v3.new(141.8, -3208.4, 7)
    local FlatbedSpawnHeading = -66

    local ToreadorSpawnPoint = v3.new(141.8, -3208.4, 10)
    local ToreadorSpawnHeading = -66

    local LuxWP1 = v3.new(3100.1, -4798.6, 2)
    local LuxWP2 = v3.new(3076.5, -4706.5, 10.5)
    local LuxWP3 = v3.new(3091.6, -4702.2, 18.5)
    local LuxWP4 = v3.new(3087, -4699.3, 27)
    
    local LuxBriefcaseSpawn = v3.new(3085.1, -4685.7, 28)



    local PlayerCarHash = util.joaat("oracle2")
    util.request_model(PlayerCarHash)

    local TBDPlayerCar = entities.create_vehicle(PlayerCarHash, PlayerCarSpawnPoint, PlayerCarSpawnHeading)
        SET_VEHICLE_COLOURS(TBDPlayerCar, 147, 26)
            entities.set_can_migrate(TBDPlayerCar, false)
            --util.yield(500)
            SET_ENTITY_AS_MISSION_ENTITY(TBDPlayerCar, true, true)
                local blipPlayerCar = ADD_BLIP_FOR_ENTITY(TBDPlayerCar)
                table.insert(TBDblips, 1, blipPlayerCar)
                SET_BLIP_SPRITE(blipPlayerCar, 530)
                SET_BLIP_DISPLAY(blipPlayerCar, 2)
                SET_BLIP_COLOUR(blipPlayerCar, 13)
            table.insert(TBDvehicles, 1, TBDPlayerCar)
            SET_VEHICLE_RADIO_ENABLED(TBDvehicles[1], false)

            local FlatbedHash = util.joaat("flatbed")
            util.request_model(FlatbedHash)

            local TBDflatbed = entities.create_vehicle(FlatbedHash, FlatbedSpawnPoint, FlatbedSpawnHeading)
            entities.set_can_migrate(TBDflatbed, false)
            --util.yield(500)
            SET_ENTITY_AS_MISSION_ENTITY(TBDflatbed, true, true)
            table.insert(TBDvehicles, 2, TBDflatbed)

            local ToreadorHash = util.joaat("toreador")
            util.request_model(ToreadorHash)

            local TBDtoreador = entities.create_vehicle(ToreadorHash, ToreadorSpawnPoint, ToreadorSpawnHeading)
            entities.set_can_migrate(TBDtoreador, false)
            --util.yield(500)
            SET_ENTITY_AS_MISSION_ENTITY(TBDtoreador, true, true)
            table.insert(TBDvehicles, 3, TBDtoreador)
            util.yield(500)
            ATTACH_ENTITY_TO_ENTITY(TBDvehicles[3], TBDvehicles[2], 0, 0, -2, 0.75, 0, 0, 0, true, false, false, true, 0, true, 0)

            
            

            util.request_model(heliHash)
            local TBDheli = entities.create_vehicle(heliHash, HeliSpawnPoint, HeliSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDheli, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDheli, true, true)
                table.insert(TBDvehicles, 4, TBDheli)

                util.request_model(apcHash)
            local TBDapc = entities.create_vehicle(apcHash, apcSpawnPoint, apcSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDapc, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDapc, true, true)
                table.insert(TBDvehicles, 5, TBDapc)

                util.request_model(VetirHash1)
            local TBDvetir1 = entities.create_vehicle(VetirHash1, VetirSpawnPoint1, VetirSpawnPointSpawnHeading1)
                entities.set_can_migrate(TBDvetir1, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDvetir1, true, true)
                table.insert(TBDvehicles, 6, TBDvetir1)

                util.request_model(VetirHash2)
            local TBDvetir2 = entities.create_vehicle(VetirHash2, VetirSpawnPoint2, VetirSpawnPointSpawnHeading2)
                entities.set_can_migrate(TBDvetir2, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDvetir2, true, true)
                table.insert(TBDvehicles, 7, TBDvetir2)

                util.request_model(BarrageHash)
            local TBDbarrage = entities.create_vehicle(BarrageHash, BarrageSpawnPoint, BarrageSpawnPointSpawnHeading)
                entities.set_can_migrate(TBDbarrage, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDbarrage, true, true)
                table.insert(TBDvehicles, 8, TBDbarrage)



            local HangarBlip = ADD_BLIP_FOR_RADIUS(BlipHangarLoc.x, BlipHangarLoc.y, BlipHangarLoc.z, BlipHangarRadius)
            table.insert(TBDblips, 2, HangarBlip)
            SET_BLIP_ALPHA(HangarBlip, 90)
            SET_BLIP_COLOUR(HangarBlip, 5)
            SET_BLIP_DISPLAY(HangarBlip, 2)
            table.insert( TBDblipsOther, 1, HangarBlip)
    

    if TBDtick30CalledonceEver == 0 then
        TBDtick30CalledonceEver = 1
        util.create_tick_handler(function ()

            TBDPlayerCurrentExactLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
    
            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 1 then
              

                util.toast("Go to Elysian Island")
            end
    
            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
                
                util.toast("Steal the Toreador")
            end

            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 3 then
                
                util.toast("Board the USS Luxington")
            end

            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 4 then
                
                util.toast("Fight your way to the command tower")
            end

            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 5 then
                
                util.toast("Search the command tower")
            end

            if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 6 then
                
                util.toast("Escape the area")
            end

            local PlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            local ToreadorOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDvehicles[3], 0, 0, 0)

            if PlayerOffset:distance(BlipHangarLoc) < BlipHangarRadius and TBD_Tip == 1 and IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
                TBD_Tip = 2
                util.toast("Steal the Toreador")
                ToreadorCanBeDestroyed = 1
            end

            if PlayerOffset:distance(ToreadorSpawnPoint) < 10 then
                if TBDtick33CalledonceEver == 0 then
                    TBDtick33CalledonceEver = 1
                    local ToreadorBlip = ADD_BLIP_FOR_ENTITY(TBDtoreador)
                    SET_BLIP_SPRITE(ToreadorBlip, 595)
                    SET_BLIP_COLOUR(ToreadorBlip, 81)
                    SET_BLIP_DISPLAY(ToreadorBlip, 2)
                    table.insert(TBDblips, 2, ToreadorBlip)
                end
            end

            if PlayerOffset:distance(ToreadorOffset) < 8 and IS_ENTITY_ATTACHED(TBDvehicles[3]) then
                util.toast("Press -Left arrow key- to detach the Toreador from the Flatbed")
                if IS_CONTROL_PRESSED(0, 189) then
                    DETACH_ENTITY(TBDvehicles[3], true, true)
                end
            end

            if IS_PED_IN_VEHICLE(players.user_ped(), TBDheli) then
                util.yield(30000)
                SET_VEHICLE_ENGINE_HEALTH(TBDheli, -1)
            end

            local PlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

            if IS_PED_IN_VEHICLE(players.user_ped(),  TBDtoreador) or (LuxBriefcaseSpawn:distance(PlayerLoc) < 500 and IS_PED_IN_ANY_VEHICLE(players.user_ped())) then

                if TBDtick35CalledonceEver == 0 then 
                    TBDtick35CalledonceEver = 1

                    TBD_Tip = 3
                    SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(TBDtoreador, true, true)
                    util.remove_blip(HangarBlip)
                    util.toast("Board the USS Luxington")

                    local LuxBlipLoc = v3.new(3088, -4815, 1, 20)
                    local LuxBlipRadius = 20
                    local LuxBlip = ADD_BLIP_FOR_RADIUS(LuxBlipLoc.x, LuxBlipLoc.y, LuxBlipLoc.z, LuxBlipRadius) -- Luxington
                    SET_BLIP_ALPHA(LuxBlip, 90)
                    SET_BLIP_COLOUR(LuxBlip, 5)
                    SET_BLIP_DISPLAY(LuxBlip, 2)
                    table.insert( TBDblips, 3, LuxBlip )

                    if TBDtick36CalledonceEver == 0 then 
                        TBDtick36CalledonceEver = 1

                        local indicatorArrowLuxHash = util.joaat("prop_mk_arrow_3d")
                        util.request_model(indicatorArrowLuxHash)

                        local indicatorArrowLuxLocSpawn = v3.new(0, 0, 0)
                        local indicatorArrowLux = entities.create_object(indicatorArrowLuxHash, indicatorArrowLuxLocSpawn, 0)
                        entities.set_can_migrate(indicatorArrowLux, false)
                        --util.yield(500)
                        SET_ENTITY_AS_MISSION_ENTITY(indicatorArrowLux, true, true)
                        table.insert( TBDobjects, 1, indicatorArrowLux )
                        local blipLuxArrow = ADD_BLIP_FOR_ENTITY(indicatorArrowLux)
                        SET_BLIP_SPRITE(blipLuxArrow, 12) -- Boss 630
                        SET_BLIP_COLOUR(blipLuxArrow, 5)
                        SET_BLIP_DISPLAY(blipLuxArrow, 2)
                        SET_BLIP_SCALE(blipLuxArrow, 0.8)
                        table.insert(TBDblips, 4, blipLuxArrow)

                        local LuxArrowWP = 1
                        local BlipApeared = 0

                        util.create_tick_handler(function()

                            --util.toast("boop")
                            local camHeading = GET_GAMEPLAY_CAM_ROT(0)
                            SET_ENTITY_ROTATION(indicatorArrowLux, 0, 180, camHeading.z)
                            --util.toast("blep")
                            
                            if LuxArrowWP == 1 then
                                SET_ENTITY_COORDS_NO_OFFSET(indicatorArrowLux, LuxWP1.x, LuxWP1.y, LuxWP1.z)
                            elseif LuxArrowWP == 2 then
                                SET_ENTITY_COORDS_NO_OFFSET(indicatorArrowLux, LuxWP2.x, LuxWP2.y, LuxWP2.z)
                            elseif LuxArrowWP == 3 then
                                SET_ENTITY_COORDS_NO_OFFSET(indicatorArrowLux, LuxWP3.x, LuxWP3.y, LuxWP3.z)
                            elseif LuxArrowWP == 4 then
                                SET_ENTITY_COORDS_NO_OFFSET(indicatorArrowLux, LuxWP4.x, LuxWP4.y, LuxWP4.z)
                            elseif LuxArrowWP == 5 then
                                SET_ENTITY_COORDS_NO_OFFSET(indicatorArrowLux, 0, 0, 0)
                            end
                            
                            local PlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

                            if PlayerLoc.z < 1 then
                                LuxArrowWP = 1
                            end

                            if PlayerLoc:distance(LuxWP1) < 2 then
                                LuxArrowWP = 2
                                util.remove_blip(TBDblips[3])
                            end

                            if PlayerLoc:distance(LuxWP2) < 2 then
                                LuxArrowWP = 3
                            end

                            if PlayerLoc:distance(LuxWP3) < 2 then
                                LuxArrowWP = 4
                            end

                            if PlayerLoc:distance(LuxWP4) < 2 and BlipApeared == 0 then
                                LuxArrowWP = 5
                                BlipApeared = 1
                                TBD_Tip = 5
                                util.toast("Search the command tower")
                                util.remove_blip(LuxArrowWP)
                                util.remove_blip(LuxBlip)
                                local LuxCabinBlipLoc = v3.new(3085.5, -4689.2, 28)
                                local LuxCabinBlipRadius = 20
                                local LuxCabinBlip = ADD_BLIP_FOR_RADIUS(LuxCabinBlipLoc.x, LuxCabinBlipLoc.y, LuxCabinBlipLoc.z, LuxCabinBlipRadius) -- Luxington
                                SET_BLIP_ALPHA(LuxCabinBlip, 90)
                                SET_BLIP_COLOUR(LuxCabinBlip, 5)
                                SET_BLIP_DISPLAY(LuxCabinBlip, 2)
                                table.insert( TBDblips, 4, LuxCabinBlip )
                            end

                            if PlayerLoc:distance(LuxBlipLoc) < LuxBlipRadius/1.5 then
                                util.toast("Fight your way to the command tower")
                                TBD_Tip = 4
                                util.remove_blip(LuxBlip)
                            end


                            
                            if TBDphase ~= 3 then
                                return false
                            end
                    
                            if TBDtick36CalledonceEver == 0 then
                                return false
                            end
                        
                        end)
                    end
                end
            end

    
            if TBDphase ~= 3 then
                return false
            end
    
            if TBDtick30CalledonceEver == 0 then
                return false
            end
        end)
    end

    if TBD_ph_Step == 0 then
        TBD_ph_Step = 1
        DO_SCREEN_FADE_OUT(1500)
    util.yield(1500)
    local SavedPlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            util.yield(500)
            SET_ENTITY_COORDS(players.user_ped(), 138, -3200, 6)

            for i = math.random(6, 9), 0, -1 do
                TBDSpawnMWguards()
            end
        
            util.yield(1000)
        
            for i = math.random(4, 8), 0, -1 do
                TBDSpawnFlamables2()
            end

            util.yield(1000)

            
            


            menu.trigger_commands('ussluxington on')

            --[[local LuxIPL1 = REQUEST_IPL("hei_carrier_lodlights")
            local LuxIPL2 = REQUEST_IPL("hei_carrier")
            local LuxIPL3 = REQUEST_IPL("hei_carrier_int1")
            local LuxIPL4 = REQUEST_IPL("hei_carrier_int2")
            local LuxIPL5 = REQUEST_IPL("hei_carrier_int3")
            local LuxIPL6 = REQUEST_IPL("hei_carrier_int4")
            local LuxIPL7 = REQUEST_IPL("hei_carrier_int5")
            local LuxIPL8 = REQUEST_IPL("hei_carrier_int6")]]

            --table.insert(TBDipls, 1, LuxIPL1)
            --table.insert(TBDipls, 1, LuxIPL2)
            --table.insert(TBDipls, 1, LuxIPL3)
            --table.insert(TBDipls, 1, LuxIPL4)
            --table.insert(TBDipls, 1, LuxIPL5)
            --table.insert(TBDipls, 1, LuxIPL6)
            --table.insert(TBDipls, 1, LuxIPL7)
            --table.insert(TBDipls, 1, LuxIPL8)

            util.yield(500)
            SET_ENTITY_COORDS(players.user_ped(), SavedPlayerPos.x, SavedPlayerPos.y, SavedPlayerPos.z)
        FREEZE_ENTITY_POSITION(players.user_ped(), true)
    util.yield(500)
        SET_ENTITY_COORDS_NO_OFFSET(TBDPlayerCar, PlayerCarSpawnPoint.x, PlayerCarSpawnPoint.y, PlayerCarSpawnPoint.z)
        SET_ENTITY_HEADING(TBDPlayerCar, PlayerCarSpawnHeading)
     util.yield(500)
     SET_PED_INTO_VEHICLE(players.user_ped(), TBDPlayerCar, -1)
    local TBDCutsceneCamPos = v3.new(1912.0, 541.3, 180.0)
--goal--TBDCutsceneCamPos = v3.new(-760.9, 776.0, 213.1)
    local TBDCutsceneCamRot = v3.new(-5, 0, 10)
    util.yield(100)
        local TBDCutsceneCam = CREATE_CAMERA(26379945, true)
        SET_CAM_COORD(TBDCutsceneCam, TBDCutsceneCamPos.x, TBDCutsceneCamPos.y, TBDCutsceneCamPos.z)
        SET_CAM_ROT(TBDCutsceneCam, TBDCutsceneCamRot.x, TBDCutsceneCamRot.y, TBDCutsceneCamRot.z, 2)
        RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0);
        FREEZE_ENTITY_POSITION(players.user_ped(), false)
        DO_SCREEN_FADE_IN(1500)
    util.yield(1500)
        RENDER_SCRIPT_CAMS(false, true, 8000, 1, 0, 0)

    if TBDtick29CalledonceEver == 0 then
        TBDtick29CalledonceEver = 1
        util.create_tick_handler(function()
            if TBDdialogue == -1 then
                util.toast("Earpiece : The Luxington ? I knew you would say that")
            elseif TBDdialogue == 1 then
                util.toast("Earpiece : There is a submarine car on Elysian Island, we'll be able to 'borrow' it from Merryweather")
            elseif TBDdialogue == 2 then
                util.toast("Earpiece : Lucky for us the USS Luxington is near the South-East coast of Los Santos as we speak. You'll have to board it and retrieve the file")
            elseif TBDdialogue == 3 then
                
            end

            if TBDphase ~= 3 then
                return false
            end
    
            if TBDtick29CalledonceEver == 0 then
                util.yield(8000)
                DESTROY_CAM(TBDCutsceneCam)
                return false
            end


        end)

    end


        TBDdialogue = -1
        util.yield(4000)
        TBDdialogue = 1
        util.yield(5000)
        TBDdialogue = 2
        util.yield(5000)
        TBDdialogue = 3
        util.yield(5000)
        TBD_Tip = 1
        util.toast("Go to Elysian Island")


        for i = math.random(50, 120), 0, -1 do
            TBDSpawnMWmarines()
            util.yield(50)
        end

        TBDSpawnMWcommander()
    
    
        for i = math.random(80, 150), 0, -1 do
            TBDSpawnFlamables3()
            util.yield(50)
        end

        for i = math.random(6, 10), 0, -1 do
            TBDSpawnAttackSubmarines()
            util.yield(100)
        end

        util.yield(1000)

        for i = math.random(10, 12), 0, -1 do
            TBDSpawnBoats()
            util.yield(100)
        end


            local BriefcaseCollected = 0
            local LuxBriefcaseSpawn = v3.new(3083.92, -4686.34, 27)
            local LuxBriefcaseHash = util.joaat("hei_p_attache_case_shut")
            util.request_model(LuxBriefcaseHash)
            local LuxBriefcase = entities.create_object(LuxBriefcaseHash, LuxBriefcaseSpawn, 0)
            --PLAY_DEFERRED_SOUND_FRONTEND("BACK", "HUD_FREEMODE_SOUNDSET");
            --PLAY_DEFERRED_SOUND_FRONTEND("Hack_Success", "DLC_GR_Steal_Railguns_Sounds");
            --PLAY_DEFERRED_SOUND_FRONTEND("Success", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
            --PLAY_DEFERRED_SOUND_FRONTEND("Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
            --PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
            --PLAY_DEFERRED_SOUND_FRONTEND("Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
            --PLAY_DEFERRED_SOUND_FRONTEND("Trail_Custom", "DLC_HEIST_HACKING_SNAKE_SOUNDS"); -- CANNOT BE STOPPED

            --PLAY_DEFERRED_SOUND_FRONTEND("Turn", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
            --PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
            --PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
            entities.set_can_migrate(LuxBriefcase, false)
            --util.yield(500)
            SET_ENTITY_AS_MISSION_ENTITY(LuxBriefcase, true, true)
            FREEZE_ENTITY_POSITION(LuxBriefcase, true)
            --table.insert(TBDobjects, 1, LuxBriefcase)

            if TBDtick37CalledonceEver == 0 then
                TBDtick37CalledonceEver = 1
                util.create_tick_handler(function()

                    local PlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                    local LuxBriefcaseLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(LuxBriefcase, 0, 0, 0)

                    if PlayerLoc:distance(LuxBriefcaseLoc) < 1 and BriefcaseCollected == 0 then
                        BriefcaseCollected = 1
                        PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds"); -- 3 times so its louder ;)
                        PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
                        PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
                        entities.delete(LuxBriefcase)
                        util.toast("You collected the Merryweather file")
                        util.remove_blip(HangarBlip)
                        util.remove_blip(TBDblips[3])
                        util.remove_blip(TBDblips[3])
                        util.remove_blip(TBDblips[4])
                        util.yield(2000)
                        TBD_Tip = 6
                        util.toast("Escape the area")
                    end

                    if DOES_ENTITY_EXIST(LuxBriefcase) then
                    end

                    if BriefcaseCollected == 1 then

                        local LuxCabinLoc = v3.new(3085.5, -4689.2, 28)
                        local LuxCabinEscapeRadius = 1000
                                
                        if PlayerLoc:distance(LuxCabinLoc) > LuxCabinEscapeRadius then
                            TBDvictory()
                        end
                    end

                    if TBDphase ~= 3 then
                        return false
                    end
            
                    if TBDtick37CalledonceEver == 0 then
                        return false
                    end
        
        
                end)
            end
    end
end
end

TBDEquipementList = {"p_secret_weapon_02", "prop_box_ammo03a_set", "prop_box_ammo03a_set2", "prop_air_cargo_04a", "prop_air_cargo_04b", "prop_air_cargo_04c", "hei_prop_carrier_cargo_04a", "hei_prop_carrier_cargo_02a", "hei_prop_carrier_cargo_01a", "hei_prop_carrier_cargo_05b"}

function TBDphase4()
    if TBDphase == 4 then
    
        if TBDtick51CalledonceEver == 0 then
            TBDtick51CalledonceEver = 1
            util.create_tick_handler(function () --CheckFail
    
                FailTBD4()
    
                if TBDfailMesageShown == 1 then
                    return false
                end
    
                if TBDphase ~= 4 then
                    return false
                end
    
                if TBDtick51CalledonceEver == 0 then
                    return false
                end
    
            end)
        end
    
        local HeliSpawnPoint = v3.new(1909.7, 406.6, 163)
        local HeliSpawnPointSpawnHeading = 67.5
        local heliHash = util.joaat("annihilator2")
    
        local apcSpawnPoint = v3.new(1873.7, 412.0, 162)
        local apcSpawnPointSpawnHeading = -95
        local apcHash = util.joaat("apc")
    
        local VetirSpawnPoint1 = v3.new(1857.0, 450.7, 164)
        local VetirSpawnPointSpawnHeading1 = -76
        local VetirHash1 = util.joaat("vetir")
        
        local VetirSpawnPoint2 = v3.new(1892.2, 441.9, 166)
        local VetirSpawnPointSpawnHeading2 = 58
        local VetirHash2 = util.joaat("vetir")
    
        local BarrageSpawnPoint = v3.new(1867.6, 430.0, 164)
        local BarrageSpawnPointSpawnHeading = 22
        local BarrageHash = util.joaat("barrage")
    
        local BlipHangarLoc = v3.new(136, -3200, 6)
        local BlipHangarRadius = 25
    
        local PlayerCarSpawnPoint = v3.new(1906.8, 569.5, 176)
        local PlayerCarSpawnHeading = -114.5
    
        local FlatbedSpawnPoint = v3.new(789.5, 1278.2, 362)
        local FlatbedSpawnHeading = -58
    
        local RuinerSpawnPoint = v3.new(788.5, 1290.9, 360)
        local RuinerSpawnHeading = -136

        local AntonovSpawnPoint = v3.new(-924.4, -3185.8, 22)
        local AntonovSpawnHeading = 59.9
        local showAntonovBlip = 0
    
        local LuxWP1 = v3.new(3100.1, -4798.6, 2)
        local LuxWP2 = v3.new(3076.5, -4706.5, 10.5)
        local LuxWP3 = v3.new(3091.6, -4702.2, 18.5)
        local LuxWP4 = v3.new(3087, -4699.3, 27)
        
        local LuxBriefcaseSpawn = v3.new(3085.1, -4685.7, 28)
    
    
    
        local PlayerCarHash = util.joaat("oracle2")
        util.request_model(PlayerCarHash)
    
        local TBDPlayerCar = entities.create_vehicle(PlayerCarHash, PlayerCarSpawnPoint, PlayerCarSpawnHeading)
            SET_VEHICLE_COLOURS(TBDPlayerCar, 147, 26)
                entities.set_can_migrate(TBDPlayerCar, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDPlayerCar, true, true)
                    local blipPlayerCar = ADD_BLIP_FOR_ENTITY(TBDPlayerCar)
                    table.insert(TBDblips, 1, blipPlayerCar)
                    SET_BLIP_SPRITE(blipPlayerCar, 530)
                    SET_BLIP_DISPLAY(blipPlayerCar, 2)
                    SET_BLIP_COLOUR(blipPlayerCar, 13)
                table.insert(TBDvehicles, 1, TBDPlayerCar)
                SET_VEHICLE_RADIO_ENABLED(TBDvehicles[1], false)
    
                local FlatbedHash = util.joaat("flatbed")
                util.request_model(FlatbedHash)
    
                local TBDflatbed = entities.create_vehicle(FlatbedHash, FlatbedSpawnPoint, FlatbedSpawnHeading)
                entities.set_can_migrate(TBDflatbed, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDflatbed, true, true)
                table.insert(TBDvehicles, 2, TBDflatbed)
    
                local RuinerHash = util.joaat("Ruiner2")
                util.request_model(RuinerHash)
    
                local TBDruiner = entities.create_vehicle(RuinerHash, RuinerSpawnPoint, RuinerSpawnHeading)
                entities.set_can_migrate(TBDruiner, false)
                --util.yield(500)
                SET_ENTITY_AS_MISSION_ENTITY(TBDruiner, true, true)
                table.insert(TBDvehicles, 3, TBDruiner)
                local RuinerBlip = ADD_BLIP_FOR_ENTITY(TBDruiner)
                    SET_BLIP_SPRITE(RuinerBlip, 530)
                    SET_BLIP_COLOUR(RuinerBlip, 81)
                    SET_BLIP_DISPLAY(RuinerBlip, 2)
                    table.insert(TBDblips, 2, RuinerBlip)
                util.yield(500)
    
                
                
                
    
                util.request_model(heliHash)
                local TBDheli = entities.create_vehicle(heliHash, HeliSpawnPoint, HeliSpawnPointSpawnHeading)
                    entities.set_can_migrate(TBDheli, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDheli, true, true)
                    table.insert(TBDvehicles, 4, TBDheli)
    
                    util.request_model(apcHash)
                local TBDapc = entities.create_vehicle(apcHash, apcSpawnPoint, apcSpawnPointSpawnHeading)
                    entities.set_can_migrate(TBDapc, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDapc, true, true)
                    table.insert(TBDvehicles, 5, TBDapc)
    
                    util.request_model(VetirHash1)
                local TBDvetir1 = entities.create_vehicle(VetirHash1, VetirSpawnPoint1, VetirSpawnPointSpawnHeading1)
                    entities.set_can_migrate(TBDvetir1, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDvetir1, true, true)
                    table.insert(TBDvehicles, 6, TBDvetir1)
    
                    util.request_model(VetirHash2)
                local TBDvetir2 = entities.create_vehicle(VetirHash2, VetirSpawnPoint2, VetirSpawnPointSpawnHeading2)
                    entities.set_can_migrate(TBDvetir2, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDvetir2, true, true)
                    table.insert(TBDvehicles, 7, TBDvetir2)
    
                    util.request_model(BarrageHash)
                local TBDbarrage = entities.create_vehicle(BarrageHash, BarrageSpawnPoint, BarrageSpawnPointSpawnHeading)
                    entities.set_can_migrate(TBDbarrage, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDbarrage, true, true)
                    table.insert(TBDvehicles, 8, TBDbarrage)
    
                    local AntonovHash = util.joaat("cargoplane")
                    util.request_model(AntonovHash)
    
                    local TBDantonov = entities.create_vehicle(AntonovHash, AntonovSpawnPoint, AntonovSpawnHeading)
                    SET_ENTITY_INVINCIBLE(TBDantonov, true)
                    entities.set_can_migrate(TBDantonov, false)
                    --util.yield(500)
                    SET_ENTITY_AS_MISSION_ENTITY(TBDantonov, true, true)
                    table.insert(TBDvehicles, 9, TBDantonov)

                    
                    for i = math.random(12, 18), 0, -1 do
                        SpawnTBDantonovEquipement()
                    end

                
                
        
    
        if TBDtick52CalledonceEver == 0 then
            TBDtick52CalledonceEver = 1
            util.create_tick_handler(function ()
    
                TBDPlayerCurrentExactLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 1 then
                  
    
                    util.toast("Go to Vinewood Hills and steal the Ruiner 2000")
                end
        
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
                    
                    util.toast("Steal the Ruiner 2000")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 3 then
                    
                    util.toast("Go to LSIA")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 4 then
                    
                    util.toast("Hack the Antonov's rear door")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 5 then
                    
                    util.toast("Get in the Antonov")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 6 then
                    
                    --util.toast("Escape the area")
                end
    
                local PlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                local ToreadorOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDvehicles[3], 0, 0, 0)


                if TBDphase ~= 4 then
                    return false
                end
        
                if TBDtick52CalledonceEver == 0 then
                    return false
                end


            end)
        end

        if TBD_ph_Step == 0 then
            TBD_ph_Step = 1
            DO_SCREEN_FADE_OUT(1500)
        util.yield(1500)
        local SavedPlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                util.yield(500)
                SET_ENTITY_COORDS(players.user_ped(), 138, -3200, 6)
    
                for i = math.random(5, 7), 0, -1 do
                    TBDSpawnMWguards2()
                end
            
                util.yield(1000)
            
                for i = math.random(5, 8), 0, -1 do
                    TBDSpawnFlamables4()
                end
    
                util.yield(1000)
    
                
    
    
                --menu.trigger_commands('iplcayopercio on') -- lol they misspelled it
    
                --[[local LuxIPL1 = REQUEST_IPL("hei_carrier_lodlights")
                local LuxIPL2 = REQUEST_IPL("hei_carrier")
                local LuxIPL3 = REQUEST_IPL("hei_carrier_int1")
                local LuxIPL4 = REQUEST_IPL("hei_carrier_int2")
                local LuxIPL5 = REQUEST_IPL("hei_carrier_int3")
                local LuxIPL6 = REQUEST_IPL("hei_carrier_int4")
                local LuxIPL7 = REQUEST_IPL("hei_carrier_int5")
                local LuxIPL8 = REQUEST_IPL("hei_carrier_int6")]]
    
                --table.insert(TBDipls, 1, LuxIPL1)
                --table.insert(TBDipls, 1, LuxIPL2)
                --table.insert(TBDipls, 1, LuxIPL3)
                --table.insert(TBDipls, 1, LuxIPL4)
                --table.insert(TBDipls, 1, LuxIPL5)
                --table.insert(TBDipls, 1, LuxIPL6)
                --table.insert(TBDipls, 1, LuxIPL7)
                --table.insert(TBDipls, 1, LuxIPL8)
    
                util.yield(500)
                SET_ENTITY_COORDS(players.user_ped(), SavedPlayerPos.x, SavedPlayerPos.y, SavedPlayerPos.z)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
        util.yield(500)
            SET_ENTITY_COORDS_NO_OFFSET(TBDPlayerCar, PlayerCarSpawnPoint.x, PlayerCarSpawnPoint.y, PlayerCarSpawnPoint.z)
            SET_ENTITY_HEADING(TBDPlayerCar, PlayerCarSpawnHeading)
         util.yield(500)
         SET_PED_INTO_VEHICLE(players.user_ped(), TBDPlayerCar, -1)
        local TBDCutsceneCamPos = v3.new(1912.0, 541.3, 180.0)
    --goal--TBDCutsceneCamPos = v3.new(-760.9, 776.0, 213.1)
        local TBDCutsceneCamRot = v3.new(-5, 0, 10)
        util.yield(100)
            local TBDCutsceneCam = CREATE_CAMERA(26379945, true)
            SET_CAM_COORD(TBDCutsceneCam, TBDCutsceneCamPos.x, TBDCutsceneCamPos.y, TBDCutsceneCamPos.z)
            SET_CAM_ROT(TBDCutsceneCam, TBDCutsceneCamRot.x, TBDCutsceneCamRot.y, TBDCutsceneCamRot.z, 2)
            RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0);
            FREEZE_ENTITY_POSITION(players.user_ped(), false)
            DO_SCREEN_FADE_IN(1500)
        util.yield(1500)
            RENDER_SCRIPT_CAMS(false, true, 8000, 1, 0, 0)
    
        if TBDtick53CalledonceEver == 0 then
            TBDtick53CalledonceEver = 1
            util.create_tick_handler(function()
                if TBDdialogue == -1 then
                    util.toast("Earpiece : Cayo Perico it is... Very well. A plane is supposed to take off from LSIA very soon to drop some cargo on the island. How about we add ourself as a little gift to the mix ?")
                elseif TBDdialogue == 1 then
                    util.toast("Earpiece : You're gonna need a Ruiner 2000 if you want to survive once you've landed on the island...")
                elseif TBDdialogue == 2 then
                    util.toast("Earpiece : There ! I located one in Vinewood Hills, this will be our only chance to get one")
                elseif TBDdialogue == 3 then
                    
                end
    
                if TBDphase ~= 4 then
                    return false
                end
        
                if TBDtick53CalledonceEver == 0 then
                    util.yield(8000)
                    DESTROY_CAM(TBDCutsceneCam)
                    return false
                end
    
    
            end)
    
        
        
        
        
        
        
if TBDtick54CalledonceEver == 0 then
    TBDtick54CalledonceEver = 1

    local doorHack = 0
    local AntonovTakeoff = 0
    local AntonovPitchUp = 0
    local AntonovCurrentPitch = 0
    local AntonovAccelerate = 0
    local AntonovSpeed = 0
    local doorOpened = 0

    local cutsceneOn = 0
    local stopLoop = 0
    local win = 0
    local Lost = 0
    
    local TBDCutscene2Cam = CREATE_CAMERA(26379945, true)
    
    util.create_tick_handler(function()
            --SET_PED_INTO_VEHICLE(players.user_ped(), TBDantonov, -1)
        
        if IS_PED_IN_VEHICLE(players.user_ped(), TBDruiner) and showAntonovBlip == 0 then
            
            showAntonovBlip = 1
            TBD_Tip = 3
            util.toast("Go to LSIA")
            local AntonovZoneBlip = ADD_BLIP_FOR_RADIUS(AntonovSpawnPoint.x, AntonovSpawnPoint.y, AntonovSpawnPoint.z, 300)
            table.insert(TBDblips, 2, AntonovZoneBlip)
            SET_BLIP_ALPHA(AntonovZoneBlip, 90)
            SET_BLIP_COLOUR(AntonovZoneBlip, 5)
            SET_BLIP_DISPLAY(AntonovZoneBlip, 2)
            table.insert( TBDblipsOther, 1, AntonovZoneBlip)

            util.create_tick_handler(function()

                local PlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDruiner,0 ,0 ,0)
                local AntonovPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,0 ,0)
                local AntonovDoorPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,-30 ,0)

                if showAntonovBlip == 1 and PlayerPos:distance(AntonovPos) < 200 then

                    showAntonovBlip = 2
                    local AntonovBlip = ADD_BLIP_FOR_ENTITY(TBDantonov)
                    SET_BLIP_SPRITE(AntonovBlip, 572)
                    SET_BLIP_COLOUR(AntonovBlip, 47)
                    SET_BLIP_DISPLAY(AntonovBlip, 2)
                    table.insert(TBDblips, 3, AntonovBlip)
                    util.remove_blip(AntonovZoneBlip)
                    TBD_Tip = 4
                    util.toast("Hack the Antonov's rear door")
                    AntonovTakeoff = 1
                    AntonovAccelerate = 1
                    util.yield(20000)
                    --TooLateAntonovCutscene = 1
                    util.yield(5000)
                    AntonovPitchUp = 1
                    util.yield(3000)
                    Lost = 1
                    AntonovPitchUp = 0
                end


                


            end)

            util.create_tick_handler(function()
                
                local PlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDruiner,0 ,0 ,0)
                local AntonovDoorCutsceneRadiusOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,-30 ,0)

                if AntonovTakeoff == 1 then
                    
                    SET_VEHICLE_FORWARD_SPEED(TBDantonov, AntonovSpeed)
                    SET_ENTITY_ROTATION(TBDantonov, AntonovCurrentPitch, 0, AntonovSpawnHeading)

                end
                if AntonovPitchUp == 1 then
                    
                    AntonovCurrentPitch = AntonovCurrentPitch + 0.028
                    if AntonovCurrentPitch > 12 then
                        AntonovCurrentPitch = 12
                    end

                end

                if AntonovAccelerate == 1 then
                    
                    AntonovSpeed = AntonovSpeed + 0.03
                    if AntonovSpeed > 30 then
                        AntonovSpeed = 30
                    end

                end

                if doorHack >= 100 and doorOpened == 0 then
                    doorHack = 100
                    util.toast("Hack complete")
                    SET_VEHICLE_DOOR_OPEN(TBDantonov, 2, false, false)
                    doorOpened = 1
        
                end

                if doorOpened == 1 then
                    if PlayerPos:distance(AntonovDoorCutsceneRadiusOffset) < 20 and cutsceneOn == 0 and TooLateAntonovCutscene == 0 then
                        cutsceneOn = 1

                        HARD_ATTACH_CAM_TO_ENTITY(TBDCutscene2Cam, TBDantonov, 0, 0, -210, 20, -10, 0, true)
                        SET_CAM_FOV(TBDCutscene2Cam, 60)
                        RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0)

                        ATTACH_ENTITY_TO_ENTITY(TBDruiner, TBDantonov, 0, 0, 0, -20, 0, 0, 0, true, false, false, true, 0, true, 0)

                        
                    end
                end



                    if cutsceneOn == 1 then
                        cutsceneOn = 2

                        
                        local AntonovCloneSpawn = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,-60 ,-6)

                        local RuinerHash = util.joaat("Ruiner2")
                        util.request_model(RuinerHash)
            
                        local TBDclonRruiner = entities.create_vehicle(RuinerHash, AntonovCloneSpawn, AntonovSpawnHeading)
                        entities.set_can_migrate(TBDclonRruiner, false)
                        --util.yield(500)
                        SET_ENTITY_AS_MISSION_ENTITY(TBDclonRruiner, true, true)
                        table.insert(TBDvehicles, #TBDvehicles, TBDclonRruiner)
                        local CloneRuinerBlip = ADD_BLIP_FOR_ENTITY(TBDclonRruiner)
                        SET_BLIP_SPRITE(CloneRuinerBlip, 530)
                        SET_BLIP_COLOUR(CloneRuinerBlip, 81)
                        SET_BLIP_DISPLAY(CloneRuinerBlip, 2)
                        table.insert(TBDblips, 3, CloneRuinerBlip)
                        util.remove_blip(RuinerBlip)

                        --local ClonePlayer = SET_ENTITY_COLLISION(CLONE_PED(players.user_ped(), true, false, true), false, false) --here
                        --table.insert(TBDpedsOther, 1, ClonePlayer)
                        --SET_PED_INTO_VEHICLE(ClonePlayer, TBDclonRruiner, -1)

                        util.create_tick_handler(function()
                        
                        if stopLoop == 0 then
                            SET_VEHICLE_FORWARD_SPEED(TBDclonRruiner, AntonovSpeed+10)
                        else
                            return false
                        end

                        
                        end)
                        util.yield(1500)
                        stopLoop = 1
                        util.yield(2000)
                        SET_VEHICLE_DOORS_SHUT(TBDantonov, false)
                        SET_PED_INTO_VEHICLE(players.user_ped(), TBDclonRruiner, -1)

                        util.yield(3000)
                        RENDER_SCRIPT_CAMS(false, true, 1, 1, 0, 0)
                        DESTROY_CAM(TBDCutscene2Cam)

                        if TooLateAntonovCutscene == 0 and PlayerPos:distance(AntonovDoorCutsceneRadiusOffset) < 30 then
                            win = 1
                            --util.toast("win!")
                            isTBDrunning = 0
                            TBDphase = 5
                            TBD_Tip = 0
                            TBDdialogue = 0
                            TBD_ph_Step = 0
                        end
                        
                    end


                    --if TooLateAntonovCutscene == 1 then
                       -- util.yield(1)
                        if Lost == 1 and win == 0 then 
                            AntonovLostCutscene = 1
                        end
                    --end


                if TBDphase ~= 4 then
                    return false
                end
        
                if TBDtick54CalledonceEver == 0 then
                    return false
                end

            end)
        end
        
        
        if TBDphase ~= 4 then
            return false
        end

        if TBDtick54CalledonceEver == 0 then
            return false
        end

    end)

    util.create_tick_handler(function()

        local PlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDruiner,0 ,0 ,0)
        local AntonovPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,0 ,0)
        local AntonovDoorPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov,0 ,-30 ,0)

        if PlayerPos:distance(AntonovDoorPos) < 80 and doorHack < 100 then
            doorHack = doorHack + math.random(8, 19)
            if doorHack > 100 then
                util.toast("Hack 100% complete")
                TBD_Tip = 5
                util.toast("Get in the Antonov")
            else
                util.toast("Hack " .. doorHack .. "% complete")
                TBD_Tip = 4
            end
            util.yield(math.random(500, 1200))
        end

        


        if TBDphase ~= 4 then
            return false
        end

        if TBDtick54CalledonceEver == 0 then
            return false
        end

    end)
end
        
        
        end
    
    
        TBD_Tip = 1
            TBDdialogue = -1
            util.yield(7000)
            TBDdialogue = 1
            util.yield(7000)
            TBDdialogue = 2
            util.yield(7000)
            TBDdialogue = 3
            util.yield(7000)
            TBDdialogue = 4
            util.toast("Go to Vinewood Hills and steal the Ruiner 2000")
            
    end
end
end

function TBDphase5()
    if TBDphase == 5 then
    
        if TBDtick56CalledonceEver == 0 then
            TBDtick56CalledonceEver = 1
            util.create_tick_handler(function () --CheckFail
    
                FailTBD5()
    
                if TBDfailMesageShown == 1 then
                    return false
                end
    
                if TBDphase ~= 5 then
                    return false
                end
    
                if TBDtick56CalledonceEver == 0 then
                    return false
                end
    
            end)
        end
    
       
        local PlayerCarSpawnPoint = v3.new(1906.8, 569.5, 176)
        local PlayerCarSpawnHeading = -114.5

    
        local RuinerSpawnPoint = v3.new(5004, -4958, 1503)
        local RuinerSpawnHeading = -155

        local AntonovSpawnPoint = v3.new(5011.6, -4974.9, 1500)
        local AntonovSpawnHeading = -155

        
        local HangarBlipLocation = v3.new(4510.3, -4528.8, 5)
        local HangarBlipRadius = 25
    


        local AntonovHash = util.joaat("cargoplane")
        util.request_model(AntonovHash)

        local TBDantonov = entities.create_vehicle(AntonovHash, AntonovSpawnPoint, AntonovSpawnHeading)
        FREEZE_ENTITY_POSITION(TBDantonov, true)
        SET_ENTITY_INVINCIBLE(TBDantonov, true)
        entities.set_can_migrate(TBDantonov, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(TBDantonov, true, true)
        table.insert(TBDvehicles, 1, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 2, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 3, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 4, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 5, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 6, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 7, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 8, TBDantonov)--Placeholders
        table.insert(TBDvehicles, 9, TBDantonov)

        
        for i = math.random(12, 18), 0, -1 do
            SpawnTBDantonovEquipement()
        end

        for i = math.random(8, 13), 0, -1 do
            TBDSpawnMWguards3()
        end

        local RuinerHash = util.joaat("Ruiner2")
        util.request_model(RuinerHash)

        local TBDruiner = entities.create_vehicle(RuinerHash, RuinerSpawnPoint, RuinerSpawnHeading)
        entities.set_can_migrate(TBDruiner, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(TBDruiner, true, true)
        table.insert(TBDvehicles, 10, TBDruiner)
        local RuinerBlip = ADD_BLIP_FOR_ENTITY(TBDruiner)
            SET_BLIP_SPRITE(RuinerBlip, 530)
            SET_BLIP_COLOUR(RuinerBlip, 81)
            SET_BLIP_DISPLAY(RuinerBlip, 2)
            table.insert(TBDblips, 1, RuinerBlip)




        if TBD_ph_Step == 0 then
            TBD_ph_Step = 1
            DO_SCREEN_FADE_OUT(1500)
        util.yield(1500)
        menu.trigger_commands('iplcayopercio on') -- lol they misspelled it
        local SavedPlayerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                util.yield(500)
                SET_ENTITY_COORDS(players.user_ped(), 138, -3200, 6)
    
                for i = math.random(5, 7), 0, -1 do
                    TBDSpawnMWguards2()
                end
            
                util.yield(1000)
            
                for i = math.random(5, 8), 0, -1 do
                    TBDSpawnFlamables4()
                end
    
    
                util.yield(500)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
         util.yield(500)
         SET_PED_INTO_VEHICLE(players.user_ped(), TBDruiner, -1)
        util.yield(100)
            FREEZE_ENTITY_POSITION(players.user_ped(), false)
            DO_SCREEN_FADE_IN(1500)
        util.yield(1500)
        
        if TBDtick63CalledonceEver == 0 then
            TBDtick63CalledonceEver = 1
            util.create_tick_handler(function ()
    
                TBDPlayerCurrentExactLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 1 then
                  
    
                    util.toast("Survive the trip to Cayo Perico")
                end
        
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 2 then
                    
                    util.toast("Wait for the plane to be above the island")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 3 then
                    
                    util.toast("Open the Antonov's rear door")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 4 then
                    
                    util.toast("Dive in")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 5 then
                    
                    util.toast("Locate and collect the Merryweather file")
                end
    
                if IS_CONTROL_PRESSED(0, 187) and TBD_Tip == 6 then
                    
                    util.toast("Escape the area using the nearby plane")
                end
    
                local PlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                local ToreadorOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDvehicles[3], 0, 0, 0)


                if TBDphase ~= 5 then
                    return false
                end
        
                if TBDtick63CalledonceEver == 0 then
                    return false
                end


            end)
        end


        if TBDtick62CalledonceEver == 0 then
            TBDtick62CalledonceEver = 1
            util.create_tick_handler(function()
                if TBDdialogue == -1 then
                    util.toast("Earpiece : You're in ? That's good news ! However what's bad news is that there is probably some guards trying to kill you.. Fight back !")
                elseif TBDdialogue == 1 then
                    util.toast("Earpiece : You're gonna need to wait until you're above the island to dive in, use your car's parachute to land safely. The files should be somewhere near the island's runway")
                elseif TBDdialogue == 2 then
                    util.toast("Earpiece : Still alive ? That's a triumph ! We're almost there.")
                elseif TBDdialogue == 3 then
                    util.toast("We're there ! Open the rear door and dive in !")
                end
    

                
                if TBDphase ~= 5 then
                    return false
                end
        
                if TBDtick62CalledonceEver == 0 then
                    return false
                end
    
    
            end)

        end


        end



        
        local BriefcaseCollected = 0
        local LuxBriefcaseSpawn = v3.new(4504, -4556.48, 4.15)
        local LuxBriefcaseHash = util.joaat("hei_p_attache_case_shut")
        util.request_model(LuxBriefcaseHash)
        local LuxBriefcase = entities.create_object(LuxBriefcaseHash, LuxBriefcaseSpawn, 180 + 20.8)
        --PLAY_DEFERRED_SOUND_FRONTEND("BACK", "HUD_FREEMODE_SOUNDSET");
        --PLAY_DEFERRED_SOUND_FRONTEND("Hack_Success", "DLC_GR_Steal_Railguns_Sounds");
        --PLAY_DEFERRED_SOUND_FRONTEND("Success", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
        --PLAY_DEFERRED_SOUND_FRONTEND("Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
        --PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
        --PLAY_DEFERRED_SOUND_FRONTEND("Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
        --PLAY_DEFERRED_SOUND_FRONTEND("Trail_Custom", "DLC_HEIST_HACKING_SNAKE_SOUNDS"); -- CANNOT BE STOPPED

        --PLAY_DEFERRED_SOUND_FRONTEND("Turn", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
        --PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
        --PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
        entities.set_can_migrate(LuxBriefcase, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(LuxBriefcase, true, true)
        FREEZE_ENTITY_POSITION(LuxBriefcase, true)
        --table.insert(TBDobjects, 1, LuxBriefcase)

        if TBDtick61CalledonceEver == 0 then
            TBDtick61CalledonceEver = 1
            util.create_tick_handler(function()

                local PlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                local LuxBriefcaseLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(LuxBriefcase, 0, 0, 0)

                if PlayerLoc:distance(LuxBriefcaseLoc) < 2 and BriefcaseCollected == 0 then
                    BriefcaseCollected = 1
                    PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds"); -- 3 times so its louder ;)
                    PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
                    PLAY_DEFERRED_SOUND_FRONTEND("collect_keys", "dlc_vw_recover_luxury_car_sounds");
                    entities.delete(LuxBriefcase)
                    util.toast("You collected the Merryweather file")
                    local TBDstreamerBlip = ADD_BLIP_FOR_ENTITY(TBDvehicles[1])
                        SET_BLIP_SPRITE(TBDstreamerBlip, 126)
                        SET_BLIP_COLOUR(TBDstreamerBlip, 46)
                        SET_BLIP_DISPLAY(TBDstreamerBlip, 2)
                        table.insert(TBDblips, 1, TBDstreamerBlip)
                        FREEZE_ENTITY_POSITION(TBDvehicles[1], false)
                    util.yield(2000)
                    TBD_Tip = 6
                    util.toast("Escape the area using the nearby plane")
                end
if PlayerLoc:distance(LuxBriefcaseLoc) < 100 and BriefcaseCollected == 0 then
                TBD_Tip = 5
end
                if DOES_ENTITY_EXIST(LuxBriefcase) then
                end

                if BriefcaseCollected == 1 then

                    local LuxCabinLoc = v3.new(4503.63, -4556.28, 4.15)
                    local LuxCabinEscapeRadius = 1000
                            
                    if PlayerLoc:distance(LuxCabinLoc) > LuxCabinEscapeRadius then
                        TBDvictory2()
                    end
                end

                if TBDphase ~= 5 then
                    return false
                end
        
                if TBDtick61CalledonceEver == 0 then
                    return false
                end
    
    
            end)
        end
    
    

        TBD_Tip = 1
        util.toast("Survive the trip to Cayo Perico")
        TBDdialogue = -1
        util.yield(10000)
        TBDdialogue = 1
        util.yield(10000)
        TBDdialogue = 2
        TBD_Tip = 2
        util.toast("Wait for the plane to be above the island")
        util.yield(5000)
        TBDdialogue = 3
        util.yield(3000)
        TBDdialogue = 4
        TBD_Tip = 3
        util.toast("Open the Antonov's rear door")

        local doorOpened = 0

        if TBDtick64CalledonceEver == 0 then
            TBDtick64CalledonceEver = 1
            util.create_tick_handler(function()
                
                local antonovDoorPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(TBDantonov, 0, -30, 0)
                local playerPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

                if playerPos:distance(antonovDoorPos) < 15 and doorOpened == 0 then
                    util.toast("Press -Left arrow key- to open the rear door")
                    if IS_CONTROL_PRESSED(0, 189) then
                        doorOpened = 1
                        SET_VEHICLE_DOOR_OPEN(TBDantonov, 2, false, false)
                        local TBDcaseZone = ADD_BLIP_FOR_RADIUS(HangarBlipLocation.x, HangarBlipLocation.y, HangarBlipLocation.z, HangarBlipRadius)
                        table.insert(TBDblips, 2, TBDcaseZone)
                        SET_BLIP_ALPHA(TBDcaseZone, 90)
                        SET_BLIP_COLOUR(TBDcaseZone, 5)
                        SET_BLIP_DISPLAY(TBDcaseZone, 2)
                        table.insert( TBDblipsOther, 1, TBDcaseZone)
                        TBD_Tip = 4
                        util.toast("Dive in")
                        for i = math.random(10, 15), 0, -1 do
                            TBDSpawnMWguards4()
                            util.yield(100)
                        end

                        local StreamerHash = util.joaat("streamer216")
                        util.request_model(StreamerHash)

                        local TBDstreamerBlipSpawnPoint = v3.new(4416.1, -4522.2, 3.5)
                        local TBDstreamerBlipSpawnHeading = 110

                        local TBDstreamer = entities.create_vehicle(StreamerHash, TBDstreamerBlipSpawnPoint, TBDstreamerBlipSpawnHeading)
                        SET_ENTITY_INVINCIBLE(TBDstreamer, true)
                        entities.set_can_migrate(TBDstreamer, false)
                        --util.yield(500)
                        SET_ENTITY_AS_MISSION_ENTITY(TBDstreamer, true, true)
                        table.insert(TBDvehicles, 1, TBDstreamer)
                        util.yield(3000)
                        FREEZE_ENTITY_POSITION(TBDstreamer, true)
                    end
                end




              












                if TBDphase ~= 5 then
                    return false
                end
        
                if TBDtick61CalledonceEver == 0 then
                    return false
                end
            end)
        end





    
    end
end
    
    









function TBDbanditoHack()

    local banditoHash = util.joaat("rcbandito")
    
    util.request_model(banditoHash)
    
    local banditoSpawn = v3.new(10, 0, 1000)

    local bandito = entities.create_vehicle(banditoHash, banditoSpawn, 90)
    entities.set_can_migrate(bandito, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(bandito, true, true)

    SET_PED_INTO_VEHICLE(players.user_ped(), bandito, -1)

    table.insert(TBDvehicles, 7, bandito)

    
    ANIMPOSTFX_PLAY("TinyRacerPink", 0, true)
    local TBDCutsceneCam = CREATE_CAMERA(26379945, true)
    HARD_ATTACH_CAM_TO_ENTITY(TBDCutsceneCam, bandito, 10, 0, 0, 0, -2, 1, true)
    SET_CAM_FOV(TBDCutsceneCam, 95)
    RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0)

    local PipeEndHash = util.joaat("stt_prop_stunt_tube_end")
    local PipeStraightHash = util.joaat("stt_prop_stunt_tube_s")
    local PipeRotatingHash1 = util.joaat("stt_prop_stunt_tube_fn_04")
    local PipeRotatingHash2 = util.joaat("stt_prop_stunt_tube_fn_03")
    local PipeRotatingHash3 = util.joaat("stt_prop_stunt_tube_fn_01")
    local PipeQuarterWallHash = util.joaat("stt_prop_stunt_tube_qg")
    local PipeSemiWallHash = util.joaat("stt_prop_stunt_tube_hg")
    local PipeRampHash = util.joaat("stt_prop_stunt_tube_jmp")

    local PipePartTable = {"stt_prop_stunt_tube_fn_04", "stt_prop_stunt_tube_fn_03", "stt_prop_stunt_tube_fn_01", "stt_prop_stunt_tube_qg", "stt_prop_stunt_tube_hg", "stt_prop_stunt_tube_jmp"}
    local PipeRotationsTable = {-180, 180}

    util.request_model(PipeStraightHash)
    util.request_model(PipeRotatingHash1)
    util.request_model(PipeQuarterWallHash)
    util.request_model(PipeSemiWallHash)
    util.request_model(PipeRampHash)

    local Pipe0Loc = v3.new(60, 0, 1000)
    local Pipe1Loc = v3.new(26.5, 0, 1000)
    local Pipe2Loc = v3.new(-128, 0, 1000)


    local Pipe0 = entities.create_object(PipeEndHash, Pipe0Loc, 0)
    entities.set_can_migrate(Pipe0, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(Pipe0, true, true)
    local Pipe1 = entities.create_object(PipeStraightHash, Pipe1Loc, 0)
    entities.set_can_migrate(Pipe1, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(Pipe1, true, true)

    table.insert(TBDobjectsPipes, 1, Pipe0)
    table.insert(TBDobjectsPipes, 2, Pipe1)

    for i = 20, 1, -1 do
        local PipeLoc = v3.new(-35 * i, 0, 1000)
        local Pipe = entities.create_object(util.joaat(PipePartTable[math.random(1, #PipePartTable)]), PipeLoc, 0)
        SET_ENTITY_ROTATION(Pipe, math.random(-180, 180), 0, 180)
        entities.set_can_migrate(Pipe, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(Pipe, true, true)
        table.insert(TBDobjectsPipes, #TBDobjectsPipes, Pipe)
    end

if TBDtick18CalledonceEver == 0 then
    TBDtick18CalledonceEver = 1
    
    local sizeX = 0.95
    local sizeY = 0.03

    util.create_tick_handler(function()
            --Took that from LanceScript
            local vel = GET_ENTITY_VELOCITY(bandito)
            vel['z'] = -vel['z']
            APPLY_FORCE_TO_ENTITY(bandito, 2, 0, 0, -50 -vel['z'], 0, 0, 0, 0, true, false, true, false, true)

            local banditoRot = GET_ENTITY_ROTATION(bandito, 2)
            local banditoPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(bandito, 0, 0, 0)

            if banditoRot.z < 0 then
                util.toast("Wrong Direction !")
            end

            local current_y_pos = 0.00
            if current_y_pos == 0.00 then 
                current_y_pos = 0.04 
            else
                current_y_pos = 0.07
            end


            directx.draw_rect(0.5 - (sizeX / 2), current_y_pos, sizeX, sizeY, {r=255, g=0, b=0, a=1})
            
        if TBDtick19CalledonceEver == 0 then
            TBDtick19CalledonceEver = 1
            util.create_tick_handler(function()
                if sizeX > 0 then
                    sizeX = sizeX - 0.022
                    util.yield(1000)
                end


                if TBDphase ~= 2 then
                    return false
                end
        
                if TBDtick19CalledonceEver == 0 then
                    DESTROY_CAM(TBDCutsceneCam)
                    return false
                end

            end)
        end

            if sizeX < 0 then
                sizeX = 0
                banditoHackFailed = 1
                return false --TBDfail
            end

            if sizeX > 0 and banditoPos.x < -700 then
                DO_SCREEN_FADE_OUT(1500)
                util.yield(1500)
                ANIMPOSTFX_STOP("TinyRacerPink", 0, true)
                banditoHackSuccessful = 1
                DESTROY_CAM(TBDCutsceneCam)
                RENDER_SCRIPT_CAMS(false, true, 1, 1, 0, 0)
                util.toast("Hack complete")
                entities.delete(GET_VEHICLE_PED_IS_IN(players.user_ped(), true))
                SET_ENTITY_COORDS(players.user_ped(), TBDSavePlayerOffset.x, TBDSavePlayerOffset.y, TBDSavePlayerOffset.z)
                REQUEST_ANIM_DICT("amb@code_human_wander_texting_fat@male@base")
                TASK_PLAY_ANIM(players.user_ped(), "amb@code_human_wander_texting_fat@male@base", "static", 10, 1, -1, 2, 1.0, false, false, false)
                DO_SCREEN_FADE_IN(1500)
                util.yield(1500)
                STOP_ANIM_TASK(players.user_ped(), "amb@code_human_wander_texting_fat@male@base", "static", 0.05)      
                return false  
            end

            if TBDphase ~= 2 then
                return false
            end
    
            if TBDtick18CalledonceEver == 0 then
                DESTROY_CAM(TBDCutsceneCam)
                return false
            end
    end)
end



end

TBDmwMercenariesHashsTable = {"CSB_MWeather", "S_M_Y_ArmyMech_01", "CSB_Ramp_marine", "G_M_ImportExport_01", "G_M_M_Goons_01", "IG_Casey"} -- Boss CSB_Bogdan
TBDmwMercenariesGunsTable = {453432689, 4024951519, 2210333304, 487013001, 3342088282} -- Boss 1470379660
TBDflamables = {"prop_gascyl_01a", "prop_gascyl_02a", "prop_gascyl_02b", "prop_gascyl_03a", "prop_gascyl_03b", "prop_gascyl_04a", "imp_prop_groupbarrel_03", "imp_prop_groupbarrel_02", "imp_prop_groupbarrel_01", "prop_barrel_exp_01a", "prop_barrel_exp_01b", "prop_barrel_exp_01c", "prop_box_ammo03a", "prop_box_ammo06a"}
TBDAttackSubmarines = {"avisa", "submersible", "submersible2", "toreador", "stromberg"}
TBDboats = {"dinghy4", "patrolboat", "dinghy5"}

function TBDSpawnFlamables()

    local TBDtick17CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(1855, 1935), math.random(385, 465), 162)

    
    local FlamableHash = util.joaat(TBDflamables[math.random(1, #TBDflamables)])
    util.request_model(FlamableHash)
    local flamable = entities.create_object(FlamableHash, SpawnLoc, math.random(-180, 180))
    PLACE_OBJECT_ON_GROUND_PROPERLY(flamable)
    entities.set_can_migrate(flamable, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(flamable, true, true)
    table.insert(TBDobjectsOther, 1, flamable)
    
    local blipFlamable = ADD_BLIP_FOR_ENTITY(flamable)
    SET_BLIP_SPRITE(blipFlamable, 436) -- Boss 630
    SET_BLIP_COLOUR(blipFlamable, 47)
    SET_BLIP_DISPLAY(blipFlamable, 2)
    SET_BLIP_SCALE(blipFlamable, 0.45)
    table.insert(TBDblipsOther, 1, blipFlamable)


if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        local flamableHealth = GET_ENTITY_HEALTH(flamable)
        
        --util.toast(flamableHealth)
        if flamableHealth < 100 then
            util.remove_blip(blipFlamable)
        end
        if TBDphase ~= 2 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWcommander()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(3083.06, -4687.25, 28)

    
    local MWmercenaryHash = util.joaat("CSB_Bogdan")
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = 1470379660
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 50.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        if TBDphase ~= 2 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWmercenaries()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(1855, 1935), math.random(385, 465), 172)

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        if TBDphase ~= 2 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWmercenaryBoss()

    local SpawnLoc = v3.new(math.random(1855, 1935), math.random(385, 465), 172)

    
    local MWmercenaryHash = util.joaat("CSB_Bogdan")
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpeds, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = 1470379660
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 630) -- Boss 630
    SET_BLIP_COLOUR(blipMWmercenary, 41)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    table.insert(TBDblips, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 50.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

    if TBDtick16CalledonceEver == 0 then
        TBDtick16CalledonceEver = 1
        util.create_tick_handler(function()
            
            if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
                util.remove_blip(blipMWmercenary)
                TBD_Tip = 1
                util.toast("Search the high ranking officer's body")

            local blipMWmercenaryDeath = ADD_BLIP_FOR_ENTITY(mwMercenary)
                SET_BLIP_SPRITE(blipMWmercenaryDeath, 310) -- Boss 630
                SET_BLIP_COLOUR(blipMWmercenaryDeath, 46)
                SET_BLIP_DISPLAY(blipMWmercenaryDeath, 2)
                table.insert(TBDblips, 1, blipMWmercenaryDeath)

            if TBDtick17CalledonceEver == 0 then
                TBDtick17CalledonceEver = 1
                util.create_tick_handler(function()

                    if TBDphase ~= 2 then
                        return false
                    end
            
                    if TBDtick17CalledonceEver == 0 then
                        return false
                    end

                    local BossLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mwMercenary, 0, 0, 0)
                    local PlayerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                    

                    if BossLoc:distance(PlayerLoc) < 1.5 and phonePickedUp == 0 and not IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
                        util.toast("Press -Left arrow key- to pickup and hack the phone")
                    end

                    if BossLoc:distance(PlayerLoc) < 1.5 and IS_CONTROL_PRESSED(0, 189) and phonePickedUp == 0 and banditoHackSuccessful == 0 and not IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
                        phonePickedUp = 1
                        TBDSavePlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                        FREEZE_ENTITY_POSITION(players.user_ped(), true)
                        local text = "You can visualize yourself breaching the firewall. Hack the phone by reaching the end of the track fast enough"
                        TBD_Tip = 2
                        REQUEST_ANIM_DICT("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                        TASK_PLAY_ANIM(players.user_ped(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0, 1, -1, 2, 1.0, false, false, false)
                        util.yield(2000)
                        --STOP_ANIM_TASK(players.user_ped(), "random@domestic", "pickup_low", 8.0)
                        
                        REQUEST_ANIM_DICT("amb@code_human_wander_texting_fat@male@base")
                        TASK_PLAY_ANIM(players.user_ped(), "amb@code_human_wander_texting_fat@male@base", "static", 1.2, 1, -1, 2, 1.0, false, false, false)
                        util.yield(1000)
                        DO_SCREEN_FADE_OUT(1500)
                        TBD_Tip = 2
                        util.yield(1500)

                        if TBDtick28CalledonceEver == 0 then
                            TBDtick28CalledonceEver = 1
                        util.create_tick_handler(function()
                            util.toast(text)
                            if TBDphase ~= 2 then
                                return false
                            end
                    
                            if TBDtick28CalledonceEver == 0 then
                                return false
                            end

                            if banditoHackSuccessful == 1 then
                                util.remove_blip(blipMWmercenaryDeath)
                                if TBDtick32CalledonceEver == 0 then
                                    TBDtick32CalledonceEver = 1
                                    TBDdialogue = 1
                                    TBD_Tip = 3
                                    PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                                    PLAY_DEFERRED_SOUND_FRONTEND("Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                                    PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                                    PLAY_DEFERRED_SOUND_FRONTEND("Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                                    util.create_tick_handler(function()


                                        if TBDdialogue == 1 then
                                            util.toast("Earpiece : Perfect ! So that's where they are... " .. TBDPlayerName ..", we can either steal the files from aboard the USS Luxington, or take them from the island of Cayo Perico. Either way this is gonna be a big dive. Which one will you choose ?")
                                        elseif TBDdialogue == 2 then
                                            util.toast("| -Left arrow key- to select the sea approach | -Right arrow key- to select the sky approach |")
                                        elseif TBDdialogue == 3 then
                                            return false
                                        end

                                        if TBDdialogue == 2 and IS_CONTROL_PRESSED(0, 189) then -- sea approach
                                            TBDdialogue = 3 -- The sea ? I knew you would say that

                                            if TBDtick25CalledonceEver == 0 then
                                                TBDtick25CalledonceEver = 1
                                                util.create_tick_handler(function()
                                                    isTBDrunning = 0
                                                    TBDphase = 3
                                                    TBD_Tip = 0
                                                    TBDdialogue = 0
                                                    TBD_ph_Step = 0
                                                    --StartTBD()
                                                    
                                                    if TBDphase ~= 2 then
                                                        return false
                                                    end
            
                                                    if TBDtick25CalledonceEver == 0 then
                                                        return false
                                                    end
                                                    return false
                                                end)
                                            end

                                            TBDdialogue = 1
                                            util.yield(10000)
                                            TBDdialogue = 2
                                            return false
                                        end

                                        if TBDdialogue == 2 and IS_CONTROL_PRESSED(0, 190) then -- sky approach
                                            TBDdialogue = 3 -- You choose the sky ? good choice

                                            if TBDtick45CalledonceEver == 0 then
                                                TBDtick45CalledonceEver = 1
                                                util.create_tick_handler(function()
                                                    isTBDrunning = 0
                                                    TBDphase = 4
                                                    TBD_Tip = 0
                                                    TBDdialogue = 0
                                                    TBD_ph_Step = 0
                                                    --StartTBD()
                                                    
                                                    if TBDphase ~= 2 then
                                                        return false
                                                    end
            
                                                    if TBDtick45CalledonceEver == 0 then
                                                        return false
                                                    end
                                                    return false
                                                end)
                                            end
                                        end


                                        if TBDphase ~= 2 then
                                            return false
                                        end

                                        if TBDtick32CalledonceEver == 0 then
                                            return false
                                        end
                                    end)

                                    
                                    TBDdialogue = 1
                                    util.yield(15000)
                                    TBDdialogue = 2
                                end

                                return false
                            end

                            if banditoHackFailed == 1 then
                                return false
                            end
                        end)

                        if TBDphase ~= 2 then
                            return false
                        end
                
                        if TBDtick28CalledonceEver == 0 then
                            return false
                        end

                        TBDbanditoHack()
                        util.yield(1500)
                        util.toast("Reach the end of the data tunnel")
                        FREEZE_ENTITY_POSITION(players.user_ped(), false)
                        DO_SCREEN_FADE_IN(1500)
                        util.yield(1500)
                        PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                        PLAY_DEFERRED_SOUND_FRONTEND("Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                        PLAY_DEFERRED_SOUND_FRONTEND("Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                        PLAY_DEFERRED_SOUND_FRONTEND("Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                        --PLAY_DEFERRED_SOUND_FRONTEND("Trail_Custom", "DLC_HEIST_HACKING_SNAKE_SOUNDS");
                        STOP_ANIM_TASK(players.user_ped(), "amb@code_human_wander_texting_fat@male@base", "static", 8.0)
                                    
                    end

                end


                    if TBDphase ~= 2 then
                        return false
                    end
            
                    if TBDtick17CalledonceEver == 0 then
                        return false
                    end

                end)
            end

                return false
            end
    
            if TBDphase ~= 2 then
                return false
            end
    
            if TBDtick16CalledonceEver == 0 then
                return false
            end
    
        end)
    end

end


function TBDSpawnMWguards()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(123, 150), math.random(-3215, -3182), 7)

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        if TBDphase ~= 3 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnFlamables2()

    local TBDtick17CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(123, 150), math.random(-3195, -3182), 7)

    
    local FlamableHash = util.joaat(TBDflamables[math.random(1, #TBDflamables)])
    util.request_model(FlamableHash)
    local flamable = entities.create_object(FlamableHash, SpawnLoc, math.random(-180, 180))
    PLACE_OBJECT_ON_GROUND_PROPERLY(flamable)
    entities.set_can_migrate(flamable, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(flamable, true, true)
    table.insert(TBDobjectsOther, 1, flamable)
    
    local blipFlamable = ADD_BLIP_FOR_ENTITY(flamable)
    SET_BLIP_SPRITE(blipFlamable, 436) -- Boss 630
    SET_BLIP_COLOUR(blipFlamable, 47)
    SET_BLIP_DISPLAY(blipFlamable, 2)
    SET_BLIP_SCALE(blipFlamable, 0.45)
    table.insert(TBDblipsOther, 1, blipFlamable)


if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1
    util.create_tick_handler(function()

        local flamableHealth = GET_ENTITY_HEALTH(flamable)
        
    --util.toast(flamableHealth)
if flamableHealth < 100 then
    util.remove_blip(blipFlamable)
end
        if TBDphase ~= 3 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWmarines()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(3000, 3120), math.random(-4830, -4515), math.random(7, 17))

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        local MarineLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mwMercenary, 0, 0, 0)
        if MarineLoc.z < 3 then
            entities.delete(mwMercenary)
            util.remove_blip(blipMWmercenary)
        end

        if TBDphase ~= 3 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end





function TBDSpawnFlamables3()

    local TBDtick17CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(3000, 3120), math.random(-4830, -4515), 7)

    
    local FlamableHash = util.joaat(TBDflamables[math.random(1, #TBDflamables)])
    util.request_model(FlamableHash)
    local flamable = entities.create_object(FlamableHash, SpawnLoc, math.random(-180, 180))
    PLACE_OBJECT_ON_GROUND_PROPERLY(flamable)
    entities.set_can_migrate(flamable, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(flamable, true, true)
    table.insert(TBDobjectsOther, 1, flamable)
    
    local blipFlamable = ADD_BLIP_FOR_ENTITY(flamable)
    SET_BLIP_SPRITE(blipFlamable, 436) -- Boss 630
    SET_BLIP_COLOUR(blipFlamable, 47)
    SET_BLIP_DISPLAY(blipFlamable, 2)
    SET_BLIP_SCALE(blipFlamable, 0.45)
    table.insert(TBDblipsOther, 1, blipFlamable)


if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1
    util.create_tick_handler(function()

        local flamableHealth = GET_ENTITY_HEALTH(flamable)
        
    --util.toast(flamableHealth)
if flamableHealth < 100 then
    util.remove_blip(blipFlamable)
end

local FlambleLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(flamable, 0, 0, 0)
if FlambleLoc.z < 3 then
    entities.delete(flamable)
    util.remove_blip(blipFlamable)
end
        if TBDphase ~= 3 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnAttackSubmarines()

    local TBDtick17CalledonceEverSpecial = 0

    local TestSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
    local SpawnLoc = v3.new(math.random(700, 3300), math.random(-5000, -3800), math.random(-100, 0))

    
    local AttackSubmarineHash = util.joaat(TBDAttackSubmarines[math.random(1, #TBDAttackSubmarines)])
    util.request_model(AttackSubmarineHash)
    local AttackSubmarine = entities.create_vehicle(AttackSubmarineHash, SpawnLoc, math.random(-180, 180))
    if IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[4])) or IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[5])) then
        TRANSFORM_TO_SUBMARINE(AttackSubmarine, true)
        --util.toast("boop")
    end
    --PLACE_OBJECT_ON_GROUND_PROPERLY(AttackSubmarine)
    entities.set_can_migrate(AttackSubmarine, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(AttackSubmarine, true, true)
    table.insert(TBDobjectsOther, 1, AttackSubmarine)

    local Driver = CREATE_RANDOM_PED_AS_DRIVER(AttackSubmarine, true)
    entities.set_can_migrate(Driver, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(Driver, true, true)
    table.insert(TBDpedsOther, 1, Driver)
    
    local blipAttackSubmarine = ADD_BLIP_FOR_ENTITY(AttackSubmarine)
    SET_BLIP_SPRITE(blipAttackSubmarine, 308) -- Boss 630
    SET_BLIP_COLOUR(blipAttackSubmarine, 59)
    SET_BLIP_FLASHES_ALTERNATE(blipAttackSubmarine, true)
    SET_BLIP_DISPLAY(blipAttackSubmarine, 2)
    SET_BLIP_SCALE(blipAttackSubmarine, 1)
    table.insert(TBDblipsOther, 1, blipAttackSubmarine)

    SET_VEHICLE_LIGHTS(AttackSubmarine, 2)
    SET_VEHICLE_LIGHT_MULTIPLIER(AttackSubmarine, math.random(5.0, 15))

    SET_ENTITY_MAX_HEALTH(AttackSubmarine, 200)
    SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(AttackSubmarine, true, true)

if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1

    util.create_tick_handler(function()


        local AttackSubmarineHealth = GET_ENTITY_HEALTH(AttackSubmarine)
        
        if AttackSubmarineHealth < 40 then
            util.remove_blip(blipAttackSubmarine)
            util.yield(20000)
            entities.delete(AttackSubmarine)
        else
            local AttackSubmarinePosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 0, 0, 0)
            local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        if AttackSubmarinePosWorld:distance(PlayerPosWorld) < 100 then
            --if IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[4])) or IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[5])) then

                
            --    local BulletSpeed = 10
            --    local BulletDamage = 5
                
            --    local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            --    local AttackSubmarineWeaponLeft = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, -2, 5, 0)
            --    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponLeft.x, AttackSubmarineWeaponLeft.y, AttackSubmarineWeaponLeft.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, BulletDamage, true, util.joaat("weapon_heavysniper_mk2"), 0, true, false, BulletSpeed, AttackSubmarine, true)
            --    util.yield(math.random(50, 500))
            --    PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
            --    local AttackSubmarineWeaponRight = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 2, 5, 0)
            --    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponRight.x, AttackSubmarineWeaponRight.y, AttackSubmarineWeaponRight.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, BulletDamage, true, util.joaat("weapon_heavysniper_mk2"), 0, true, false, BulletSpeed, AttackSubmarine, true)
            --    util.yield(math.random(50, 500))


            --else

            if PlayerPosWorld.z < 0 then
                local torpedoSpeed = 50
                local torpedoDamage = 20
                
                local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                local AttackSubmarineWeaponLeft = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, -2, 5, 0)
                SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponLeft.x, AttackSubmarineWeaponLeft.y, AttackSubmarineWeaponLeft.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, torpedoDamage, true, 3884172218, 0, true, false, torpedoSpeed, AttackSubmarine, true)
                util.yield(math.random(4000, 8000))
                PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                local AttackSubmarineWeaponRight = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 2, 5, 0)
                SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponRight.x, AttackSubmarineWeaponRight.y, AttackSubmarineWeaponRight.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, torpedoDamage, true, 3884172218, 0, true, false, torpedoSpeed, AttackSubmarine, true)
                util.yield(math.random(4000, 8000))
            end
            --end


        end
    end
        if TBDphase ~= 3 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

    end)

    util.create_tick_handler(function()



        local AttackSubmarinePosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 0, 0, 0)
        local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local AttackSubmarineHealth = GET_ENTITY_HEALTH(AttackSubmarine)
        local PlayerCarHealth = GET_ENTITY_HEALTH(GET_VEHICLE_PED_IS_IN(players.user_ped()))
    --util.toast(flamableHealth)
        if AttackSubmarineHealth < 100 then
            util.remove_blip(blipAttackSubmarine)
            SET_VEHICLE_LIGHT_MULTIPLIER(AttackSubmarine, -1)
            util.yield(20000)
            entities.delete(AttackSubmarine)
        else

            if AttackSubmarinePosWorld.z < 0 then
        
            --local xyz = GET_ENTITY_VELOCITY(AttackSubmarine)

            --util.draw_centred_text(xyz.x)
            --util.draw_centred_text(xyz.y)
            --util.draw_centred_text(xyz.z)

        
        set_entity_face_entity(AttackSubmarine, players.user_ped(), true)
        --FORCE_SUBMARINE_NEURTAL_BUOYANCY(AttackSubmarine, true)
        --FORCE_SUBMARINE_SURFACE_MODE(AttackSubmarine, false)

        local vel = GET_ENTITY_VELOCITY(AttackSubmarine)

        if PlayerPosWorld.z > AttackSubmarinePosWorld.z then
            if AttackSubmarinePosWorld:distance(PlayerPosWorld) > 20 then
                SET_ENTITY_VELOCITY(AttackSubmarine, vel.x, vel.y, 4)
            else
                SET_ENTITY_VELOCITY(AttackSubmarine, vel.x, vel.y, -vel.z)
            end
        elseif PlayerPosWorld.z < AttackSubmarinePosWorld.z then
            if AttackSubmarinePosWorld:distance(PlayerPosWorld) > 20 then
                SET_ENTITY_VELOCITY(AttackSubmarine, vel.x, vel.y, -4)
            else
                SET_ENTITY_VELOCITY(AttackSubmarine, vel.x, vel.y, -vel.z)
            end
        end

        local velAdded = 3
        if AttackSubmarinePosWorld:distance(PlayerPosWorld) < 300 and AttackSubmarinePosWorld:distance(PlayerPosWorld) > 30 then
            
            SET_VEHICLE_FORWARD_SPEED_XY(AttackSubmarine, AttackSubmarinePosWorld:distance(PlayerPosWorld) / velAdded)

        end

        if AttackSubmarinePosWorld:distance(PlayerPosWorld) < 10 then
            
            SET_VEHICLE_FORWARD_SPEED_XY(AttackSubmarine, AttackSubmarinePosWorld:distance(PlayerPosWorld) / -velAdded)

        end

        
        
        
        
        if TBDphase ~= 3 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

        end
    end
    end)
end

end

--set_entity_face_entity(Kamikaze, pedm, true)


function TBDSpawnBoats()

    local TBDtick17CalledonceEverSpecial = 0

    local TestSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 10, 0)
    local SpawnLoc = v3.new(math.random(700, 3300), math.random(-5000, -3800), 0)

    
    local AttackSubmarineHash = util.joaat(TBDboats[math.random(1, #TBDboats)])
    util.request_model(AttackSubmarineHash)
    local AttackSubmarine = entities.create_vehicle(AttackSubmarineHash, SpawnLoc, math.random(-180, 180))
    
    --PLACE_OBJECT_ON_GROUND_PROPERLY(AttackSubmarine)
    entities.set_can_migrate(AttackSubmarine, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(AttackSubmarine, true, true)
    table.insert(TBDobjectsOther, 1, AttackSubmarine)

    local Driver = CREATE_RANDOM_PED_AS_DRIVER(AttackSubmarine, true)
    entities.set_can_migrate(Driver, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(Driver, true, true)
    table.insert(TBDpedsOther, 1, Driver)
    
    local blipAttackSubmarine = ADD_BLIP_FOR_ENTITY(AttackSubmarine)
    SET_BLIP_SPRITE(blipAttackSubmarine, 754) -- Boss 630
    SET_BLIP_COLOUR(blipAttackSubmarine, 59)
    SET_BLIP_FLASHES_ALTERNATE(blipAttackSubmarine, true)
    SET_BLIP_DISPLAY(blipAttackSubmarine, 2)
    SET_BLIP_SCALE(blipAttackSubmarine, 1)
    table.insert(TBDblipsOther, 1, blipAttackSubmarine)

    SET_VEHICLE_LIGHTS(AttackSubmarine, 2)
    SET_VEHICLE_LIGHT_MULTIPLIER(AttackSubmarine, math.random(5.0, 15))

    SET_ENTITY_MAX_HEALTH(AttackSubmarine, 200)
    SET_VEHICLE_ALLOW_HOMING_MISSLE_LOCKON(AttackSubmarine, true, true)

if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1

    util.create_tick_handler(function()


        local AttackSubmarinePosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 0, 0, 0)
        local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        local AttackSubmarineHealth = GET_ENTITY_HEALTH(AttackSubmarine)
        local PlayerCarHealth = GET_ENTITY_HEALTH(GET_VEHICLE_PED_IS_IN(players.user_ped()))
    --util.toast(flamableHealth)
        if AttackSubmarineHealth < 100 then
            util.remove_blip(blipAttackSubmarine)
            SET_VEHICLE_LIGHT_MULTIPLIER(AttackSubmarine, -1)
            FREEZE_ENTITY_POSITION(AttackSubmarine, false)
            util.yield(20000)
            entities.delete(AttackSubmarine)
        else
            FREEZE_ENTITY_POSITION(AttackSubmarine, true)

            TASK_VEHICLE_DRIVE_WANDER(Driver, AttackSubmarine, 100.0, 1074528292)

            if AttackSubmarinePosWorld:distance(PlayerPosWorld) < 30 then
                --if IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[4])) or IS_VEHICLE_MODEL(AttackSubmarine, util.joaat(TBDAttackSubmarines[5])) then
    
                    
                --    local BulletSpeed = 10
                --    local BulletDamage = 5
                    
                --    local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                --    local AttackSubmarineWeaponLeft = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, -2, 5, 0)
                --    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponLeft.x, AttackSubmarineWeaponLeft.y, AttackSubmarineWeaponLeft.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, BulletDamage, true, util.joaat("weapon_heavysniper_mk2"), 0, true, false, BulletSpeed, AttackSubmarine, true)
                --    util.yield(math.random(50, 500))
                --    PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                --    local AttackSubmarineWeaponRight = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 2, 5, 0)
                --    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponRight.x, AttackSubmarineWeaponRight.y, AttackSubmarineWeaponRight.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, BulletDamage, true, util.joaat("weapon_heavysniper_mk2"), 0, true, false, BulletSpeed, AttackSubmarine, true)
                --    util.yield(math.random(50, 500))
    
    
                --else
    
                if PlayerPosWorld.z < 0 then
                    local torpedoSpeed = 50
                    local torpedoDamage = 15
                    
                    local PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                    local AttackSubmarineWeaponLeft = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, -2, 0,5)
                    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponLeft.x, AttackSubmarineWeaponLeft.y, AttackSubmarineWeaponLeft.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, torpedoDamage, true, 2210333304, 0, true, false, torpedoSpeed, AttackSubmarine, true)
                    util.yield(math.random(50, 500))
                    PlayerPosWorld = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                    local AttackSubmarineWeaponRight = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(AttackSubmarine, 2, 0, 5)
                    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(AttackSubmarineWeaponRight.x, AttackSubmarineWeaponRight.y, AttackSubmarineWeaponRight.z, PlayerPosWorld.x, PlayerPosWorld.y, PlayerPosWorld.z, torpedoDamage, true, 2210333304, 0, true, false, torpedoSpeed, AttackSubmarine, true)
                    util.yield(math.random(50, 500))
                end
                --end
    
    
            end
        end
        
        
        
        
        
        if TBDphase ~= 3 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end


    end)
end

end


function TBDSpawnFlamables4()

    local TBDtick17CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(783, 798), math.random(1270, 1280), 361)

    
    local FlamableHash = util.joaat(TBDflamables[math.random(1, #TBDflamables)])
    util.request_model(FlamableHash)
    local flamable = entities.create_object(FlamableHash, SpawnLoc, math.random(-180, 180))
    PLACE_OBJECT_ON_GROUND_PROPERLY(flamable)
    entities.set_can_migrate(flamable, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(flamable, true, true)
    table.insert(TBDobjectsOther, 1, flamable)
    
    local blipFlamable = ADD_BLIP_FOR_ENTITY(flamable)
    SET_BLIP_SPRITE(blipFlamable, 436) -- Boss 630
    SET_BLIP_COLOUR(blipFlamable, 47)
    SET_BLIP_DISPLAY(blipFlamable, 2)
    SET_BLIP_SCALE(blipFlamable, 0.45)
    table.insert(TBDblipsOther, 1, blipFlamable)


if TBDtick17CalledonceEverSpecial == 0 then
    TBDtick17CalledonceEverSpecial = 1
    util.create_tick_handler(function()

        local flamableHealth = GET_ENTITY_HEALTH(flamable)
        
    --util.toast(flamableHealth)
if flamableHealth < 100 then
    util.remove_blip(blipFlamable)
end

local FlambleLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(flamable, 0, 0, 0)
if FlambleLoc.z < 3 then
    entities.delete(flamable)
    util.remove_blip(blipFlamable)
end
        if TBDphase ~= 4 then
            return false
        end

        if TBDtick17CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWguards2()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(783, 798), math.random(1270, 1298), 361)

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        if TBDphase ~= 4 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWguards3()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(5016, 5025), math.random(-4999, -4981), 1506)

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        local mwMercenaryOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mwMercenary, 0, 0, 0)
        if mwMercenaryOffset.z < 1000 then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            entities.delete(mwMercenary)
            --util.toast("boop")
            return false
        end


        if TBDphase ~= 5 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function TBDSpawnMWguards4()

    local TBDtick15CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(math.random(4405, 4601), math.random(-4541, -4499), 8)

    
    local MWmercenaryHash = util.joaat(TBDmwMercenariesHashsTable[math.random(1, #TBDmwMercenariesHashsTable)])
    util.request_model(MWmercenaryHash)
    local mwMercenary = entities.create_ped(0, MWmercenaryHash, SpawnLoc, math.random(-180, 180))
    --SET_ENTITY_INVINCIBLE(mwMercenary, true)
    entities.set_can_migrate(mwMercenary, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(mwMercenary, true, true)
    table.insert(TBDpedsOther, 1, mwMercenary)
    local target = players.user_ped()
    local MercenaryGun = TBDmwMercenariesGunsTable[math.random(1, #TBDmwMercenariesGunsTable)]
    --util.request_model(MercenaryGun)
    local blipMWmercenary = ADD_BLIP_FOR_ENTITY(mwMercenary)
    SET_BLIP_SPRITE(blipMWmercenary, 128) -- Boss 630 -- dead 310 -- flamable 436 -- files 351
    SET_BLIP_COLOUR(blipMWmercenary, 75)
    SET_BLIP_DISPLAY(blipMWmercenary, 2)
    SET_BLIP_SCALE(blipMWmercenary, 0.8)
    table.insert(TBDblipsOther, 1, blipMWmercenary)


    local group = SET_PED_RELATIONSHIP_GROUP_HASH(mwMercenary, util.joaat('GANG_1'))
    SET_PED_AS_GROUP_MEMBER(mwMercenary, group)
    SET_PED_NEVER_LEAVES_GROUP(mwMercenary, true)

    TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(mwMercenary, true)
    SET_PED_ACCURACY(mwMercenary, 3.0)
    SET_PED_COMBAT_ABILITY(mwMercenary, 2)
   -- SET_PED_AS_ENEMY(mwMercenary, true)
    SET_PED_FLEE_ATTRIBUTES(mwMercenary, 0, false)
    SET_PED_COMBAT_ATTRIBUTES(mwMercenary, 46, true)
    TASK_COMBAT_PED(mwMercenary, target, 0, 16)
    GIVE_WEAPON_TO_PED(mwMercenary, MercenaryGun, 1000, false, true)

if TBDtick15CalledonceEverSpecial == 0 then
    TBDtick15CalledonceEverSpecial = 1
    util.create_tick_handler(function()
        
        if IS_PED_DEAD_OR_DYING(mwMercenary, 1) then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            --util.toast("boop")
            return false
        end

        local mwMercenaryOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(mwMercenary, 0, 0, 0)
        --[[if mwMercenaryOffset.z < 1000 then
            util.remove_blip(blipMWmercenary)
            TBDtick15CalledonceEverSpecial = 0
            entities.delete(mwMercenary)
            --util.toast("boop")
            return false
        end--]]


        if TBDphase ~= 5 then
            return false
        end

        if TBDtick15CalledonceEverSpecial == 0 then
            return false
        end

    end)
end

end

function SpawnTBDantonovEquipement()

    local TBDtick17CalledonceEverSpecial = 0

    local SpawnLoc = v3.new(0, 0, 0)

    
    local EquipementHash = util.joaat(TBDEquipementList[math.random(1, #TBDEquipementList)])
    util.request_model(EquipementHash)
    local Equipement = entities.create_object(EquipementHash, SpawnLoc, math.random(-180, 180))
    PLACE_OBJECT_ON_GROUND_OR_OBJECT_PROPERLY(Equipement)
    entities.set_can_migrate(Equipement, false)
    --util.yield(500)
    SET_ENTITY_AS_MISSION_ENTITY(Equipement, true, true)
    table.insert(TBDobjectsOther, 1, Equipement)

    ATTACH_ENTITY_TO_ENTITY(Equipement, TBDvehicles[9], 0, math.random(-2, 2), math.random(-10, 20), -4.5, 0, 0, 0, true, false, false, true, 0, true, 0)
    SET_ENTITY_COLLISION(Equipement, true, false)
    --local blipEquipement = ADD_BLIP_FOR_ENTITY(Equipement)
    --SET_BLIP_SPRITE(blipEquipement, 436) -- Boss 630
    --SET_BLIP_COLOUR(blipEquipement, 47)
    --SET_BLIP_DISPLAY(blipEquipement, 2)
    --SET_BLIP_SCALE(blipEquipement, 0.45)
    --table.insert(TBDblipsOther, 1, blipEquipement)




end



function TBDvictory()

    if TBDtick38CalledonceEver == 0 then
        TBDtick38CalledonceEver = 1

    local TBDtick17CalledonceEverSpecial = 0

    
    
    
    DO_SCREEN_FADE_OUT(1500)
    util.yield(1500)
    ResetTBD()

    local EndingText = 0
    local stopFinalLoop = 0
        local ToreadorSpawnPoint = v3.new(1190.2, -3236.8, 7)
        local ToreadorHash = util.joaat("toreador")
        util.request_model(ToreadorHash)

        local TBDtoreador = entities.create_vehicle(ToreadorHash, ToreadorSpawnPoint, 90)
        entities.set_can_migrate(TBDtoreador, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(TBDtoreador, true, true)
        table.insert(TBDvehicles, 1, TBDtoreador)

        SET_PED_INTO_VEHICLE(players.user_ped(), TBDtoreador, -1)
    DO_SCREEN_FADE_IN(1500)
    util.yield(2000)

    PLAY_MISSION_COMPLETE_AUDIO("FRANKLIN_BIG_01");
    if TBDtick17CalledonceEverSpecial == 0 then
        TBDtick17CalledonceEverSpecial = 1
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        util.create_tick_handler(function()


            if EndingText == 1 then
                util.toast("Thank you so much for playing !")
            end

            if EndingText == 2 then
                util.toast("Please give me feedbacks ! My Discord server is in the 'About LolaScript' tab !")
            end

            if EndingText == 3 then
                util.toast("Did you try the other choice after hacking the officer's phone ? Peace, love and stay squishy ! Lola")
            end

            if stopFinalLoop == 1 then
                return false
            end
        end)

    end
    util.yield(750)
    util.toast("Mission Complete !")
    util.yield(8000)
    EndingText = 1
    util.yield(5000)
    EndingText = 2
    util.yield(8000)
    EndingText = 3
    util.yield(8000)
    stopFinalLoop = 1
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)

    end
end

function TBDvictory2()

    if TBDtick38CalledonceEver == 0 then
        TBDtick38CalledonceEver = 1

    local TBDtick17CalledonceEverSpecial = 0

    
    
    
    DO_SCREEN_FADE_OUT(1500)
    util.yield(1500)
    ResetTBD()

    local EndingText = 0
    local stopFinalLoop = 0
        local ToreadorSpawnPoint = v3.new(1190.2, -3236.8, 7)
        local ToreadorHash = util.joaat("ruiner2")
        util.request_model(ToreadorHash)

        local TBDtoreador = entities.create_vehicle(ToreadorHash, ToreadorSpawnPoint, 90)
        entities.set_can_migrate(TBDtoreador, false)
        --util.yield(500)
        SET_ENTITY_AS_MISSION_ENTITY(TBDtoreador, true, true)
        table.insert(TBDvehicles, 1, TBDtoreador)

        SET_PED_INTO_VEHICLE(players.user_ped(), TBDtoreador, -1)
    DO_SCREEN_FADE_IN(1500)
    util.yield(2000)

    PLAY_MISSION_COMPLETE_AUDIO("FRANKLIN_BIG_01");
    if TBDtick17CalledonceEverSpecial == 0 then
        TBDtick17CalledonceEverSpecial = 1
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
        util.create_tick_handler(function()


            if EndingText == 1 then
                util.toast("Thank you so much for playing !")
            end

            if EndingText == 2 then
                util.toast("Please give me feedbacks ! My Discord server is in the 'About LolaScript' tab !")
            end

            if EndingText == 3 then
                util.toast("Did you try the other choice after hacking the officer's phone ? Peace, love and stay squishy ! Lola")
            end

            if stopFinalLoop == 1 then
                return false
            end
        end)

    end
    util.yield(750)
    util.toast("Mission Complete !")
    util.yield(8000)
    EndingText = 1
    util.yield(5000)
    EndingText = 2
    util.yield(8000)
    EndingText = 3
    util.yield(8000)
    stopFinalLoop = 1
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)
    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
    util.yield(200)

    end
end

function TheBigDiveMission()
    local TBDcheckpoints = {"Start", "Officer assassination", "Board the USS Luxington", "Infiltrate the Antonov", "Time to dive in"}

        menu.textslider(myListFunMissionsSettings, "Checkpoint Selector", {}, "Select the Checkpoint you wanna start at (Using the Reset button below will select 'Start')", TBDcheckpoints, function (index, name)

            if name == "Start" then
                TBDphase = 1
                util.toast("You selected " .. name .. " ! Click The Mission Button to Start")
            end

            if name == "Officer assassination" then
                TBDphase = 2
                util.toast("You selected " .. name .. " ! Click The Mission Button to Continue")
            end

            if name == "Board the USS Luxington" then
                TBDphase = 3
                util.toast("You selected " .. name .. " ! Click The Mission Button to Continue")
            end

            if name == "Infiltrate the Antonov" then
                TBDphase = 4
                util.toast("You selected " .. name .. " ! Click The Mission Button to Continue")
            end
            
            if name == "Time to dive in" then
                TBDphase = 5
                util.toast("You selected " .. name .. " ! Click The Mission Button to Continue")
            end

        end)

        --menu.action(myListFunMissionsSettings, "Temp Test", {}, "Spawn Mercenaries", function()

            

        --end)


        menu.action(myListFunMissionsSettings, "Reset : The Big Dive !", {}, "Resets the big dive !", function()
            ResetTBD()
            TBDphase = 1
            util.toast("The Big Dive checkpoints has been cleared !")
        end)
        
        menu.action(myListFunMissionsSettings, "Mission : The Big Dive !", {}, "Plays the big dive !", function()
function StartTBD()
            
    if TBDtick27CalledonceEver == 0 then
        TBDtick27CalledonceEver = 1
        util.create_tick_handler(function()
            players.set_wanted_level(players.user(), 0)

            if TBDtick27CalledonceEver == 0 then
                return false
            end
    end)

    end
        -----------------------------------------------------------
        --------------------------Useful---------------------------
        -----------------------------------------------------------


        --    DO_SCREEN_FADE_OUT(2000)
        --    util.yield(5000)
        --    DO_SCREEN_FADE_IN(2000)

        --    TRIGGER_SCREENBLUR_FADE_IN(2000)
        --    util.yield(5000)
        --    TRIGGER_SCREENBLUR_FADE_OUT(2000)


        -----------------------------------------------------------

  

    if TBDtick14CalledonceEver == 0 then
        TBDtick14CalledonceEver = 1
        util.create_tick_handler(function () -- This checks the phase of the mission
            if TBDphase == 1 and isTBDrunning == 0 then

                util.create_tick_handler(function()
                    ResetTBD()
                    TBDphase1()
                    return false
                end)

                isTBDrunning = 1
                util.yield(60000)
                isTBDrunning = 0 
                return false
            elseif TBDphase == 1 and isTBDrunning == 1 then
                util.toast("Please wait a minute before restarting to the last checkpoint !")
                TBDtick14CalledonceEver = 0
                return false
            end

            if TBDphase ~= 1 then
                return false
            end

            if TBDtick14CalledonceEver == 0 then
                return false
            end

        end)
    end

    if TBDtick13CalledonceEver == 0 then
        TBDtick13CalledonceEver = 1
        util.create_tick_handler(function ()
            if TBDphase == 2 and isTBDrunning == 0 then

                util.create_tick_handler(function()
                    isTBDrunning = 0
                    ResetTBD()
                    TBDphase2()
                    if TBDphase == 2 then
                        return false
                    end
                end)

                isTBDrunning = 1
                util.yield(60000)
                isTBDrunning = 0 
                return false
            elseif TBDphase == 2 and isTBDrunning == 1 then
                util.toast("Please wait a minute before restarting to the last checkpoint !")
                TBDtick13CalledonceEver = 0
                return false
            end

            if TBDphase ~= 2 then
                --return false
            end

            if TBDtick13CalledonceEver == 0 then
                --return false
            end

        end)
    end


    if TBDtick31CalledonceEver == 0 then
        TBDtick31CalledonceEver = 1
        util.create_tick_handler(function () -- This checks the phase of the mission
            if TBDphase == 3 and isTBDrunning == 0 then

                util.create_tick_handler(function()
                    ResetTBD()
                    TBDphase3()
                    if TBDphase == 3 then
                        return false
                    end
                end)

                isTBDrunning = 1
                util.yield(60000)
                isTBDrunning = 0 
                return false
            elseif TBDphase == 3 and isTBDrunning == 1 then
                util.toast("Please wait a minute before restarting to the last checkpoint !")
                TBDtick31CalledonceEver = 0
                return false
            end

            if TBDphase ~= 3 then
                --return false
            end

            if TBDtick31CalledonceEver == 0 then
                --return false
            end

        end)
    end


    if TBDtick42CalledonceEver == 0 then
        TBDtick42CalledonceEver = 1
        util.create_tick_handler(function () -- This checks the phase of the mission
            if TBDphase == 4 and isTBDrunning == 0 then

                util.create_tick_handler(function()
                    ResetTBD()
                    TBDphase4()
                    if TBDphase == 4 then
                        return false
                    end
                end)

                isTBDrunning = 1
                util.yield(60000)
                isTBDrunning = 0 
                return false
            elseif TBDphase == 4 and isTBDrunning == 1 then
                util.toast("Please wait a minute before restarting to the last checkpoint !")
                TBDtick42CalledonceEver = 0
                return false
            end

            if TBDphase ~= 4 then
                --return false
            end

            if TBDtick42CalledonceEver == 0 then
                --return false
            end

        end)
    end

    if TBDtick55CalledonceEver == 0 then
        TBDtick55CalledonceEver = 1
        util.create_tick_handler(function () -- This checks the phase of the mission
            if TBDphase == 5 and isTBDrunning == 0 then

                util.create_tick_handler(function()
                    ResetTBD()
                    TBDphase5()
                    if TBDphase == 5 then
                        return false
                    end
                end)

                isTBDrunning = 1
                util.yield(60000)
                isTBDrunning = 0 
                return false
            elseif TBDphase == 5 and isTBDrunning == 1 then
                util.toast("Please wait a minute before restarting to the last checkpoint !")
                TBDtick42CalledonceEver = 0
                return false
            end

            if TBDphase ~= 5 then
                --return false
            end

            if TBDtick55CalledonceEver == 0 then
                --return false
            end

        end)
    end








    end
    StartTBD()
    end)
end



function FailTBD1()

    local failtext = -1
    

if TBDtick1CalledonceEver == 0 then
    TBDtick1CalledonceEver = 1
    util.create_tick_handler(function()
        
        

        

        if GET_VEHICLE_BODY_HEALTH(TBDvehicles[3]) < 10 or GET_VEHICLE_BODY_HEALTH(TBDvehicles[4]) < 10 or GET_VEHICLE_BODY_HEALTH(TBDvehicles[5]) < 10 then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 0
            isTBDrunning = 0
            if failtext == 0 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! The phone has been destroyed")
            end
    
            DO_SCREEN_FADE_OUT(1000)
            util.yield(5000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end

        if HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[3], players.user_ped(), 1) or HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[4], players.user_ped(), 1) or HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[5], players.user_ped(), 1) or HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[3], TBDvehicles[1], 1) or HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[4], TBDvehicles[1], 1) or HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(TBDvehicles[5], TBDvehicles[1], 1) then
            util.yield(300)
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 1
            isTBDrunning = 0
            if failtext == 1 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You've been spotted by the target")
            
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(5000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end

    if TBDphase == 1 then
        if IS_PLAYER_DEAD(players.user()) then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 2
            isTBDrunning = 0
            if failtext == 2 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You died")
            
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(5000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end
    end

        if TBDphase ~= 1 then
            return false
        end
        
        if TBDtick1CalledonceEver == 0 then
            return false
        end

    end)
end

end

function FailTBD2()

    local failtext = -1
    

if TBDtick20CalledonceEver == 0 then
    TBDtick20CalledonceEver = 1
    util.create_tick_handler(function()
        

        if TBDphase ~= 2 then
            return false
        end
        
        if TBDtick20CalledonceEver == 0 then
            return false
        end

    end)
end

if TBDtick12CalledonceEver == 0 then
    TBDtick12CalledonceEver = 1
    util.create_tick_handler(function()

    if TBDphase == 2 then
        if IS_PLAYER_DEAD(players.user()) then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 0
            isTBDrunning = 0
            if failtext == 0 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You died")
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(15000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end
    end
        
        if banditoHackFailed == 1 then
            util.yield(300)
            if TBDfailMesageShown == 0 then
                TBDfailMesageShown = 1
                failtext = 1
                isTBDrunning = 0
                if failtext == 1 and TBDfailMesageShown == 1 then
                    util.toast("Mission failed ! Hacking took too long")
                
                end
                DO_SCREEN_FADE_OUT(1000)
                ANIMPOSTFX_STOP("TinyRacerPink", 0, true)
                util.yield(5000)
                FREEZE_ENTITY_POSITION(players.user_ped(), true)
                StartTBD()
                failtext = -1
                TBDfailMesageShown = 0
                return false
            end
            
        end

        if TBDphase ~= 2 then
            return false
        end

        if TBDtick12CalledonceEver == 0 then
            return false
        end

    end)

end
if TBDtick11CalledonceEver == 0 then
    TBDtick11CalledonceEver = 1
    util.create_tick_handler(function()
        if TBDfailMesageShown == 1 then
            util.yield(4000)
            TBDfailMesageShown = 0
            return false
        end

        if TBDphase ~= 2 then
            return false
        end

        if TBDtick11CalledonceEver == 0 then
            return false
        end

    end)
end
end

function FailTBD3()

    local failtext = -1
    

if TBDtick40CalledonceEver == 0 then
    TBDtick40CalledonceEver = 1
    util.create_tick_handler(function()
        

        if TBDphase ~= 3 then
            return false
        end
        
        if TBDtick40CalledonceEver == 0 then
            return false
        end

    end)
end

if TBDtick41CalledonceEver == 0 then
    TBDtick41CalledonceEver = 1
    util.create_tick_handler(function()

    if TBDphase == 3 then
        if IS_PLAYER_DEAD(players.user()) then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 0
            isTBDrunning = 0
            if failtext == 0 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You died")
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(15000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end
    end
        
        if GET_VEHICLE_BODY_HEALTH(TBDvehicles[3]) < 10  --[[and ToreadorCanBeDestroyed == 1]] then
            util.yield(300)
            if TBDfailMesageShown == 0 then
                TBDfailMesageShown = 1
                failtext = 1
                isTBDrunning = 0
                if failtext == 1 and TBDfailMesageShown == 1 then
                    util.toast("Mission failed ! The Toreador was destroyed")
                
                end
                DO_SCREEN_FADE_OUT(1000)
                util.yield(5000)
                FREEZE_ENTITY_POSITION(players.user_ped(), true)
                StartTBD()
                failtext = -1
                TBDfailMesageShown = 0
                return false
            end
            
        end

        if TBDphase ~= 3 then
            return false
        end

        if TBDtick41CalledonceEver == 0 then
            return false
        end

    end)

end
if TBDtick11CalledonceEver == 0 then
    TBDtick11CalledonceEver = 1
    util.create_tick_handler(function()
        if TBDfailMesageShown == 1 then
            util.yield(4000)
            TBDfailMesageShown = 0
            return false
        end

        if TBDphase ~= 3 then
            return false
        end

        if TBDtick11CalledonceEver == 0 then
            return false
        end

    end)
end
end



function FailTBD4()

    local failtext = -1
    

if TBDtick46CalledonceEver == 0 then
    TBDtick46CalledonceEver = 1
    util.create_tick_handler(function()
        

        if TBDphase ~= 4 then
            return false
        end
        
        if TBDtick46CalledonceEver == 0 then
            return false
        end

    end)
end

if TBDtick47CalledonceEver == 0 then
    TBDtick47CalledonceEver = 1
    util.create_tick_handler(function()

    if TBDphase == 4 then
        if IS_PLAYER_DEAD(players.user()) then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 0
            isTBDrunning = 0
            if failtext == 0 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You died")
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(15000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            ResetTBD()
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end
    end
        
        if GET_VEHICLE_BODY_HEALTH(TBDvehicles[3]) < 10  --[[and ToreadorCanBeDestroyed == 1]] then
            util.yield(300)
            --[[if TBDfailMesageShown == 0 then
                TBDfailMesageShown = 1
                failtext = 1
                isTBDrunning = 0
                if failtext == 1 and TBDfailMesageShown == 1 then
                    util.toast("Mission failed ! The Ruiner 2000 was destroyed")
                
                end
                DO_SCREEN_FADE_OUT(1000)
                util.yield(5000)
                FREEZE_ENTITY_POSITION(players.user_ped(), true)
                ResetTBD()
                StartTBD()
                failtext = -1
                TBDfailMesageShown = 0
                return false
            end]]
            
    APPLY_DAMAGE_TO_PED(players.user_ped(), 100000, true, 0)
    util.toast("Mission failed ! The Toreador was destroyed")
            
        end

        if AntonovLostCutscene == 1 then
            util.yield(300)
            --[[if TBDfailMesageShown == 0 then
                TBDfailMesageShown = 1
                failtext = 1
                isTBDrunning = 0
                if failtext == 1 and TBDfailMesageShown == 1 then
                    util.toast("Mission failed ! The Antonov took off without you")
                
                end
                DO_SCREEN_FADE_OUT(1000)
                util.yield(5000)
                FREEZE_ENTITY_POSITION(players.user_ped(), true)
                ResetTBD()
                StartTBD()
                failtext = -1
                TBDfailMesageShown = 0
                return false
            end]]
            
    APPLY_DAMAGE_TO_PED(players.user_ped(), 100000, true, 0)
    util.toast("Mission failed ! The Antonov took off without you")
            
        end

        if TBDphase ~= 4 then
            return false
        end

        if TBDtick47CalledonceEver == 0 then
            return false
        end

    end)

end
if TBDtick48CalledonceEver == 0 then
    TBDtick48CalledonceEver = 1
    util.create_tick_handler(function()
        if TBDfailMesageShown == 1 then
            util.yield(4000)
            TBDfailMesageShown = 0
            return false
        end

        if TBDphase ~= 4 then
            return false
        end

        if TBDtick48CalledonceEver == 0 then
            return false
        end

    end)
end
end

function FailTBD5()

    local failtext = -1
    

if TBDtick59CalledonceEver == 0 then
    TBDtick59CalledonceEver = 1
    util.create_tick_handler(function()
        

        if TBDphase ~= 5 then
            return false
        end
        
        if TBDtick59CalledonceEver == 0 then
            return false
        end

    end)
end

if TBDtick41CalledonceEver == 0 then
    TBDtick41CalledonceEver = 1
    util.create_tick_handler(function()

    if TBDphase == 5 then
        if IS_PLAYER_DEAD(players.user()) then
            if TBDfailMesageShown == 0 then
            TBDfailMesageShown = 1
            failtext = 0
            isTBDrunning = 0
            if failtext == 0 and TBDfailMesageShown == 1 then
                util.toast("Mission failed ! You died")
            end
            DO_SCREEN_FADE_OUT(1000)
            util.yield(15000)
            FREEZE_ENTITY_POSITION(players.user_ped(), true)
            StartTBD()
            failtext = -1
            TBDfailMesageShown = 0
            return false
            end
        end
    end
        
        if GET_VEHICLE_BODY_HEALTH(TBDvehicles[3]) < 10  --[[and ToreadorCanBeDestroyed == 1]] then
            util.yield(300)
            if TBDfailMesageShown == 0 then
                TBDfailMesageShown = 1
                failtext = 1
                isTBDrunning = 0
                if failtext == 1 and TBDfailMesageShown == 1 then
                    util.toast("Mission failed ! The Ruiner 2000 was destroyed")
                
                end
                DO_SCREEN_FADE_OUT(1000)
                util.yield(5000)
                FREEZE_ENTITY_POSITION(players.user_ped(), true)
                StartTBD()
                failtext = -1
                TBDfailMesageShown = 0
                return false
            end
            
        end

        if TBDphase ~= 5 then
            return false
        end

        if TBDtick41CalledonceEver == 0 then
            return false
        end

    end)

end
if TBDtick60CalledonceEver == 0 then
    TBDtick60CalledonceEver = 1
    util.create_tick_handler(function()
        if TBDfailMesageShown == 1 then
            util.yield(4000)
            TBDfailMesageShown = 0
            return false
        end

        if TBDphase ~= 5 then
            return false
        end

        if TBDtick60CalledonceEver == 0 then
            return false
        end

    end)
end
end


    

function missionTest()
    --[[local selectedRP = 1

    local RPstarted = 0
    local RPended = 0
    local showscore = 0

    local RPdialogue = 0

    local RPphase = 0 --default=0
   
    local RP1blips = {}
    local RP1peds = {}
    local RP1vehicles = {}
    local RP1objects = {}

    local RP1Waypoint = 0

    local RP1CutsceneCam1 = CREATE_CAMERA(26379945, true)

    local RP1CutsceneCam1Loc = v3.new(-546.4, -8.1, 45.5)
    local RP1CutsceneCam1Rot = v3.new(-10, 0, -136)
    local RP1CutsceneCam1FOV = (70)

    
    local RP1ChaseWaypoint1 = v3.new(-2937.7, 2105, 41)

    
    local starttick1 = 0
    local starttick2 = 0
    local starttick3 = 0
    local starttick4 = 0
    local starttick5 = 0
    local starttick6 = 0
    local starttick7 = 0
    local starttick8 = 0
    local starttick9 = 0


    local PoliceRoleplayScenarios = { "Street Race gone wrong" }
    menu.textslider(myListFunMissionsSettings, "Select Mission", {}, "Selects a mission to play !", PoliceRoleplayScenarios, function (index, name)
   

        

        if name == "Street Race gone wrong" then
            selectedRP = 1
            util.toast("Scenario Selected ! You can enable the Toggle Loop below to start !")
        end

    end)
    local Missiontime = 0--]]
   --WILL LAG GAME BC I MESSED UP AND EACH FREAKIN SINGLE TICK DOWN THERE IS BEING CALLED ON EVERY FRAME TILL IT LAGS THE GAME HARD--[[menu.toggle_loop(myListFunMissionsSettings, "Start Mission !", {}, "Plays the currently selected mission !", function(index, name)

    --here--[[local PlayerName = players.get_name(players.user())

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

    --if IS_CONTROL_PRESSED(0, 187) and RPphase < 8 then--remove
    --    util.yield(300)--remove
    --    RPphase = RPphase + 1--remove
    --end--remove

    --here if starttick1 == 1 then
    --[[here   util.create_tick_handler(function()
               
            
       if RPended == 0 then
        Missiontime = Missiontime + 1
            util.yield(1000)
       end
    end
        

    end)

    local SpikesHash = util.joaat("prop_rub_wreckage_7")
    util.request_model(SpikesHash)

    if IS_CONTROL_PRESSED(0, 341) and IS_PED_IN_VEHICLE(players.user_ped(), RP1vehicles[1]) then--remove
        local SpikesSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], -5, -5, -2.4)
        local heading = GET_ENTITY_HEADING(RP1vehicles[1])
        util.request_model(SpikesHash)
        local Spikes = entities.create_object(SpikesHash, SpikesSpawnOffset, 0)
        SET_ENTITY_ROTATION(Spikes, 45, 90, heading, 2, true)
        table.insert(RP1objects, #RP1objects, Spikes)
        FREEZE_ENTITY_POSITION(Spikes, true)
        --util.yield(500)
        util.create_tick_handler(function()
            SET_ENTITY_AS_MISSION_ENTITY(Spikes, true, true)
        end)
        util.yield(2000)
    end--remove
    


    if selectedRP == 0 then
        util.toast("Please select a scenario to start !")
    end

   if selectedRP == 1 then
        if RPphase == 0 then
            RPphase = 1

            RP1CutsceneCam1Loc = v3.new(-546.4, -8.1, 45.5)
            RP1CutsceneCam1Rot = v3.new(-10, 0, -136)
            RP1CutsceneCam1FOV = (70)
        end


        

        local PlayerCopCarHash = util.joaat("police")
        util.request_model(PlayerCopCarHash)
        local PlayerCopCarLocation = v3.new(408, -984.5, 30)
        local TeamMateCopCarLocation = v3.new(408, -989, 30)

        local CopPedHash = util.joaat("S_M_Y_Cop_01")
        util.request_model(CopPedHash)
        local CopTeamMatePedSpawnLocation = v3.new(433, -981, 31)

        local InvisPillarHash = util.joaat("prop_ld_dstpillar_01")
        util.request_model(InvisPillarHash)
        local InvisPillarLoc = v3.new(418.3, -985.2, 30)

        local Patrol1BlipLocation = v3.new(-626, -183, 50)
        local Patrol1BlipRadius = 400
        
        local StreetRacerCar_1_Hash = util.joaat("krieger")
        util.request_model(StreetRacerCar_1_Hash)
        local StreetRacerCar_2_Hash = util.joaat("entityxf")
        util.request_model(StreetRacerCar_2_Hash)
        local StreetRacerCar_3_Hash = util.joaat("ignus")
        util.request_model(StreetRacerCar_3_Hash)

        local StreetRacerCar_1_SpawnLoc = v3.new(-531.4, -33.9, 44)
        local StreetRacerCar_2_SpawnLoc = v3.new(-528.16, -35.1, 44)
        local StreetRacerCar_3_SpawnLoc = v3.new(-535, -32.75, 44)

        local StreetRacerDriver_1_Hash = util.joaat("U_M_M_Aldinapoli")
        util.request_model(StreetRacerDriver_1_Hash)

        local StreetRacerDriver_2_Hash = util.joaat("U_M_M_BikeHire_01")
        util.request_model(StreetRacerDriver_2_Hash)

        local StreetRacerDriver_3_Hash = util.joaat("U_F_Y_Mistress")
        util.request_model(StreetRacerDriver_3_Hash)
        
        local Patrol2BlipLocation = v3.new(-340, -21, 50)
        local Patrol2BlipRadius = 300

        
        local ChaseInterceptPointLoc = v3.new(-3029, 1890.75, 29)
        local ChaseInterceptPointRadius = 500


        


if RPphase == 1 then
    util.toast("Reach your car")--Tip
        if RPstarted == 0 then

            RPstarted = 1
            util.request_model(PlayerCopCarHash)
            local PlayerCopCar = entities.create_vehicle(PlayerCopCarHash, PlayerCopCarLocation, -128)
            table.insert(RP1vehicles, 1, PlayerCopCar)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(PlayerCopCar, true, true)
            end)
            SET_VEHICLE_RADIO_ENABLED(PlayerCopCar, false)
            
            local TeamMateCopCar = entities.create_vehicle(PlayerCopCarHash, TeamMateCopCarLocation, -128)
            table.insert(RP1vehicles, 2, TeamMateCopCar)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(TeamMateCopCar, true, true)
            end)
            SET_VEHICLE_RADIO_ENABLED(TeamMateCopCar, false)

            util.request_model(InvisPillarHash)
            local InvisPillar = entities.create_object(InvisPillarHash, InvisPillarLoc, 0)
            table.insert(RP1objects, 1, InvisPillar)
            FREEZE_ENTITY_POSITION(InvisPillar, true)
            SET_ENTITY_VISIBLE(InvisPillar, false, false)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(InvisPillar, true, true)
            end)
            

            local blipPlayerCopCar = ADD_BLIP_FOR_ENTITY(PlayerCopCar)
            table.insert(RP1blips, 1, blipPlayerCopCar)

            SET_BLIP_SPRITE(blipPlayerCopCar, 672)
            SET_BLIP_DISPLAY(blipPlayerCopCar, 2)


                util.create_tick_handler(function()
                    SET_BLIP_COLOUR(blipPlayerCopCar, 59)
                    util.yield(500)
                    SET_BLIP_COLOUR(blipPlayerCopCar, 38)
                    util.yield(500)
                end)

                util.create_tick_handler(function()
                    local PlayerLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
                    if RP1Waypoint == 0 then
                        if PlayerLocation:distance(PlayerCopCarLocation) > 5  then
                            SET_NEW_WAYPOINT(PlayerCopCarLocation.x, PlayerCopCarLocation.y)
                        end

                        if IS_PED_IN_VEHICLE(players.user_ped(), PlayerCopCar, false) then 
                            RP1Waypoint = 1
                            RPphase = 2
                            return false
                        end
                    end    
                end)
                
        end
end--phase1

if RPphase == 2 then
    util.toast("Wait for Danny to get in")--Tip
        if RPstarted == 1 then
            RPstarted = 2

            util.request_model(CopPedHash)
            local CopTeamMate = entities.create_ped(0, CopPedHash, CopTeamMatePedSpawnLocation, 0)
            table.insert(RP1peds, 1, CopTeamMate)
            --util.yield(1000)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(CopTeamMate, true, true)
            end)
                --SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(CopTeamMate, true)
            
            util.create_tick_handler(function()
                local currentpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(CopTeamMate, 0, 0, 0)
                local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], 0, 0, 0)
                if currentpos:distance(pos) < 3 then
                    TASK_ENTER_VEHICLE(CopTeamMate, RP1vehicles[1], -1, 0, 1.0, 3, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(CopTeamMate, true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)
                    FREEZE_ENTITY_POSITION(RP1peds[1], true)
                    
                    RPphase = 3
                    if IS_PED_IN_VEHICLE(CopTeamMate, RP1vehicles[1], false) then
                        RPphase = 3
                        
                    end
                    return false
                else
                    TASK_GO_TO_ENTITY(CopTeamMate, RP1vehicles[1], -1, 1.0, 100, 1073741824, 0)
                    util.yield(500)
                end
            end)

            local blipCopTeamMate = ADD_BLIP_FOR_ENTITY(CopTeamMate)
            table.insert(RP1blips, 2, blipCopTeamMate)

            SET_BLIP_SPRITE(blipCopTeamMate, 280)
            SET_BLIP_DISPLAY(blipCopTeamMate, 2)
            SET_BLIP_COLOUR(blipCopTeamMate, 18)
            
    --util.toast("boop")--remove
    --SET_PED_VEHICLE_FORCED_SEAT_USAGE--remove
    --IS_PED_SITTING_IN_VEHICLE

        end

end--phase2


if RPphase == 3 then

    util.toast("Patrol the area you've been assigned to")--Tip

        if RPstarted == 2 then
            RPstarted = 3

            local PatrolArea1 = ADD_BLIP_FOR_RADIUS(Patrol1BlipLocation.x, Patrol1BlipLocation.y, Patrol1BlipLocation.z, Patrol1BlipRadius)
            table.insert(RP1blips, 3, PatrolArea1)
            SET_BLIP_ALPHA(PatrolArea1, 90)
            SET_BLIP_DISPLAY(PatrolArea1, 2)
            SET_BLIP_COLOUR(PatrolArea1, 73)
            
            SET_NEW_WAYPOINT(Patrol1BlipLocation.x, Patrol1BlipLocation.y)--]]

            --[[util.create_tick_handler(function()
                
                local currentPlayerpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], 0, -5, 0)
                TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(RP1peds[1], RP1vehicles[2], currentPlayerpos.x, currentPlayerpos.y, currentPlayerpos.z, 150.0, 1074528292, 0.0)
               SET_PED_KEEP_TASK(RP1peds[1], true)
                    util.yield(2500)
            end) --]]

            --[[here util.create_tick_handler(function()
                --here--[[local currentPlayerpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], 0, 0, 0)
                --local currentTeamMatepos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[2], 0, 0, 0)
                --if currentTeamMatepos:distance(currentPlayerpos) > 600 and RPphase == 3 then
                --    util.toast("Wait for Danny")
                --end
                    TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)
                if currentPlayerpos:distance(Patrol1BlipLocation) < Patrol1BlipRadius-50 --]]--here  and currentPlayerpos:distance(currentTeamMatepos) < 50 --]]   here --[[ then
                  --[[ here  util.yield(5000)
                    RPphase = 4
                    return false
                end
            end)     

        end
end--phase3

if RPphase == 4 then

    TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)

    if RPdialogue == 0 then
        util.toast("Wait for instructions")--Tip
    elseif RPdialogue == 1 then
        util.toast("Radio : We need units near Hawick Avenue, a witness reported a number of high-end cars setting up an illegal street race")--Dialogue
    elseif RPdialogue == 2 then
        util.toast(PlayerName .. " : Unit 05, agent " .. PlayerName .. " here, agent Danny and I are on it")
    end


        if RPstarted == 3 then
            RPstarted = 4

            --spawn race cars
            util.request_model(StreetRacerCar_1_Hash)
            local StreetRacerCar_1 = entities.create_vehicle(StreetRacerCar_1_Hash, StreetRacerCar_1_SpawnLoc, 10)
            table.insert(RP1vehicles, 3, StreetRacerCar_1)
            SET_VEHICLE_MOD_COLOR_1(StreetRacerCar_1, 1, math.random(100, 160), math.random(100, 160))
            SET_VEHICLE_TYRES_CAN_BURST(StreetRacerCar_1, true)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerCar_1, true, true)
                
                TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)
            end)

            util.request_model(StreetRacerCar_2_Hash)
            local StreetRacerCar_2 = entities.create_vehicle(StreetRacerCar_2_Hash, StreetRacerCar_2_SpawnLoc, 10)
            table.insert(RP1vehicles, 4, StreetRacerCar_2)
            SET_VEHICLE_MOD_COLOR_1(StreetRacerCar_2, 1, math.random(100, 160), math.random(100, 160))
            SET_VEHICLE_TYRES_CAN_BURST(StreetRacerCar_2, true)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerCar_2, true, true)
            end)

            util.request_model(StreetRacerCar_3_Hash)
            local StreetRacerCar_3 = entities.create_vehicle(StreetRacerCar_3_Hash, StreetRacerCar_3_SpawnLoc, 10)
            table.insert(RP1vehicles, 5, StreetRacerCar_3)
            SET_VEHICLE_MOD_COLOR_1(StreetRacerCar_3, 1, math.random(100, 160), math.random(100, 160))
            SET_VEHICLE_TYRES_CAN_BURST(StreetRacerCar_3, true)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerCar_3, true, true)
            end)

            --spawn drivers
            util.request_model(StreetRacerDriver_1_Hash)
            util.request_model(StreetRacerDriver_2_Hash)
            util.request_model(StreetRacerDriver_3_Hash)

            local StreetRacerDriver_1 = entities.create_ped(0, StreetRacerDriver_1_Hash, StreetRacerCar_1_SpawnLoc, 0)
            SET_PED_COMBAT_ATTRIBUTES(StreetRacerDriver_1, 13, true)--aggressive
            local currentposDriver1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(StreetRacerDriver_1, 0, 0, 0)
            local StreetRacerCar1Loc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[3], 0, 0, 0)
            table.insert(RP1peds, 2, StreetRacerDriver_1)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerCar_1, true, true)
            end)

            if currentposDriver1:distance(StreetRacerCar1Loc) < 3 then
                TASK_ENTER_VEHICLE(StreetRacerDriver_1, RP1vehicles[3], -1, -1, 1.0, 16, 0)
            end

            local StreetRacerDriver_2 = entities.create_ped(0, StreetRacerDriver_2_Hash, StreetRacerCar_2_SpawnLoc, 0)
            SET_PED_COMBAT_ATTRIBUTES(StreetRacerDriver_2, 13, true)--aggressive
            local currentposDriver2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(StreetRacerDriver_2, 0, 0, 0)
            local StreetRacerCar2Loc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[4], 0, 0, 0)
            table.insert(RP1peds, 3, StreetRacerDriver_2)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerDriver_2, true, true)
            end)

            if currentposDriver2:distance(StreetRacerCar2Loc) < 3 then
                TASK_ENTER_VEHICLE(StreetRacerDriver_2, RP1vehicles[4], -1, -1, 1.0, 16, 0)
            end

            local StreetRacerDriver_3 = entities.create_ped(0, StreetRacerDriver_3_Hash, StreetRacerCar_3_SpawnLoc, 0)
            SET_PED_COMBAT_ATTRIBUTES(StreetRacerDriver_3, 13, true)--aggressive
            local currentposDriver3 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(StreetRacerDriver_3, 0, 0, 0)
            local StreetRacerCar3Loc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[5], 0, 0, 0)
            table.insert(RP1peds, 4, StreetRacerDriver_3)
            --util.yield(500)
            util.create_tick_handler(function()
                SET_ENTITY_AS_MISSION_ENTITY(StreetRacerDriver_3, true, true)
            end)

            if currentposDriver3:distance(StreetRacerCar3Loc) < 3 then
                TASK_ENTER_VEHICLE(StreetRacerDriver_3, RP1vehicles[5], -1, -1, 1.0, 16, 0)
            end




            util.create_tick_handler(function()
            
                local currentPlayerpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], 0, 0, 0)
                --TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(RP1peds[1], RP1vehicles[2], currentPlayerpos.x, currentPlayerpos.y, currentPlayerpos.z, 150.0, 1074528292, 0.0)
            
            end)

            util.create_tick_handler(function()
                util.yield(8000)
                RPdialogue = 1
                util.yield(10000)
                RPdialogue = 2
                util.yield(10000)
                RPdialogue = -1
                RPphase = 5
                return false
            end)
        end

end--phase4



if RPphase == 5 then

        --Tip

        if RPstarted == 4 then
            RPstarted = 5
            util.toast("Look for the street racers")

            util.remove_blip(RP1blips[3])

            local PatrolArea2 = ADD_BLIP_FOR_RADIUS(Patrol2BlipLocation.x, Patrol2BlipLocation.y, Patrol2BlipLocation.z, Patrol2BlipRadius)
            table.insert(RP1blips, 4, PatrolArea2)
            SET_BLIP_ALPHA(PatrolArea2, 90)
            SET_BLIP_DISPLAY(PatrolArea2, 2)
            SET_BLIP_COLOUR(PatrolArea2, 73)
            
            SET_NEW_WAYPOINT(Patrol2BlipLocation.x, Patrol2BlipLocation.y)

        util.create_tick_handler(function()
            local currentPlayerpos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(RP1vehicles[1], 0, 0, 0)

            TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)


            if currentPlayerpos:distance(StreetRacerCar_2_SpawnLoc) < 60 then
                RPphase = 6
                return false
            end
        end)



        end

end--phase5

if RPphase == 6 then

    --util.toast("")--Tip
util.create_tick_handler(function()
    if RPdialogue == 0 then
        util.toast("Radio : These three matches the descriptions of 'il gatino', the terrorist group responsible for the fall of the US Montana. Shoot them down at all cost")--Tip
    elseif RPdialogue == 1 then
        util.toast(PlayerName .. " : Roger that")
    elseif RPdialogue == 2 and RPended == 1 then
        util.toast("Mission Complete ! " .. PlayerName .. " please tell me what are you thoughts about this short mission, if a lot of people likes the concept, i have a whole lot of ideas for new short and long missions ! How to tell me your thoughts ? Simply join my discord server ! I have a feedback channel there. You will find a link in the 'About Lolascript' section of the script ! To close this message please restart the script")
        
    end
    
    if RPended == 1 and showscore == 0 then

            util.create_tick_handler(function()
                util.toast("The lower the score, the faster you were to complete the mission. " .. PlayerName .. "'s' score : " .. Missiontime)
                if showscore == 1 then
                    return false
                end
            end)
        end
end)
    util.create_tick_handler(function()
        
        util.yield(8000)
        RPdialogue = 0
        util.yield(8000)
        RPdialogue = 1
        util.yield(8000)
        RPdialogue = 2
        RPphase = 5
        return false
    end)

    if RPstarted == 5 then
        RPstarted = 6
            
        local StreetCarsLocationsBlipRadius = 50
        
        local StreetCarsLocationsBlip = ADD_BLIP_FOR_RADIUS(StreetRacerCar_2_SpawnLoc.x, StreetRacerCar_2_SpawnLoc.y, StreetRacerCar_2_SpawnLoc.z, StreetCarsLocationsBlipRadius)
        table.insert(RP1blips, 5, StreetCarsLocationsBlip)
        SET_BLIP_ALPHA(StreetCarsLocationsBlip, 90)
        SET_BLIP_DISPLAY(StreetCarsLocationsBlip, 2)
        SET_BLIP_COLOUR(StreetCarsLocationsBlip, 63)


        TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)
        util.yield(2000)
        RPphase = 7

        
    end

    
end--phase6


if RPphase == 7 then

    --util.toast("Look for the street racers")--Tip

   --here --[[if RPstarted == 6 then
        RPstarted = 7

        local next = 0

        SET_CAM_COORD(RP1CutsceneCam1, RP1CutsceneCam1Loc.x, RP1CutsceneCam1Loc.y, RP1CutsceneCam1Loc.z)
        SET_CAM_ROT(RP1CutsceneCam1, RP1CutsceneCam1Rot.x, RP1CutsceneCam1Rot.y, RP1CutsceneCam1Rot.z, 2)
        SET_CAM_FOV(RP1CutsceneCam1, RP1CutsceneCam1FOV)

        RENDER_SCRIPT_CAMS(true, true, 1, 1, 0, 0)

        FREEZE_ENTITY_POSITION(RP1vehicles[1], true)
        DISABLE_ALL_CONTROL_ACTIONS(0)
        util.yield(10)
        FREEZE_ENTITY_POSITION(RP1vehicles[1], false)

        SET_ENTITY_COORDS_NO_OFFSET(RP1vehicles[1], -507.2, -2.2, 45, false, false, false)
        SET_ENTITY_HEADING(RP1vehicles[1], 125.8)
        SET_VEHICLE_FORWARD_SPEED_XY(RP1vehicles[1], 12)

        local d1oonce = 0
            local d2oonce = 0
            local d3oonce = 0
            local d4oonce = 0
            local d5oonce = 0
            local d6oonce = 0

            local TerroDeath1 = 0
            local TerroDeath2 = 0
            local TerroDeath3 = 0

        --util.yield(3000)
        util.create_tick_handler(function()
            SET_CAM_ROT(RP1CutsceneCam1, RP1CutsceneCam1Rot.x, RP1CutsceneCam1Rot.y, RP1CutsceneCam1Rot.z, 2)
            SET_CAM_FOV(RP1CutsceneCam1, RP1CutsceneCam1FOV)

            TASK_ENTER_VEHICLE(RP1peds[1], RP1vehicles[1], -1, 0, 1.0, 16, 0)
                    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(RP1peds[1], true)
                    SET_VEHICLE_DOORS_LOCKED(RP1vehicles[1], 4)


            if RP1CutsceneCam1Rot.z > -140 then
                RP1CutsceneCam1Rot.z = RP1CutsceneCam1Rot.z - 0.05
            end
            if RP1CutsceneCam1Rot.x < -5 then
                RP1CutsceneCam1Rot.x = RP1CutsceneCam1Rot.x + 0.05
            end

            if RP1CutsceneCam1FOV > 30 then
                RP1CutsceneCam1FOV = RP1CutsceneCam1FOV - 0.25
            end
            
            if RP1CutsceneCam1FOV <= 30 and next == 0 then
                
                util.yield(1500)
                next = 1
                SET_VEHICLE_SIREN(RP1vehicles[1], true)
                util.yield(500)
                RENDER_SCRIPT_CAMS(false, true, 1, 1, 0, 0);
                DESTROY_CAM(RP1CutsceneCam1, true)
                ENABLE_ALL_CONTROL_ACTIONS(0)

                local blipStreetRacer1 = ADD_BLIP_FOR_ENTITY(RP1vehicles[3])
                table.insert(RP1blips, 6, blipStreetRacer1)

                SET_BLIP_SPRITE(blipStreetRacer1, 669)
                SET_BLIP_DISPLAY(blipStreetRacer1, 2)
                SET_BLIP_COLOUR(blipStreetRacer1, 6)


                local blipStreetRacer2 = ADD_BLIP_FOR_ENTITY(RP1vehicles[4])
                table.insert(RP1blips, 7, blipStreetRacer2)

                SET_BLIP_SPRITE(blipStreetRacer2, 663)
                SET_BLIP_DISPLAY(blipStreetRacer2, 2)
                SET_BLIP_COLOUR(blipStreetRacer2, 6)


                local blipStreetRacer3 = ADD_BLIP_FOR_ENTITY(RP1vehicles[5])
                table.insert(RP1blips, 8, blipStreetRacer3)

                SET_BLIP_SPRITE(blipStreetRacer3, 523)
                SET_BLIP_DISPLAY(blipStreetRacer3, 2)
                SET_BLIP_COLOUR(blipStreetRacer3, 6)

                util.remove_blip(RP1blips[4])
                util.remove_blip(RP1blips[5])

                local InterceptPointBlip = ADD_BLIP_FOR_RADIUS(ChaseInterceptPointLoc.x, ChaseInterceptPointLoc.y, ChaseInterceptPointLoc.z, ChaseInterceptPointRadius)
                table.insert(RP1blips, 9, InterceptPointBlip)
                SET_BLIP_ALPHA(InterceptPointBlip, 0)
                SET_BLIP_DISPLAY(InterceptPointBlip, 2)
                SET_BLIP_COLOUR(InterceptPointBlip, 12)
                
            end

            if next == 1 then
                
                    
                    TASK_VEHICLE_DRIVE_WANDER(RP1peds[3], RP1vehicles[4], 400.0, 1074528292)
                    --TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(RP1peds[3], RP1vehicles[4], RP1ChaseWaypoint1.x, RP1ChaseWaypoint1.y, RP1ChaseWaypoint1.z, 400.0, 1074528292, 0.0)
                    util.yield(750)
                    TASK_VEHICLE_DRIVE_WANDER(RP1peds[2], RP1vehicles[3], 400.0, 1074528292)
                    --TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(RP1peds[2], RP1vehicles[3], RP1ChaseWaypoint1.x, RP1ChaseWaypoint1.y, RP1ChaseWaypoint1.z, 400.0, 1074528292, 0.0)
                    util.yield(750)
                    TASK_VEHICLE_DRIVE_WANDER(RP1peds[4], RP1vehicles[5], 400.0, 1074528292)
                    --TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(RP1peds[4], RP1vehicles[5], RP1ChaseWaypoint1.x, RP1ChaseWaypoint1.y, RP1ChaseWaypoint1.z, 400.0, 1074528292, 0.0)

            
            end

            
            util.create_tick_handler(function()
            
                if IS_VEHICLE_TYRE_BURST(RP1vehicles[3], 0, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[3], 1, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[3], 4, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[3], 5, false) then
                    
                    if d1oonce == 0 then
                    SET_VEHICLE_ENGINE_HEALTH(RP1vehicles[3], -1)
                    util.remove_blip(RP1blips[6])

                    local blipTerrorist1 = ADD_BLIP_FOR_ENTITY(RP1peds[2])
                    table.insert(RP1blips, 6, blipTerrorist1)

                    SET_BLIP_SPRITE(blipTerrorist1, 429)
                    SET_BLIP_DISPLAY(blipTerrorist1, 2)
                    SET_BLIP_COLOUR(blipTerrorist1, 6)
                    d1oonce = 1
                    end
                end

                if IS_VEHICLE_TYRE_BURST(RP1vehicles[4], 0, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[4], 1, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[4], 4, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[4], 5, false) then
                    
                    if d2oonce == 0 then
                    SET_VEHICLE_ENGINE_HEALTH(RP1vehicles[4], -1)
                    util.remove_blip(RP1blips[7])

                    local blipTerrorist2 = ADD_BLIP_FOR_ENTITY(RP1peds[3])
                    table.insert(RP1blips, 7, blipTerrorist2)

                    SET_BLIP_SPRITE(blipTerrorist2, 429)
                    SET_BLIP_DISPLAY(blipTerrorist2, 2)
                    SET_BLIP_COLOUR(blipTerrorist2, 6)
                    d2oonce = 1
                    end
                end

                if IS_VEHICLE_TYRE_BURST(RP1vehicles[5], 0, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[5], 1, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[5], 4, false) or IS_VEHICLE_TYRE_BURST(RP1vehicles[5], 5, false) then
                    
                    if d3oonce == 0 then
                    SET_VEHICLE_ENGINE_HEALTH(RP1vehicles[5], -1)
                    util.remove_blip(RP1blips[8])

                    local blipTerrorist3 = ADD_BLIP_FOR_ENTITY(RP1peds[4])
                    table.insert(RP1blips, 8, blipTerrorist3)

                    SET_BLIP_SPRITE(blipTerrorist3, 429)
                    SET_BLIP_DISPLAY(blipTerrorist3, 2)
                    SET_BLIP_COLOUR(blipTerrorist3, 6)
                    d3oonce = 1
                    end
                end

                if IS_PED_DEAD_OR_DYING(RP1peds[2], 1) then
                    if d4oonce == 0 then
                    util.remove_blip(RP1blips[6])
                    TerroDeath1 = 1
                    d4oonce = 1
                    end
                end

                if IS_PED_DEAD_OR_DYING(RP1peds[3], 1) then
                    if d5oonce == 0 then
                    util.remove_blip(RP1blips[7])
                    TerroDeath2 = 1
                    d5oonce = 1
                    end
                end

                if IS_PED_DEAD_OR_DYING(RP1peds[4], 1) then
                    if d6oonce == 0 then
                    util.remove_blip(RP1blips[8])
                    TerroDeath3 = 1
                    d6oonce = 1
                    end
                end--
                

                if TerroDeath1 == 1 and TerroDeath2 == 1 and TerroDeath3 == 1 then
                    RPended = 1
                    RPdialogue = 2
                    PLAY_MISSION_COMPLETE_AUDIO("FRANKLIN_BIG_01");
                    ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
                    util.yield(5000)
                    ANIMPOSTFX_STOP("HeistCelebPass", 0, true)
                    TerroDeath3 = 2
                    showscore = 1
                    return false
                end

            end)

        end)



    end
end--phase7



end

end)--]] --here


---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------




   --[[end, function()

    RPstarted = 0
    RPended = 0
    showscore = 0

    RPdialogue = 0

    RPphase = 0

    RP1Waypoint = 0
    Missiontime = 0

    for i, blip in RP1blips do
        util.remove_blip(blip)
    end
    RP1blips = {}

    for i, ped in RP1peds do
        entities.delete(ped)
    end
    RP1peds = {}

    for i, vehicle in RP1vehicles do
        entities.delete(vehicle)
    end
    RP1vehicles = {}

    for i, object in RP1objects do
        entities.delete(object)
    end
    RP1objects = {}

    if DOES_CAM_EXIST(RP1CutsceneCam1) then
        RENDER_SCRIPT_CAMS(false, true, 1, 1, 0, 0);
        DESTROY_CAM(RP1CutsceneCam1, true)
    end

    RP1CutsceneCam1Loc = v3.new(-546.4, -8.1, 45.5)
    RP1CutsceneCam1Rot = v3.new(-10, 0, -136)
    RP1CutsceneCam1FOV = (70)

end)--]] --here
end


































    

























--------------------------------------------------------------------------------------------
players.add_command_hook(function(pid, root) --[[you will need the pid for most things and the root is the root of the players
    menu. You can make a divider for the name of your script in the player menu]]
    menu.player_root(pid):divider("Lola Script")


    --[[local fx_looped
        root:toggle("loop", {}, "", function(on)
            if on then
                USE_PARTICLE_FX_ASSET("scr_sum2_hal")
                fx_looped = START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY("scr_sum2_hal_bike_flames_orange", players.user_ped(), 0, 0, 0, 0, 0, 0, 1, false, false, false, 255, 255, 255, 255)
            else
                STOP_PARTICLE_FX_LOOPED(fx_looped, false)
                REMOVE_PARTICLE_FX(fx_looped, false)
            end
        end)

        root:toggle_loop("non loop", {}, "", function()
            USE_PARTICLE_FX_ASSET("scr_bike_adversary")
            --start_networked_particle_fx_non_looped_at_coord("", 0, 0, 0, 0, 0, 0, 1, false, false, false, false)
            START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_adversary_trail_lightning", players.user_ped(), 0, 0, 0, 0, 0, 0, 1, false, false, false)
        end)]]
    --[[Adding COMMANDPERM_FRIENDLY to the end like it was done here makes it to where if friendly options are set for
    chat commands. ]]

    --root:action("Teleport to them", {"tptoplayer"}, "Teleport yourself to them", function()
    --    local target = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) --first you will want to get their Player Ped
    --    local tar_coords = ENTITY.GET_ENTITY_COORDS(target, true) --next get their coordinates
    --    ENTITY.SET_ENTITY_COORDS(players.user_ped(), tar_coords.x, tar_coords.y, tar_coords.z, false, false, false, false)
    --finally teleport to them, you can use players.user_ped() to get your player ped
    --end, nil, nil, COMMANDPERM_FRIENDLY)

    --to make a list in the players menu
    local PlayerSpectate = menu.player_root(pid)
    local PlayerTrollingList =  root:list('Trolling', {'Trolling'}, 'Trolling Options')
    local PlayerFriendlyList =  root:list('Friendly', {'Friendly'}, 'Friendly Options')


    
    ---------------------------
    --Friendly
    ---------------------------


    local PlayerFriendlyVehicleList = menu.list(PlayerFriendlyList, "Vehicle", {}, "Vehicle Settings")

    PlayerFriendlyVehicleList:textslider("Spawn Vehicle", {}, "Spawns the selected vehicle", SpawnableVehicles, function (index, name) -- changed these value names to be more sense
        local hash = util.joaat(vehicles[index])
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        util.request_model(hash) -- its better to call as less functions as possible because more performance
        local offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 3, 0) -- changed the name to be offset u can still pick pos but i like offset more because it tells u what it is
        local heading = GET_ENTITY_HEADING(pedm) -- changed to heading same reason as above
        local spawnedCar = entities.create_vehicle(hash, offset, heading) -- only put heading in here because you already got the heading of ur own ped and there is no need to get the heading of the heading you already got
        SET_PED_INTO_VEHICLE(pedm, spawnedCar, -1)
    end)



    PlayerFriendlyVehicleList:action('Fix Vehicle', {}, 'Fixes the current vehicle', function ()
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        -- get the players model

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_VEHICLE_DEFORMATION_FIXED(vmod)
            SET_VEHICLE_FIXED(vmod)
        end

    end)



    local PlayerFriendlyPetList =  PlayerFriendlyList:list('Pet', {'Pet'}, 'Pet Options')


    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    ----------------------------------PETS
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Clone", {}, "Spawns a pet clone near this player (must spectate or be near of it to work properly)", function ()

        
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        
        
        
        

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)


        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local PetAnimal = CLONE_PED(pedm, true, false, true)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(PetAnimal)



        util.create_tick_handler(function()

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
            TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                return false
            end
        end)

        util.create_tick_handler(function()

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                util.toast("RIP " .. PetNamesList[math.random(1, #PetNamesList)] .. " :'(")
                return false
            end
        end)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rat", {}, "Spawns a pet rat near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rat")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rabbit", {}, "Spawns a pet rabbit near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_01")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Giant Rabbit", {}, "Spawns a pet giant rabbit near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Kitty", {}, "Spawns a pet kitty near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Cat_01")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)
    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Poodle", {}, "Spawns a pet poodle near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Poodle")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Westy", {}, "Spawns a pet westy near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Westy")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pug", {}, "Spawns a pet pug near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Pug", {}, "Spawns a pet zombie pug near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rottweiler", {}, "Spawns a pet rottweiler near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rottweiler")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Retriever", {}, "Spawns a pet retriever near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Retriever")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Shepherd", {}, "Spawns a pet shepherd near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_shepherd")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Husky", {}, "Spawns a pet husky near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Husky")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Coyote", {}, "Spawns a pet coyote near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Coyote", {}, "Spawns a pet zombie coyote near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Mountain Lion", {}, "Spawns a pet mountain lion near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Mountain Lion", {}, "Spawns a pet zombie mountain lion near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Panther", {}, "Spawns a pet panther near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Panther")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rhesus", {}, "Spawns a pet rhesus near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rhesus")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Chimp", {}, "Spawns a pet chimp near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Chimp_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pig", {}, "Spawns a pet pig near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pig")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Boar", {}, "Spawns a pet boar near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet zombie boar", {}, "Spawns a pet zombie boar near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Cow", {}, "Spawns a pet cow near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Cow")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Deer", {}, "Spawns a pet deer near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Deer", {}, "Spawns a pet zombie deer near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Fishy", {}, "Spawns a pet fishy near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Fish")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Stingray", {}, "Spawns a pet stingray near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Stingray")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Dolphin", {}, "Spawns a pet dolphin near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Dolphin")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hammerhead Shark", {}, "Spawns a pet hammerhead shark near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkHammer")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Tiger Shark", {}, "Spawns a pet tiger shark near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkTiger")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Killer Whale", {}, "Spawns a pet killer whale near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_KillerWhale")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hump Back Whale", {}, "Spawns a pet hump back whale near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_HumpBack")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pigeon", {}, "Spawns a pet pigeon near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pigeon")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Crow", {}, "Spawns a pet Crow near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Crow")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hen", {}, "Spawns a pet hen near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Hen")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Seagull", {}, "Spawns a pet seagull near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Seagull")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Chickehawk", {}, "Spawns a pet chickenhawk near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Chickenhawk")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Cormorant", {}, "Spawns a pet cormorant near this player (must spectate or be near of it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Cormorant")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)



    












    local PlayerFunnyList =  root:list('Funny', {'Funny'}, 'Funny Options')
    local PlayerFunnyVehicleList =  PlayerFunnyList:list('Vehicle', {'Vehicle'}, 'Funny Vehicle Options')
    local PlayerTeleportList =  root:list('Teleport', {'Teleport'}, 'Teleport Options')

    menu.action(PlayerSpectate, "Spectate Player ?", {}, "Spectate Player On/Off", function (on_change)
        local  pname = GET_PLAYER_NAME(pid)
        menu.trigger_commands('spectate'.. pname)
    end)

    menu.action(PlayerTeleportList, "Teleport to Player ?", {}, "Teleport to Player", function (on_change)
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local User = players.user_ped()
        local Coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm ,0 ,0 , 1)
        SET_ENTITY_COORDS(User, Coords.x, Coords.y, Coords.z)
    end)

    menu.action(PlayerTeleportList, "Teleport to Player to me ?", {}, "Teleport the Player to me", function (on_change)
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local User = players.user_ped()
        local Coords = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(User ,0 ,0 , 1)
        SET_ENTITY_COORDS(pedm, Coords.x, Coords.y, Coords.z)
    end)

    function Get_Entity(entity)
        local tick = 0
        NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
        while not NETWORK_HAS_CONTROL_OF_ENTITY(entity) do
            NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
            local netId = NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
            SET_NETWORK_ID_CAN_MIGRATE(netId, true)
            util.yield()
            tick =  tick + 1
            if tick > 20 then
                if not NETWORK_HAS_CONTROL_OF_ENTITY(entity) then
                    --if set.alert then
                    util.toast('Could not gain control')
                    --end
                    return entity
                end

            end
        end
        return NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    end






















    --menu.divider(PlayerTrollingList, "------")

    local PlayerTrollingVehicleList = menu.list(PlayerTrollingList, "Vehicle", {}, "Vehicle Settings")
    local PlayerTrollingPedList = menu.list(PlayerTrollingList, "Ped", {}, "Ped Settings")


    menu.action(PlayerTrollingVehicleList, "Bonk Player", {}, "Spawns a wall to bonk their vehicle", function()

        --    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        --    local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 10, 0)
        --    local heading = GET_ENTITY_HEADING(pedm)

        --local hash = util.joaat("hauler2")

        --entities.create_object(hash, pos, 0) v_ind_cfwaste prop_asteroid_01 235950308 3994755895
        --entities.create_vehicle(hash, pos, heading+180)

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 12, 0)
        local hash = 4089655941
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        local Wall = entities.create_object(hash, Offset)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
        --SET_ENTITY_HEADING(Wall, heading + 90)
        SET_ENTITY_ROTATION(Wall, rot.x, rot.y, heading)
        util.toast("BONK !")

        util.yield(3000)
        entities.delete_by_handle(Wall)

    end)


    menu.action(PlayerTrollingVehicleList, "Launch Player !", {}, "Launches the player", function()
        local  pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        SET_ENTITY_VELOCITY(CurrentVehicle, 0, 0, 50)
        --SET_ENTITY_HEADING(Asteroid, heading)
        --SET_ENTITY_VELOCITY(Asteroid, 0, 0, -3000)


        util.toast("Launched !")



    end)

    local KamikazePlanesTable = {}

    local KamikazeActive = 0

    menu.action(PlayerTrollingVehicleList, "Send Kamikaze !", {}, "Sends a random plane to rush the player", function()
        local  pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local  pname = GET_PLAYER_NAME(pid)
        local  Ppedm = GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
        local randomPlane = util.joaat(JetSquadronRealNames[math.random(1, #JetSquadronRealNames)])
        util.request_model(randomPlane)

        util.toast("LEEROY JENKINS !")

        local radius = 200
        local VictimRadius = 50
        local ExplosionRadius = 5
        local emergencyEscape = 0
        local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

        if next(KamikazePlanesTable) == nil then
            SavePlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)
        end

        table.insert(KamikazePlanesTable, 1, 1)
        local KnowVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-VictimRadius, VictimRadius), math.random(-VictimRadius, VictimRadius), math.random(-VictimRadius, VictimRadius))
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), math.random(100, 500))
        local Kamikaze = entities.create_vehicle(randomPlane, Offset, math.random(-180, 180))


        local KamikazeCam = CREATE_CAMERA(26379945, true)

        menu.trigger_commands('spectate'..pname)

        SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), KnowVictimOffset.x, KnowVictimOffset.y, KnowVictimOffset.z, false, false, false)
        SET_ENTITY_VISIBLE(players.user_ped(), false, false)

        util.create_tick_handler(function()
            set_entity_face_entity(Kamikaze, pedm, true)
            APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(Kamikaze, 1, 0, 1.5, 0.5, true, true, true, true)

            --SET_ENTITY_VELOCITY(Kamikaze, 0, 0, -3000)
            RENDER_SCRIPT_CAMS(true, false, 3000, 1, 0, 0)
            SHAKE_CAM(KamikazeCam, "DRUNK_SHAKE", 1)
            ANIMPOSTFX_PLAY("MP_corona_switch_supermod", 0, true)
            ANIMPOSTFX_PLAY("MP_OrbitalCannon", 0, true)

            if HAS_ENTITY_COLLIDED_WITH_ANYTHING(Kamikaze) or IS_PLAYER_DEAD(pedm) or emergencyEscape == 1 then

                local KamikazeOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Kamikaze,  math.random(-ExplosionRadius, ExplosionRadius),  math.random(-ExplosionRadius, ExplosionRadius),  math.random(-ExplosionRadius, ExplosionRadius))

                -- func.use_fx_asset("scr_xm_orbital")
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 59, 1, true, false, 1.0, false)
                PLAY_SOUND_FROM_ENTITY(-1, "DLC_XM_Explosions_Orbital_Cannon", Kamikaze, 0, true, false)

                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)
                ADD_EXPLOSION(KamikazeOffset.x, KamikazeOffset.y, KamikazeOffset.z, 1, 1, true, false, 1.0, false)
                util.yield(50)

                util.yield(1500)
                RENDER_SCRIPT_CAMS(false, false, 3000, 1, 0, 0);
                DESTROY_CAM(KamikazeCam, true)
                ANIMPOSTFX_STOP("MP_OrbitalCannon", 0, true)
                ANIMPOSTFX_STOP("MP_OrbitalCannon", 0, true)
                ANIMPOSTFX_STOP("MP_corona_switch_supermod", 0, true)
                ANIMPOSTFX_STOP("MP_corona_switch_supermod", 0, true)
                entities.delete(Kamikaze)
                SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), SavePlayerOffset.x, SavePlayerOffset.y, SavePlayerOffset.z, false, false, false)
                SET_ENTITY_VISIBLE(players.user_ped(), true, true)
                emergencyEscape = 0
                util.yield(200)
                table.remove(KamikazePlanesTable, 1)
                --menu.trigger_commands('spectate'.. pname)
                KamikazeActive = 0
                return false
            end


        end)

        --SET_ENTITY_COORDS(players.user_ped(), Offset.x, Offset.y, Offset.z, false, false, false, false)
        HARD_ATTACH_CAM_TO_ENTITY(KamikazeCam, Kamikaze, -10, 0, 0, 0, -10, 6, true)

        --util.toast(KamikazeCam)
        local cause = GET_VEHICLE_CAUSE_OF_DESTRUCTION(Kamikaze)
        SET_ALLOW_VEHICLE_EXPLODES_ON_CONTACT(Kamikaze, true)

        SET_VEHICLE_ENGINE_ON(Kamikaze, true, true, 0)
        KamikazePilot = CREATE_RANDOM_PED_AS_DRIVER(Kamikaze, 1)
        CONTROL_LANDING_GEAR(Kamikaze, 3)

        util.yield(20000)
        emergencyEscape = 1

    end)

    --SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION

    menu.action(PlayerTrollingVehicleList, "Blender", {}, "Grinds the player to shreds", function(on)

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local windmillHash = 1952396163
        util.request_model(windmillHash)
        local heading = GET_ENTITY_HEADING(pedm)
    
        local Wind1playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -8, 1-1, -30)
        local windmill_1 = entities.create_object(windmillHash, Wind1playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_1, 0, 0, heading)
        
        local Wind2playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 8, -3-1, -30)
        local windmill_2 = entities.create_object(windmillHash, Wind2playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_2, 0, 0, heading+180)

        local Wind3playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -8, 1+2, -30)
        local windmill_3 = entities.create_object(windmillHash, Wind3playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_3, 0, 0, heading)
        
        local Wind4playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 8, -3+2, -30)
        local windmill_4 = entities.create_object(windmillHash, Wind4playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_4, 0, 0, heading+180)


        
        local Wind5playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 2, 10, -30)
        local windmill_5 = entities.create_object(windmillHash, Wind5playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_5, 0, 0, heading-90)
        
        local Wind6playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -2, -10, -30)
        local windmill_6 = entities.create_object(windmillHash, Wind6playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_6, 0, 0, heading+90)
        
        local Wind7playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 2-1, 10, -30)
        local windmill_7 = entities.create_object(windmillHash, Wind7playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_7, 0, 0, heading-90)
        
        local Wind8playerLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -2+1, -10, -30)
        local windmill_8 = entities.create_object(windmillHash, Wind8playerLoc, 0)
        SET_ENTITY_ROTATION(windmill_8, 0, 0, heading+90)
    
    
    
    
    
        util.yield(3000)
        entities.delete(windmill_1)
        entities.delete(windmill_2)
        entities.delete(windmill_3)
        entities.delete(windmill_4)
        entities.delete(windmill_5)
        entities.delete(windmill_6)
        entities.delete(windmill_7)
        entities.delete(windmill_8)
    
    
    end)

function divider_1 (on)

    if on == true then
        --divider = 
    else
        --menu.delete(divider)
    end


end

menu.divider(PlayerFunnyList, "------")

local myListFunMinigamesSettings = root.list(PlayerFunnyList, "Minigames", {}, "Play Minigames !")



menu.action(myListFunMinigamesSettings, "Choose Your Fate", {}, "Let the player choose his fate by selecting one of 6 cars, 4 of them will kill them", function()
        
    

    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spawnArena = 0

    local FloorHash = util.joaat("stt_prop_stunt_landing_zone_01")
    local WallAHash = util.joaat("stt_prop_stunt_landing_zone_01")
    local WallBHash = util.joaat("stt_prop_stunt_landing_zone_01")
    local WallCHash = util.joaat("stt_prop_stunt_landing_zone_01")
    local WallDHash = util.joaat("stt_prop_stunt_landing_zone_01")
    local CarHash = util.joaat("emperor")
    local RewardHash = util.joaat("raiju")
    
    local ArrowHash = util.joaat("prop_mk_arrow_3d") -- prop_ar_arrow_3
    util.request_model(FloorHash)
    util.request_model(WallAHash)
    util.request_model(WallBHash)
    util.request_model(WallCHash)
    util.request_model(WallDHash)
    util.request_model(CarHash)
    util.request_model(ArrowHash)
    util.request_model(RewardHash)

    if IS_PED_IN_ANY_VEHICLE(pedm, true) and not IS_PED_IN_MODEL(pedm, CarHash) and spawnArena == 0 then --checking if they are in a vehicle
        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
        Get_Entity(vmod) --get controls
        --util.toast("Vehicle deleted !")
        FREEZE_ENTITY_POSITION(vmod, true)
        util.yield(100)
        FREEZE_ENTITY_POSITION(vmod, false)
        SET_ENTITY_VELOCITY(vmod, 0, 0, 500)
        util.yield(1000)
        spawnArena = 1
        FREEZE_ENTITY_POSITION(vmod, true)
        util.yield(100)
        FREEZE_ENTITY_POSITION(vmod, false)
        util.yield(3000)
        entities.delete_by_handle(vmod)
    else
        util.toast("Player is not in a vehicle ! (if the player is in an Emperor, wait for him to change car)")
    end
    
    --util.yield(1300)

if spawnArena == 1 then
    


    local heading = GET_ENTITY_HEADING(pedm)
    local VictimSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 3)
    local BadSongOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -5, 30, 5)
    local GoodSongOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 5, 30, 5)
    local FloorVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, -4)
    local WallAVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 40, -4)
    local WallBVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, -5, -4)
    local WallCVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 25, 0, -4)
    local WallDVictimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -25, 0, -4)
    
    local RewardSpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 5)
    
    local Car1Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -7.5, 30, 0)
    local Car2Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -2.5, 30, 0)
    local Car3Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 2.5, 30, 0)
    local Car4Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 7.5, 30, 0)
    local Car5Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, -12.5, 30, 0)
    local Car6Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 12.5, 30, 0)

    
    
    FREEZE_ENTITY_POSITION(pedm, true)

        local TPoffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
        SET_ENTITY_COORDS(players.user(), TPoffset.x, TPoffset.y, TPoffset.z)
    
        BadSong = entities.create_vehicle(CarHash, BadSongOffset, heading)
        GoodSong = entities.create_vehicle(CarHash, GoodSongOffset, heading)
   
        Floor = entities.create_object(FloorHash, FloorVictimOffset, heading)
        WallA = entities.create_object(WallAHash, WallAVictimOffset, heading)
        WallB = entities.create_object(WallBHash, WallBVictimOffset, heading)
        WallC = entities.create_object(WallCHash, WallCVictimOffset, heading)
        WallD = entities.create_object(WallDHash, WallDVictimOffset, heading)
        
        Car1 = entities.create_vehicle(CarHash, Car1Offset, 180 + heading)
        Car2 = entities.create_vehicle(CarHash, Car2Offset, 180 + heading)
        Car3 = entities.create_vehicle(CarHash, Car3Offset, 180 + heading)
        Car4 = entities.create_vehicle(CarHash, Car4Offset, 180 + heading)
        Car5 = entities.create_vehicle(CarHash, Car5Offset, 180 + heading)
        Car6 = entities.create_vehicle(CarHash, Car6Offset, 180 + heading)
        
        Arrow1 = entities.create_object(ArrowHash, Car1Offset, heading)
        Arrow2 = entities.create_object(ArrowHash, Car2Offset, heading)
        Arrow3 = entities.create_object(ArrowHash, Car3Offset, heading)
        Arrow4 = entities.create_object(ArrowHash, Car4Offset, heading)
        Arrow5 = entities.create_object(ArrowHash, Car5Offset, heading)
        Arrow6 = entities.create_object(ArrowHash, Car6Offset, heading)
        
        Arrow1o1 = entities.create_object(ArrowHash, Car1Offset, heading)
        Arrow2o1 = entities.create_object(ArrowHash, Car2Offset, heading)
        Arrow3o1 = entities.create_object(ArrowHash, Car3Offset, heading)
        Arrow4o1 = entities.create_object(ArrowHash, Car4Offset, heading)
        Arrow5o1 = entities.create_object(ArrowHash, Car5Offset, heading)
        Arrow6o1 = entities.create_object(ArrowHash, Car6Offset, heading)
        
        Arrow1o2 = entities.create_object(ArrowHash, Car1Offset, heading)
        Arrow2o2 = entities.create_object(ArrowHash, Car2Offset, heading)
        Arrow3o2 = entities.create_object(ArrowHash, Car3Offset, heading)
        Arrow4o2 = entities.create_object(ArrowHash, Car4Offset, heading)
        Arrow5o2 = entities.create_object(ArrowHash, Car5Offset, heading)
        Arrow6o2 = entities.create_object(ArrowHash, Car6Offset, heading)

        SET_ENTITY_COORDS(Arrow1, Car1Offset.x, Car1Offset.y, Car1Offset.z + 1)
        SET_ENTITY_COORDS(Arrow2, Car2Offset.x, Car2Offset.y, Car2Offset.z + 1)
        SET_ENTITY_COORDS(Arrow3, Car3Offset.x, Car3Offset.y, Car3Offset.z + 1)
        SET_ENTITY_COORDS(Arrow4, Car4Offset.x, Car4Offset.y, Car4Offset.z + 1)
        SET_ENTITY_COORDS(Arrow5, Car5Offset.x, Car5Offset.y, Car5Offset.z + 1)
        SET_ENTITY_COORDS(Arrow6, Car6Offset.x, Car6Offset.y, Car6Offset.z + 1)

        SET_ENTITY_COORDS(Arrow1o1, Car1Offset.x, Car1Offset.y, Car1Offset.z + 1)
        SET_ENTITY_COORDS(Arrow2o1, Car2Offset.x, Car2Offset.y, Car2Offset.z + 1)
        SET_ENTITY_COORDS(Arrow3o1, Car3Offset.x, Car3Offset.y, Car3Offset.z + 1)
        SET_ENTITY_COORDS(Arrow4o1, Car4Offset.x, Car4Offset.y, Car4Offset.z + 1)
        SET_ENTITY_COORDS(Arrow5o1, Car5Offset.x, Car5Offset.y, Car5Offset.z + 1)
        SET_ENTITY_COORDS(Arrow6o1, Car6Offset.x, Car6Offset.y, Car6Offset.z + 1)

        SET_ENTITY_COORDS(Arrow1o2, Car1Offset.x, Car1Offset.y, Car1Offset.z + 1)
        SET_ENTITY_COORDS(Arrow2o2, Car2Offset.x, Car2Offset.y, Car2Offset.z + 1)
        SET_ENTITY_COORDS(Arrow3o2, Car3Offset.x, Car3Offset.y, Car3Offset.z + 1)
        SET_ENTITY_COORDS(Arrow4o2, Car4Offset.x, Car4Offset.y, Car4Offset.z + 1)
        SET_ENTITY_COORDS(Arrow5o2, Car5Offset.x, Car5Offset.y, Car5Offset.z + 1)
        SET_ENTITY_COORDS(Arrow6o2, Car6Offset.x, Car6Offset.y, Car6Offset.z + 1)

        SET_ENTITY_ROTATION(Floor, 0, 0, 0 + heading)
        SET_ENTITY_ROTATION(WallA, -90, 0, 0 + heading)
        SET_ENTITY_ROTATION(WallB, 90, 0, 0 + heading)
        SET_ENTITY_ROTATION(WallC, 90, 0, 90 + heading)
        SET_ENTITY_ROTATION(WallD, -90, 0, 90 + heading)
        
        SET_ENTITY_ROTATION(Arrow1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow3, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow4, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow5, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow6, 0, 180, 0 + heading)
        
        SET_ENTITY_ROTATION(Arrow1o1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow2o1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow3o1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow4o1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow5o1, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow6o1, 0, 180, 0 + heading)
        
        SET_ENTITY_ROTATION(Arrow1o2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow2o2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow3o2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow4o2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow5o2, 0, 180, 0 + heading)
        SET_ENTITY_ROTATION(Arrow6o2, 0, 180, 0 + heading)

        --FREEZE_ENTITY_POSITION(Car1, true)
        --FREEZE_ENTITY_POSITION(Car2, true)
        --FREEZE_ENTITY_POSITION(Car3, true)
        --FREEZE_ENTITY_POSITION(Car4, true)
        
    FREEZE_ENTITY_POSITION(pedm, false)
        
        FREEZE_ENTITY_POSITION(Arrow1, true)
        FREEZE_ENTITY_POSITION(Arrow2, true)
        FREEZE_ENTITY_POSITION(Arrow3, true)
        FREEZE_ENTITY_POSITION(Arrow4, true)
        FREEZE_ENTITY_POSITION(Arrow5, true)
        FREEZE_ENTITY_POSITION(Arrow6, true)
        
        FREEZE_ENTITY_POSITION(Arrow1o1, true)
        FREEZE_ENTITY_POSITION(Arrow2o1, true)
        FREEZE_ENTITY_POSITION(Arrow3o1, true)
        FREEZE_ENTITY_POSITION(Arrow4o1, true)
        FREEZE_ENTITY_POSITION(Arrow5o1, true)
        FREEZE_ENTITY_POSITION(Arrow6o1, true)
        
        FREEZE_ENTITY_POSITION(Arrow1o2, true)
        FREEZE_ENTITY_POSITION(Arrow2o2, true)
        FREEZE_ENTITY_POSITION(Arrow3o2, true)
        FREEZE_ENTITY_POSITION(Arrow4o2, true)
        FREEZE_ENTITY_POSITION(Arrow5o2, true)
        FREEZE_ENTITY_POSITION(Arrow6o2, true)
        
        FREEZE_ENTITY_POSITION(BadSong, true)
        FREEZE_ENTITY_POSITION(GoodSong, true)
        
        SET_ENTITY_COLLISION(BadSong, false)
        SET_ENTITY_COLLISION(GoodSong, false)

        SET_ENTITY_VISIBLE(BadSong, false)
        SET_ENTITY_VISIBLE(GoodSong, false)

        --SET_ENTITY_COORDS_NO_OFFSET(pedm, WallAVictimOffset.x, WallAVictimOffset.y, WallAVictimOffset.z, true, false, false)

        local ChooseYourFateCarTable = {}
        
        local function shuffleCars1()

            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car1)

            util.toast("1")
        
        end
        
        local function shuffleCars2()
        
            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car2)

            util.toast("2")
        
        end
        
        local function shuffleCars3()
        
            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car3)

            util.toast("3")
        
        end
        
        local function shuffleCars4()
        
            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car4)

            util.toast("4")
        
        end

        local function shuffleCars5()
        
            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car5)

            util.toast("5")
        
        end

        local function shuffleCars6()
        
            util.yield(math.random(100, 500))
            
            table.insert(ChooseYourFateCarTable, 1, Car6)

            util.toast("6")
        
        end
        
    util.create_tick_handler(function()
        shuffleCars1()
        return false
    end)
    util.create_tick_handler(function()
        shuffleCars2()
        return false
    end)
    util.create_tick_handler(function()
        shuffleCars3()
        return false
    end)
    util.create_tick_handler(function()
        shuffleCars4()
        return false
    end)
    util.create_tick_handler(function()
        shuffleCars5()
        return false
    end)
    util.create_tick_handler(function()
        shuffleCars6()
        return false
    end)
        --util.toast("went through")

        util.yield(600)

        --[[local function ShuffleInPlace(t)
            for i = #t, 2, -1 do
                local j = math.random(i)
                t[i], t[j] = t[j], t[i]
            end
        end--]]

        --ShuffleInPlace(ChooseYourFateCarTable)


        --util.toast(ChooseYourFateCarTable[1])
        --util.toast(ChooseYourFateCarTable[2])
        --util.toast(ChooseYourFateCarTable[3])
        --util.toast(ChooseYourFateCarTable[4])


util.create_tick_handler(function()

    --Correct Choice
    if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[1], false) then

        SET_VEHICLE_MOD(GoodSong, 14, 4, false)
        --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
        START_VEHICLE_HORN(GoodSong, 10000, 2207581387, false)
        util.yield(2000)
        
        RaijuReward = entities.create_vehicle(RewardHash, RewardSpawnOffset, 180 + heading)
        util.request_model(RewardHash)

        --entities.delete(Floor)
            entities.delete_by_handle(WallA)
        util.yield(100)
        entities.delete_by_handle(WallB)
        util.yield(100)
        entities.delete_by_handle(WallC)
        util.yield(100)
        entities.delete_by_handle(WallD)
        util.yield(100)
        
        entities.delete_by_handle(Car1)
        util.yield(100)
        entities.delete_by_handle(Car2)
        util.yield(100)
        entities.delete_by_handle(Car3)
        util.yield(100)
        entities.delete_by_handle(Car4)
        util.yield(100)
        entities.delete_by_handle(Car5)
        util.yield(100)
        entities.delete_by_handle(Car6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1)
        util.yield(100)
        entities.delete_by_handle(Arrow2)
        util.yield(100)
        entities.delete_by_handle(Arrow3)
        util.yield(100)
        entities.delete_by_handle(Arrow4)
        util.yield(100)
        entities.delete_by_handle(Arrow5)
        util.yield(100)
        entities.delete_by_handle(Arrow6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o1)
        util.yield(100)
        entities.delete_by_handle(Arrow2o1)
        util.yield(100)
        entities.delete_by_handle(Arrow3o1)
        util.yield(100)
        entities.delete_by_handle(Arrow4o1)
        util.yield(100)
        entities.delete_by_handle(Arrow5o1)
        util.yield(100)
        entities.delete_by_handle(Arrow6o1)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o2)
        util.yield(100)
        entities.delete_by_handle(Arrow2o2)
        util.yield(100)
        entities.delete_by_handle(Arrow3o2)
        util.yield(100)
        entities.delete_by_handle(Arrow4o2)
        util.yield(100)
        entities.delete_by_handle(Arrow5o2)
        util.yield(100)
        entities.delete_by_handle(Arrow6o2)
        util.yield(100)
        entities.delete_by_handle(GoodSong)
        util.yield(100)
        entities.delete_by_handle(BadSong)
        util.yield(100)

        spawnArena = 0
       -- if VictimSpawnOffset:distance(pedm) > 100.0 then
        util.yield(60000)    
        entities.delete_by_handle(Floor)
            return false
       -- end
    end

--Wrong choice 1
if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[2], false) then
    SET_VEHICLE_MOD(BadSong, 14, 8, false)
    --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
    START_VEHICLE_HORN(BadSong, 10000, 2207581387, false)
    util.yield(2000)
    APPLY_DAMAGE_TO_PED(pedm, 100000, true, 0)
    local getcurrentPosPlayer = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
    ADD_EXPLOSION(getcurrentPosPlayer.x, getcurrentPosPlayer.y, getcurrentPosPlayer.z, 59, 1, true, false, 1.0, false)

        entities.delete(Floor)
        util.yield(100)
        entities.delete_by_handle(WallA)
        util.yield(100)
        entities.delete_by_handle(WallB)
        util.yield(100)
        entities.delete_by_handle(WallC)
        util.yield(100)
        entities.delete_by_handle(WallD)
        util.yield(100)
        
        entities.delete_by_handle(Car1)
        util.yield(100)
        entities.delete_by_handle(Car2)
        util.yield(100)
        entities.delete_by_handle(Car3)
        util.yield(100)
        entities.delete_by_handle(Car4)
        util.yield(100)
        entities.delete_by_handle(Car5)
        util.yield(100)
        entities.delete_by_handle(Car6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1)
        util.yield(100)
        entities.delete_by_handle(Arrow2)
        util.yield(100)
        entities.delete_by_handle(Arrow3)
        util.yield(100)
        entities.delete_by_handle(Arrow4)
        util.yield(100)
        entities.delete_by_handle(Arrow5)
        util.yield(100)
        entities.delete_by_handle(Arrow6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o1)
        util.yield(100)
        entities.delete_by_handle(Arrow2o1)
        util.yield(100)
        entities.delete_by_handle(Arrow3o1)
        util.yield(100)
        entities.delete_by_handle(Arrow4o1)
        util.yield(100)
        entities.delete_by_handle(Arrow5o1)
        util.yield(100)
        entities.delete_by_handle(Arrow6o1)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o2)
        util.yield(100)
        entities.delete_by_handle(Arrow2o2)
        util.yield(100)
        entities.delete_by_handle(Arrow3o2)
        util.yield(100)
        entities.delete_by_handle(Arrow4o2)
        util.yield(100)
        entities.delete_by_handle(Arrow5o2)
        util.yield(100)
        entities.delete_by_handle(Arrow6o2)
        util.yield(100)
        entities.delete_by_handle(GoodSong)
        util.yield(100)
        entities.delete_by_handle(BadSong)
        util.yield(100)

    spawnArena = 0
    return false
end

--Wrong choice 3
if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[3], false) then
    SET_VEHICLE_MOD(BadSong, 14, 8, false)
    --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
    START_VEHICLE_HORN(BadSong, 10000, 2207581387, false)
    util.yield(2000)
    APPLY_DAMAGE_TO_PED(pedm, 100000, true, 0)
    local getcurrentPosPlayer = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
    ADD_EXPLOSION(getcurrentPosPlayer.x, getcurrentPosPlayer.y, getcurrentPosPlayer.z, 59, 1, true, false, 1.0, false)

    entities.delete(Floor)
        util.yield(100)
        entities.delete_by_handle(WallA)
        util.yield(100)
        entities.delete_by_handle(WallB)
        util.yield(100)
        entities.delete_by_handle(WallC)
        util.yield(100)
        entities.delete_by_handle(WallD)
        util.yield(100)
        
        entities.delete_by_handle(Car1)
        util.yield(100)
        entities.delete_by_handle(Car2)
        util.yield(100)
        entities.delete_by_handle(Car3)
        util.yield(100)
        entities.delete_by_handle(Car4)
        util.yield(100)
        entities.delete_by_handle(Car5)
        util.yield(100)
        entities.delete_by_handle(Car6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1)
        util.yield(100)
        entities.delete_by_handle(Arrow2)
        util.yield(100)
        entities.delete_by_handle(Arrow3)
        util.yield(100)
        entities.delete_by_handle(Arrow4)
        util.yield(100)
        entities.delete_by_handle(Arrow5)
        util.yield(100)
        entities.delete_by_handle(Arrow6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o1)
        util.yield(100)
        entities.delete_by_handle(Arrow2o1)
        util.yield(100)
        entities.delete_by_handle(Arrow3o1)
        util.yield(100)
        entities.delete_by_handle(Arrow4o1)
        util.yield(100)
        entities.delete_by_handle(Arrow5o1)
        util.yield(100)
        entities.delete_by_handle(Arrow6o1)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o2)
        util.yield(100)
        entities.delete_by_handle(Arrow2o2)
        util.yield(100)
        entities.delete_by_handle(Arrow3o2)
        util.yield(100)
        entities.delete_by_handle(Arrow4o2)
        util.yield(100)
        entities.delete_by_handle(Arrow5o2)
        util.yield(100)
        entities.delete_by_handle(Arrow6o2)
        util.yield(100)
        entities.delete_by_handle(GoodSong)
        util.yield(100)
        entities.delete_by_handle(BadSong)
        util.yield(100)

    spawnArena = 0
    return false
end

--Wrong choice 4
if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[4], false) then
    SET_VEHICLE_MOD(BadSong, 14, 8, false)
    --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
    START_VEHICLE_HORN(BadSong, 10000, 2207581387, false)
    util.yield(2000)
    APPLY_DAMAGE_TO_PED(pedm, 100000, true, 0)
    local getcurrentPosPlayer = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
    ADD_EXPLOSION(getcurrentPosPlayer.x, getcurrentPosPlayer.y, getcurrentPosPlayer.z, 59, 1, true, false, 1.0, false)

    entities.delete(Floor)
        util.yield(100)
        entities.delete_by_handle(WallA)
        util.yield(100)
        entities.delete_by_handle(WallB)
        util.yield(100)
        entities.delete_by_handle(WallC)
        util.yield(100)
        entities.delete_by_handle(WallD)
        util.yield(100)
        
        entities.delete_by_handle(Car1)
        util.yield(100)
        entities.delete_by_handle(Car2)
        util.yield(100)
        entities.delete_by_handle(Car3)
        util.yield(100)
        entities.delete_by_handle(Car4)
        util.yield(100)
        entities.delete_by_handle(Car5)
        util.yield(100)
        entities.delete_by_handle(Car6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1)
        util.yield(100)
        entities.delete_by_handle(Arrow2)
        util.yield(100)
        entities.delete_by_handle(Arrow3)
        util.yield(100)
        entities.delete_by_handle(Arrow4)
        util.yield(100)
        entities.delete_by_handle(Arrow5)
        util.yield(100)
        entities.delete_by_handle(Arrow6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o1)
        util.yield(100)
        entities.delete_by_handle(Arrow2o1)
        util.yield(100)
        entities.delete_by_handle(Arrow3o1)
        util.yield(100)
        entities.delete_by_handle(Arrow4o1)
        util.yield(100)
        entities.delete_by_handle(Arrow5o1)
        util.yield(100)
        entities.delete_by_handle(Arrow6o1)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o2)
        util.yield(100)
        entities.delete_by_handle(Arrow2o2)
        util.yield(100)
        entities.delete_by_handle(Arrow3o2)
        util.yield(100)
        entities.delete_by_handle(Arrow4o2)
        util.yield(100)
        entities.delete_by_handle(Arrow5o2)
        util.yield(100)
        entities.delete_by_handle(Arrow6o2)
        util.yield(100)
        entities.delete_by_handle(GoodSong)
        util.yield(100)
        entities.delete_by_handle(BadSong)
        util.yield(100)

    spawnArena = 0
    return false
end
--bad choice 4
if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[5], false) then

    SET_VEHICLE_MOD(BadSong, 14, 8, false)
        --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
        START_VEHICLE_HORN(BadSong, 10000, 2207581387, false)
        util.yield(2000)
    APPLY_DAMAGE_TO_PED(pedm, 100000, true, 0)
    local getcurrentPosPlayer = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
    ADD_EXPLOSION(getcurrentPosPlayer.x, getcurrentPosPlayer.y, getcurrentPosPlayer.z, 59, 1, true, false, 1.0, false)

    entities.delete(Floor)
        util.yield(100)
        entities.delete_by_handle(WallA)
        util.yield(100)
        entities.delete_by_handle(WallB)
        util.yield(100)
        entities.delete_by_handle(WallC)
        util.yield(100)
        entities.delete_by_handle(WallD)
        util.yield(100)
        
        entities.delete_by_handle(Car1)
        util.yield(100)
        entities.delete_by_handle(Car2)
        util.yield(100)
        entities.delete_by_handle(Car3)
        util.yield(100)
        entities.delete_by_handle(Car4)
        util.yield(100)
        entities.delete_by_handle(Car5)
        util.yield(100)
        entities.delete_by_handle(Car6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1)
        util.yield(100)
        entities.delete_by_handle(Arrow2)
        util.yield(100)
        entities.delete_by_handle(Arrow3)
        util.yield(100)
        entities.delete_by_handle(Arrow4)
        util.yield(100)
        entities.delete_by_handle(Arrow5)
        util.yield(100)
        entities.delete_by_handle(Arrow6)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o1)
        util.yield(100)
        entities.delete_by_handle(Arrow2o1)
        util.yield(100)
        entities.delete_by_handle(Arrow3o1)
        util.yield(100)
        entities.delete_by_handle(Arrow4o1)
        util.yield(100)
        entities.delete_by_handle(Arrow5o1)
        util.yield(100)
        entities.delete_by_handle(Arrow6o1)
        util.yield(100)
        
        entities.delete_by_handle(Arrow1o2)
        util.yield(100)
        entities.delete_by_handle(Arrow2o2)
        util.yield(100)
        entities.delete_by_handle(Arrow3o2)
        util.yield(100)
        entities.delete_by_handle(Arrow4o2)
        util.yield(100)
        entities.delete_by_handle(Arrow5o2)
        util.yield(100)
        entities.delete_by_handle(Arrow6o2)
        util.yield(100)
        entities.delete_by_handle(GoodSong)
        util.yield(100)
        entities.delete_by_handle(BadSong)
        util.yield(100)

    spawnArena = 0
    return false
end

--correct choice 2
if IS_PED_IN_ANY_VEHICLE(pedm, true) and IS_PED_IN_MODEL(pedm, CarHash) and IS_PED_IN_VEHICLE(pedm, ChooseYourFateCarTable[6], false) then

    SET_VEHICLE_MOD(GoodSong, 14, 4, false)
    --OVERRIDE_VEH_HORN(GoodSong, true, hornhash)
    START_VEHICLE_HORN(GoodSong, 10000, 2207581387, false)
    util.yield(2000)
    RaijuReward = entities.create_vehicle(RewardHash, RewardSpawnOffset, 180 + heading)
    util.request_model(RewardHash)

    --entities.delete(Floor)
        entities.delete_by_handle(WallA)
    util.yield(100)
    entities.delete_by_handle(WallB)
    util.yield(100)
    entities.delete_by_handle(WallC)
    util.yield(100)
    entities.delete_by_handle(WallD)
    util.yield(100)
    
    entities.delete_by_handle(Car1)
    util.yield(100)
    entities.delete_by_handle(Car2)
    util.yield(100)
    entities.delete_by_handle(Car3)
    util.yield(100)
    entities.delete_by_handle(Car4)
    util.yield(100)
    entities.delete_by_handle(Car5)
    util.yield(100)
    entities.delete_by_handle(Car6)
    util.yield(100)
    
    entities.delete_by_handle(Arrow1)
    util.yield(100)
    entities.delete_by_handle(Arrow2)
    util.yield(100)
    entities.delete_by_handle(Arrow3)
    util.yield(100)
    entities.delete_by_handle(Arrow4)
    util.yield(100)
    entities.delete_by_handle(Arrow5)
    util.yield(100)
    entities.delete_by_handle(Arrow6)
    util.yield(100)
    
    entities.delete_by_handle(Arrow1o1)
    util.yield(100)
    entities.delete_by_handle(Arrow2o1)
    util.yield(100)
    entities.delete_by_handle(Arrow3o1)
    util.yield(100)
    entities.delete_by_handle(Arrow4o1)
    util.yield(100)
    entities.delete_by_handle(Arrow5o1)
    util.yield(100)
    entities.delete_by_handle(Arrow6o1)
    util.yield(100)
    
    entities.delete_by_handle(Arrow1o2)
    util.yield(100)
    entities.delete_by_handle(Arrow2o2)
    util.yield(100)
    entities.delete_by_handle(Arrow3o2)
    util.yield(100)
    entities.delete_by_handle(Arrow4o2)
    util.yield(100)
    entities.delete_by_handle(Arrow5o2)
    util.yield(100)
    entities.delete_by_handle(Arrow6o2)
    util.yield(100)
    entities.delete_by_handle(GoodSong)
    util.yield(100)
    entities.delete_by_handle(BadSong)
    util.yield(100)

    spawnArena = 0
   -- if VictimSpawnOffset:distance(pedm) > 100.0 then
    util.yield(60000)    
    entities.delete_by_handle(Floor)
        return false
   -- end
end


end)

        


    --util.yield(60000)

        

    end
        
    end)








    
--[[    local spawnElements = 0
menu.toggle_loop(menu.player_root(pid)--[[myListFunMinigamesSettings]]--, "Wreck It", {}, "You must spawn the arena first ! LolaScript>Fun>Minigames>Wreck it", function()

--[[    local pName = GET_PLAYER_NAME(pid)
    if spawnElements == 0 then
        spawnElements = 1

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local carHash = util.joaat("monster3")

        local randomSpawnLocations = {
            v3.new(0, 0, 1000)
        }

        local randomGiftsSpawnLocations = {
            v3.new(50, 0, 970),
            v3.new(-50, 0, 970),
            v3.new(0, 50, 970),
            v3.new(0, -50, 970),
        }

        local randomSpawnHeadings = {
            0,
        }

        util.request_model(carHash)
        local pCar = entities.create_vehicle(carHash, randomSpawnLocations[1], randomSpawnHeadings[1])
        table.insert(playerWreckItElements, 1, pCar)
        SET_ENTITY_AS_MISSION_ENTITY(pCar, true, true)

        SET_PED_INTO_VEHICLE(pedm, pCar, -1)

        for i = 1, #randomGiftsSpawnLocations, 1 do
            WIgiftSpawner(pedm, randomGiftsSpawnLocations[i], pCar, pName)
        end

        local wreckItRocketPUHash = util.joaat("prop_mp_rocket_01")
        local wreckItRailgunPUHash = util.joaat("prop_mp_spike_01")
        local wreckItBoostPUHash = util.joaat("prop_mp_boost_01")
        local wreckItJumpPUHash = util.joaat("prop_mk_arrow_3d")

        local SpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pCar, 0, 0, 10)

        util.request_model(wreckItRocketPUHash)
        local RocketPU = entities.create_object(wreckItRocketPUHash, SpawnLoc, 0)
        table.insert(playerWreckItElements, 1, RocketPU)
        SET_ENTITY_AS_MISSION_ENTITY(RocketPU, true, true)
        SET_ENTITY_COLLISION(RocketPU, false, false)

        util.request_model(wreckItRailgunPUHash)
        local RailGunPU = entities.create_object(wreckItRailgunPUHash, SpawnLoc, 0)
        table.insert(playerWreckItElements, 1, RailGunPU)
        SET_ENTITY_AS_MISSION_ENTITY(RailGunPU, true, true)
        SET_ENTITY_COLLISION(RailGunPU, false, false)

        util.request_model(wreckItBoostPUHash)
        local BoostPU = entities.create_object(wreckItBoostPUHash, SpawnLoc, 0)
        table.insert(playerWreckItElements, 1, BoostPU)
        SET_ENTITY_AS_MISSION_ENTITY(BoostPU, true, true)
        SET_ENTITY_COLLISION(BoostPU, false, false)

        util.request_model(wreckItJumpPUHash)
        local JumpPU = entities.create_object(wreckItJumpPUHash, SpawnLoc, 0)
        table.insert(playerWreckItElements, 1, JumpPU)
        SET_ENTITY_AS_MISSION_ENTITY(JumpPU, true, true)
        SET_ENTITY_COLLISION(JumpPU, false, false)
        
        local PUiconeHeight = 3
        
        ATTACH_ENTITY_TO_ENTITY(RocketPU, pCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(RailGunPU, pCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(BoostPU, pCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)
        ATTACH_ENTITY_TO_ENTITY(JumpPU, pCar, 0, 0, 0, PUiconeHeight, 0, 0, 0, true, false, false, true, 0, true, 0)

    end

end, function()


    for i, element in playerWreckItElements do
        entities.delete(element)
    end
    playerWreckItElements = {}

    spawnElements = 0

end)


function WIgiftSpawner(Player, Location, car, name)

    local currentWIpu = 0

    local hash = util.joaat("xm_prop_moderncrate_xplv_01")
    util.request_model(hash)

    local gift = entities.create_object(hash, Location, 0)
    table.insert(playerWreckItElements, 1, gift)
    SET_ENTITY_AS_MISSION_ENTITY(gift, true, true)
    SET_ENTITY_COLLISION(gift, false, false)

    util.create_tick_handler(function()
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local carVelocityRaw = GET_ENTITY_VELOCITY(car)
        local carVelocityY = math.abs(carVelocityRaw.y)
        local carVelocityX = math.abs(carVelocityRaw.x)
        local SpeedDistanceMultiplier = 0.2
        local PayerLocation = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(car, 0, 0, 0) 
    
        local PlayerOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Player, 0, 0, 0)
        local GiftOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(gift, 0, 0, 0)

        if PayerLocation:distance(GiftOffset) < 3 then
            util.toast(name .. " has collected a gift !")
            SET_ENTITY_VISIBLE(gift, false, false)
            currentWIpu = 1 --math.random(1, 4)
            util.yield(2000)
            SET_ENTITY_VISIBLE(gift, true, true)
        end

        if currentWIpu == 1 then
            --SET_ENTITY_VISIBLE(RocketPU, true, true)
                local WeaponPlacementOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(car, 0, 3 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX, 0.5)
                local WeaponAimOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(car, 0, 3000, 0)
                local MissleSpeed = 500 + SpeedDistanceMultiplier * carVelocityY + SpeedDistanceMultiplier * carVelocityX
                local MissleDamage = 15
                --util.draw_centred_text(carVelocityY)
                    util.toast(name)
                --util.draw_centred_text(carVelocityX)
                if IS_PLAYER_PRESSING_HORN(pid) then
                    util.toast("b")
                    SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(WeaponPlacementOffset.x, WeaponPlacementOffset.y, WeaponPlacementOffset.z, WeaponAimOffset.x, WeaponAimOffset.y, WeaponAimOffset.z, MissleDamage, true, 3800181289, p, true, false, MissleSpeed, wreckItCar, true)
                    --currentWIpu = 0
                end
        else
            --SET_ENTITY_VISIBLE(RocketPU, false, false)
        end

        if not DOES_ENTITY_EXIST(gift) then
            --return false
        end
    end)
    
end]]--



menu.divider(PlayerTrollingVehicleList, "------")
  

    local childlock

    childlock = menu.toggle_loop(PlayerTrollingVehicleList, "Child lock", {}, "Trap the player within its car", function()

        local car = GET_VEHICLE_PED_IS_IN(GET_PLAYER_PED_SCRIPT_INDEX(pid), true)



        if car ~= 0 then
            SET_VEHICLE_DOORS_LOCKED(car, 4)
            util.toast("Baby can't leave !")

        end

    end, function()
        local car = GET_VEHICLE_PED_IS_IN(GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
        if car ~= 0 then
            SET_VEHICLE_DOORS_LOCKED(car, 1)
            util.toast("Baby can now leave !")
        end
    end)

    PlayerTrollingVehicleList:toggle_loop('Brakes Loop', {}, 'Makes the player go crazy with brakes', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
        end
        --util.toast("Party mode ON !")





        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        if vmod ~= 0 then
            --util.toast("ON!")
            SET_VEHICLE_HANDBRAKE(vmod, true)
            util.yield(100)
            SET_VEHICLE_HANDBRAKE(vmod, false)
            util.yield(5000)
        end

    end, function()
        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        if vmod ~= 0 then
            SET_VEHICLE_HANDBRAKE(vmod, false)
        end


    end)




    menu.divider(PlayerTrollingVehicleList, "------")


    menu.action(PlayerTrollingVehicleList, "Detach wheels !", {}, "Detaches the wheels from the player's vehicle", function()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            entities.detach_wheel( vmod, 0)
            entities.detach_wheel( vmod, 1)
            entities.detach_wheel( vmod, 2)
            entities.detach_wheel( vmod, 3)
            entities.detach_wheel( vmod, 4)
            entities.detach_wheel( vmod, 5)
        end

    end)








    menu.action(PlayerTrollingVehicleList, 'Burst tyres', {''}, 'Button that burst wheels tyres', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)
            if DOES_ENTITY_EXIST(vmod) and Get_Entity(vmod) then --get control
                SET_VEHICLE_TYRES_CAN_BURST(vmod, true)
                for wheelId = 0, 7 do SET_VEHICLE_TYRE_BURST(vmod, wheelId, true, 1000.0) end
            end
        end
    end)

    menu.action(PlayerTrollingPedList, "Crush Player !", {}, "Spawns an Truck to crush the player", function()
        local  pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 10)
        local hash = util.joaat("dump")
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local Crusher = entities.create_vehicle(hash, Offset, 0)
        --SET_ENTITY_HEADING(Asteroid, heading)
        --SET_ENTITY_VELOCITY(Asteroid, 0, 0, -3000)


        util.toast("Crusher Spawned !")

        util.yield(3000)
        entities.delete_by_handle(Crusher)


    end)


     --menu.divider(PlayerTrollingList, "------")

    --local friend_menu =  root:list('Friendly', {}, 'Friendly options')
    -- local paint = {primary = 92, secondary = 145} --here we set a table for the paint primary and secondary

    -- PlayerTrollingList:action('Change the vehicle color', {}, 'Change the vehicle color to one you have chosen', function ()
    --     local  pname = GET_PLAYER_NAME(pid)
    --to do it better it would be good to specatate them first as things tend to work better that way
    --      --menu.trigger_commands('spectate'..pname)
    --      --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
    --      local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
    --      if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
    --          local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
    --          Get_Entity(vmod) --get control
    --          SET_VEHICLE_COLOURS(vmod, paint.primary, paint.secondary)
    --       end
    --   end)


    --  PlayerTrollingList:slider('Change Primary Color', {}, 'Change Primary Color Used', 0, 160, 92, 1, function (s)
    --      paint.primary = s
    --  end)
    --
    -- PlayerTrollingList:slider('Change Secondary Color', {}, 'Change Secondary Color Used', 0, 160, 145, 1, function (s)
    --     paint.secondary = s
    --end)

    menu.divider(PlayerFunnyList, "------")

    --Spawn Ramp
    menu.action(PlayerFunnyList, "Spawn ramp in front of player", {}, "Spawns a ramp in front of the player (Works best with small vehicles)", function()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,20, -1)
        local hash = 2108723836
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        local Ramp = entities.create_object(hash, Offset)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
        --SET_ENTITY_HEADING(Ramp, heading + 90)
        SET_ENTITY_ROTATION(Ramp, rot.y, -rot.x, heading + 90)
        util.toast("Ready for take off !")

        util.yield(2000)
        entities.delete_by_handle(Ramp)


    end)

    menu.action(PlayerFunnyList, "Spawn Loop", {}, "This will spawn a Loop in front of you (Works best with small vehicles)", function()


        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 50, -1)
        local BoosterOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,80, 30)
        local BoosterOffset1 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,25, 0)
        local BoosterOffset2 = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,90, 50)
        local hash = 4119906142
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        local boosterhash = 4228722453
        util.request_model(boosterhash)
        local Booster = entities.create_object(boosterhash, BoosterOffset)
        local Booster1 = entities.create_object(boosterhash, BoosterOffset1)
        local Booster2 = entities.create_object(boosterhash, BoosterOffset2)
        local Loop = entities.create_object(hash, Offset)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
        --SET_ENTITY_HEADING(Loop, heading + 90)
        SET_ENTITY_ROTATION(Loop, rot.y, -rot.x, heading + 90)
        SET_ENTITY_ROTATION(Booster, rot.y, -rot.x, heading + 90)
        SET_ENTITY_ROTATION(Booster1, rot.y, -rot.x, heading + 90)
        SET_ENTITY_ROTATION(Booster2, rot.y, -rot.x, heading + 90)
        util.toast("Gotta Go Fast !")

        util.yield(10000)
        entities.delete_by_handle(Loop)
        entities.delete_by_handle(Booster)
        entities.delete_by_handle(Booster1)
        entities.delete_by_handle(Booster2)
        --util.toast(CurrentVehicle)
        --util.toast("rot x :" .. rot.x)
        --util.toast("rot y :" .. rot.y)
        --util.toast("rot z :" .. rot.z)

    end)

    menu.action(PlayerFunnyList, "Spawn Boosters", {}, "This will spawn a ring of Booster, should work on absolutely any vehicle", function()

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 10, 0)

        local hash = 993442923
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)

        local Booster = entities.create_object(hash, Offset)
        SET_ENTITY_ROTATION(Booster, rot.y, -rot.x, heading + 0)

        util.yield(1000)
        entities.delete_by_handle(Booster)

    end)

    menu.action(PlayerFunnyList, "Spawn Slowers", {}, "This will spawn a row of Slowers", function()

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 5, -2)

        local hash = 1431235846
        util.request_model(hash)
        local heading = GET_ENTITY_HEADING(pedm)
        local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
        local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)

        local Slower = entities.create_object(hash, Offset)
        SET_ENTITY_ROTATION(Slower, rot.y, -rot.x, heading + 0)

        util.yield(1000)
        entities.delete_by_handle(Slower)

    end)

    menu.toggle_loop(PlayerFunnyList, "Hamsterball", {}, "Spawns a Hamsterball (Make sure only ONE hamsterball is loaded in the world to avoid bugs)", function(on)
        local hashLoop = 1768956181 --2138347493 --util.joaat("Snowball") 1768956181 -1125864094-

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local owner = players.user_ped()
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, -1)

        if not DOES_ENTITY_EXIST(OBJ) then
            ---------------------------------------------------------------------------------------------
            OBJ = entities.create_object(hashLoop, Offset)
            OBJ1 = entities.create_object(hashLoop, Offset)
            OBJ2 = entities.create_object(hashLoop, Offset)
            OBJ3 = entities.create_object(hashLoop, Offset)
            OBJ4 = entities.create_object(hashLoop, Offset)
            OBJ5 = entities.create_object(hashLoop, Offset)
            OBJ6 = entities.create_object(hashLoop, Offset)
            OBJ7 = entities.create_object(hashLoop, Offset)
            OBJ8 = entities.create_object(hashLoop, Offset)
            OBJ9 = entities.create_object(hashLoop, Offset)
            OBJ10 = entities.create_object(hashLoop, Offset)
            OBJ11 = entities.create_object(hashLoop, Offset)
            OBJ12 = entities.create_object(hashLoop, Offset)
            OBJ13 = entities.create_object(hashLoop, Offset)
            OBJ14 = entities.create_object(hashLoop, Offset)
            OBJ15 = entities.create_object(hashLoop, Offset)
            OBJ16 = entities.create_object(hashLoop, Offset)
            OBJ17 = entities.create_object(hashLoop, Offset)
            ---------------------------------------------------------------------------------------------
            ---------------------------------------------------------------------------------------------
            SET_ENTITY_ROTATION(OBJ, 0, 0, 0)
            SET_ENTITY_ROTATION(OBJ1, 0, 0, 10)
            SET_ENTITY_ROTATION(OBJ2, 0, 0, 20)
            SET_ENTITY_ROTATION(OBJ3, 0, 0, 30)
            SET_ENTITY_ROTATION(OBJ4, 0, 0, 40)
            SET_ENTITY_ROTATION(OBJ5, 0, 0, 50)
            SET_ENTITY_ROTATION(OBJ6, 0, 0, 60)
            SET_ENTITY_ROTATION(OBJ7, 0, 0, 70)
            SET_ENTITY_ROTATION(OBJ8, 0, 0, 80)
            SET_ENTITY_ROTATION(OBJ9, 0, 0, 90)
            SET_ENTITY_ROTATION(OBJ10, 0, 0, 100)
            SET_ENTITY_ROTATION(OBJ11, 0, 0, 110)
            SET_ENTITY_ROTATION(OBJ12, 0, 0, 120)
            SET_ENTITY_ROTATION(OBJ13, 0, 0, 130)
            SET_ENTITY_ROTATION(OBJ14, 0, 0, 140)
            SET_ENTITY_ROTATION(OBJ15, 0, 0, 150)
            SET_ENTITY_ROTATION(OBJ16, 0, 0, 160)
            SET_ENTITY_ROTATION(OBJ17, 0, 0, 170)
            ---------------------------------------------------------------------------------------------

        end

        --util.toast("loop")


    end, function()
        entities.delete(OBJ)
        entities.delete(OBJ1)
        entities.delete(OBJ2)
        entities.delete(OBJ3)
        entities.delete(OBJ4)
        entities.delete(OBJ5)
        entities.delete(OBJ6)
        entities.delete(OBJ7)
        entities.delete(OBJ8)
        entities.delete(OBJ9)
        entities.delete(OBJ10)
        entities.delete(OBJ11)
        entities.delete(OBJ12)
        entities.delete(OBJ13)
        entities.delete(OBJ14)
        entities.delete(OBJ15)
        entities.delete(OBJ16)
        entities.delete(OBJ17)
    end)

    menu.toggle_loop(PlayerFunnyList, "Giant Hamsterball", {}, "Spawns a Giant Hamsterball (Make sure only ONE Giant hamsterball is loaded in the world to avoid bugs)", function(on)
        local hashLoop = 430430733 --2138347493 --util.joaat("Snowball") 1768956181 -1125864094- 234083239 430430733
 
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local owner = players.user_ped()
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(owner, 0, 0, 37)
        GHexist = 0
 
        if not DOES_ENTITY_EXIST(gOBJ) and GHexist == 0 then
            ---------------------------------------------------------------------------------------------
            GHexist = 1
            gOBJ = entities.create_object(hashLoop, Offset)
            gOBJ1 = entities.create_object(hashLoop, Offset)
            gOBJ2 = entities.create_object(hashLoop, Offset)
            gOBJ3 = entities.create_object(hashLoop, Offset)
            gOBJ4 = entities.create_object(hashLoop, Offset)
            gOBJ5 = entities.create_object(hashLoop, Offset)
            gOBJ6 = entities.create_object(hashLoop, Offset)
            gOBJ7 = entities.create_object(hashLoop, Offset)
            gOBJ8 = entities.create_object(hashLoop, Offset)
            gOBJ9 = entities.create_object(hashLoop, Offset)
            gOBJ10 = entities.create_object(hashLoop, Offset)
            gOBJ11 = entities.create_object(hashLoop, Offset)
            gOBJ12 = entities.create_object(hashLoop, Offset)
            gOBJ13 = entities.create_object(hashLoop, Offset)
            gOBJ14 = entities.create_object(hashLoop, Offset)
            gOBJ15 = entities.create_object(hashLoop, Offset)
            gOBJ16 = entities.create_object(hashLoop, Offset)
            gOBJ17 = entities.create_object(hashLoop, Offset)
            ---------------------------------------------------------------------------------------------
            ---------------------------------------------------------------------------------------------
            SET_ENTITY_ROTATION(gOBJ, 0, 90, 0)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ1, 0, 90, 20)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ2, 0, 90, 40)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ3, 0, 90, 60)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ4, 0, 90, 80)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ5, 0, 90, 100)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ6, 0, 90, 120)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ7, 0, 90, 140)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ8, 0, 90, 160)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ9, 0, 90, 180)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ10, 0, 90, 200)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ11, 0, 90, 220)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ12, 0, 90, 240)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ13, 0, 90, 260)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ14, 0, 90, 280)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ15, 0, 90, 300)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ16, 0, 90, 320)
            util.yield(100)
            SET_ENTITY_ROTATION(gOBJ17, 0, 90, 340)
            util.yield(100)
            ---------------------------------------------------------------------------------------------
 
        end
 
        --util.toast("loop")
 
 
    end, function()
        GHexist = 0
        entities.delete(gOBJ)
        entities.delete(gOBJ1)
        entities.delete(gOBJ2)
        entities.delete(gOBJ3)
        entities.delete(gOBJ4)
        entities.delete(gOBJ5)
        entities.delete(gOBJ6)
        entities.delete(gOBJ7)
        entities.delete(gOBJ8)
        entities.delete(gOBJ9)
        entities.delete(gOBJ10)
        entities.delete(gOBJ11)
        entities.delete(gOBJ12)
        entities.delete(gOBJ13)
        entities.delete(gOBJ14)
        entities.delete(gOBJ15)
        entities.delete(gOBJ16)
        entities.delete(gOBJ17)
    end)

    menu.divider(PlayerFunnyList, "------")

    --Spawn Loop
    --[[menu.action(PlayerFunnyVehicleList, "Spawn Loop in front of player", {}, "Spawns a Loop in front of the player (Works best with small vehicles)", function()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,80, -1)
        local BoosterOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0,10, 0)
     local hash = 4119906142
     util.request_model(hash)
     local heading = GET_ENTITY_HEADING(pedm)
     local CurrentVehicle = GET_VEHICLE_PED_IS_IN(pedm)
     local Loop = entities.create_object(hash, Offset)
     local boosterhash = 4228722453
     util.request_model(boosterhash)
     local Loop = entities.create_object(boosterhash, BoosterOffset)
     local rot = GET_ENTITY_ROTATION(CurrentVehicle, 2)
     --SET_ENTITY_HEADING(Loop, heading + 90)
     SET_ENTITY_ROTATION(Loop, rot.y, -rot.x, heading + 90)
     util.toast("Gotta Go Fast !")

     util.yield(20000)
     entities.delete_by_handle(Loop)


    end)--]]

    --Lights blink


    PlayerFunnyVehicleList:slider("Light Flicker Speed", {}, "Changes the light flicker speed", 0, 10000, 500, 100, function (LightFlickerSpeedSlider)
        FLSpeed = LightFlickerSpeedSlider
    end)

    PlayerFunnyVehicleList:toggle_loop('Flicker Lights', {}, 'Flickers the lights of the players current vehicle', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            --get the vehicle they are in
            Get_Entity(vmod) --get control
        end
        --util.toast("Party mode ON !")





        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        if vmod ~= 0 then
            --util.toast("ON!")
            SET_VEHICLE_LIGHTS(vmod, 2)
            util.yield(FLSpeed)
            SET_VEHICLE_LIGHTS(vmod, 1)
            util.yield(FLSpeed)
        end

    end, function()
        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        if vmod ~= 0 then

        end


    end)








    --math.random(-radius, radius)

    --[[menu.action(PlayerFunnyList, "Giant Rabbit Riding", {}, "Spawns a pet Giant Rabbit near this player that will become it's pet, you will be riding the rabbit (must spectate or be near of it to work properly)", function ()
        
        SelectedPetAnimal = util.joaat("A_C_Rabbit_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local BikeHash = util.joaat("avarus")
        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        util.request_model(BikeHash)
        --local pedm = Target

        local radius = math.random(8, 22)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)


        radius = math.random(8, 22)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, 0)
        local Bike = entities.create_vehicle(BikeHash, SpawnOffset, 0)
        ATTACH_ENTITY_TO_ENTITY(Bike, PetAnimal, 0, 0, 0.25, 0.25, 0, 0, 0, true, false, false, false, 0, true, 0)
        SET_PED_INTO_VEHICLE(players.user_ped(), Bike, -1)
        SET_ENTITY_VISIBLE(Bike, false)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(PetAnimal)



        util.create_tick_handler(function()

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
            TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                return false
            end
        end)

        util.create_tick_handler(function()

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                entities.delete(Bike)
                util.toast("RIP " .. PetNamesList[math.random(1, #PetNamesList)] .. " :'(")
                return false
            end
        end)
        util.yield(6000)
        DETACH_ENTITY(players.user_ped(), true, true)

    end)--]]

    menu.toggle_loop(PlayerFunnyList, "Snow Rain", {}, "Rains Snowballs", function(on)
        local hashSnowball = 126349499 --2138347493 --util.joaat("Snowball")
        local radius = 4
        --local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), math.random(-radius, radius), math.random(-radius, radius), 3)


        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        --local target = GET_ENTITY_COORDS(pedm, false)
        local owner = players.user_ped()
        local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), math.random(-radius, radius))

        SHOOT_SINGLE_BULLET_BETWEEN_COORDS(Offset.x, Offset.y, Offset.z+5, Offset.x, Offset.y, Offset.z+2, 0, true, hashSnowball, owner, true, false, 1.0)


        --util.toast("loop")


    end, function()

        --util.toast("not loop")





    end)



    --CLEAR_AREA_OF_PROJECTILES(locx, locy, locz, radius, 0)
    --util.joaat("w_ex_snowball"),













    --Child Lock SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER
    -- PlayerTrollingVehicleList:toggle('Child Lock', {}, 'Trap the player within its car', function (on_changed)
    --if on_changed == true then
    --    util.toast("hey!")
    --     local  pname = GET_PLAYER_NAME(pid)
    --to do it better it would be good to specatate them first as things tend to work better that way
    --menu.trigger_commands('spectate'..pname)
    --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
    --    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
    --if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
    --        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
    --        Get_Entity(vmod) --get control
    --         SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vmod, true)

    --end
    --end

    --end)






    PlayerTrollingVehicleList:action('Remove doors', {}, 'Removes the players current vehicle doors', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_VEHICLE_DOOR_BROKEN(vmod, 0, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 1, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 2, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 3, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 4, false)
            SET_VEHICLE_DOOR_BROKEN(vmod, 5, false)
        end

    end)



    PlayerTrollingVehicleList:action('Invert Vehicle Controls', {}, 'Invert players vehicle controls (Permanent)', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
        end
        --util.toast("Party mode ON !")





        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true)
        --util.toast("ON!")
        SET_INVERT_VEHICLE_CONTROLS(vmod, true)

    end)



    menu.divider(PlayerTrollingVehicleList, "------")

    PlayerTrollingVehicleList:action('Kill Engine', {}, 'Kills the players current vehicle engine', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_VEHICLE_ENGINE_HEALTH(vmod, -1)
        end

    end)

    PlayerTrollingVehicleList:action('Kill Heli Rotor', {}, 'Kills the players current helicopter Rotor', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            SET_HELI_TAIL_ROTOR_HEALTH(vmod, 0)
        end

    end)

    menu.divider(PlayerTrollingVehicleList, "------")

    --delete vehicle

    PlayerTrollingVehicleList:action('Delete vehicle', {}, 'Deletes the players current vehicle', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            entities.delete_by_handle(vmod)
            util.toast("Vehicle deleted !")
        end

    end)

    PlayerTrollingVehicleList:toggle_loop('Delete vehicle Loop', {}, 'Deletes the players current vehicle over and over', function ()
        local  pname = GET_PLAYER_NAME(pid)
        --to do it better it would be good to specatate them first as things tend to work better that way
        --menu.trigger_commands('spectate'..pname)
        --util.yield(1500) --yield for 1500 ms or 1.5 secs to give it time to spectate
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
        if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
            local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
            Get_Entity(vmod) --get control
            entities.delete_by_handle(vmod)
            util.toast("Vehicle deleted !")
        end

    end)


    ---------------------------
    --Kitty Bomb
    ---------------------------

    --menu.action(PlayerTrollingPedList, "Teleport Test", {}, "Teleports you to 0, 100, 100", function()

    -- local offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0) -- changed the name to be offset u can still pick pos but i like offset more because it tells u what it is
    --  local heading = GET_ENTITY_HEADING(players.user_ped())
    --  local pedm = GET_NEAREST_PLAYER_TO_ENTITY(pid)

    --  local CamRot = players.get_cam_rot(players.user())

    --   local hashKitty = util.joaat("A_C_Cat_01")
    --  local hashBomb = util.joaat("speedo2")
    --
    --   local Kitty = entities.create_ped(0, hashKitty, offset, CamRot.z)
    --   local KittyTimer = 3000
    --
    --   local Kittyoffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Kitty, 0, 0, 0)
    --   local Bomb = entities.create_vehicle(hashBomb, Kittyoffset, heading)
    --  local Bomboffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Bomb, 0, 0, 0)
    --
    -- util.create_tick_handler(function(Sync_Cam_Rot)
    --     util.draw_centred_text(KittyTimer)
    --     KittyTimer = KittyTimer - 1
    --    local CamRot2 = players.get_cam_rot(players.user())
    --    SET_ENTITY_HEADING(Kitty, CamRot2.z)
    --    --util.toast("Rot z :" .. CamRot2.z)
    --    local KittyCurrVelocity = GET_ENTITY_VELOCITY(Kitty)
    --    SET_ENTITY_DYNAMIC(Kitty, false)
    --    SET_ENTITY_VELOCITY(Kitty, Kittyoffset.x, KittyCurrVelocity.y, KittyCurrVelocity.z)
    --     if KittyTimer < 0 then
    --         ADD_EXPLOSION(Bomboffset.x, Bomboffset.y, Bomboffset.z, 0, 1.0, true, true, 1.0, false)
    --         util.toast("boom!")
    --         SET_ENTITY_ALPHA(players.user_ped(), 0)
    --         entities.delete_by_handle(Kitty)
    --         util.yield(500)
    --          entities.delete_by_handle(Bomb)
    --          util.yield(4500)
    --          SET_ENTITY_VISIBLE(ourPlayer, true, true)
    --          return false
    --      end
    --  end)





    --   ATTACH_ENTITY_TO_ENTITY(Bomb, Kitty, 0, 0, 0, 0, 0, 0, 0, true, false, false, false, 0, true, 0)
    --  SET_ENTITY_INVINCIBLE(Kitty, true)
    --
    --
    --  SET_ENTITY_VISIBLE(ourPlayer, false, false)
    -- SET_PED_INTO_VEHICLE(players.user_ped(), Bomb, -1)
    -- SET_ENTITY_VISIBLE(Bomb, false, false)
    -- SET_ENTITY_ALPHA(players.user_ped(), 0)
    --
    --
    --
    --    local targetPos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
    --    --util.yield(1000
    --    if Kittyoffset:distance(targetPos) < 10.0 then
    --    ADD_EXPLOSION(Bomboffset.x, Bomboffset.y, Bomboffset.z, 0, 1.0, true, true, 1.0, false)
    --    util.toast("boom!")
    --    end

    --end)


    -- menu.toggle(PlayerFunnyVehicleList, "Toggle Zero Gravity !", {}, "Zero Gravity On/Off", function (on_change)
    --    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid) -- get the players model
    --    local current_vehicle_handle_or_ptr = entities.get_user_vehicle_as_handle(true)

    --    if IS_PED_IN_ANY_VEHICLE(pedm, true) then --checking if they are in a vehicle
    --        local vmod = GET_VEHICLE_PED_IS_IN(pedm, true) --get the vehicle they are in
    --        local address = entities.handle_to_pointer(vmod)
    --        Get_Entity(vmod) --get control
    --        if on_change == true then
    --            entities.set_gravity(address, 0)
    --        else
    --            entities.set_gravity(address, 9.8)
    --        end
    --    end


    --end)



    --menu.action(PlayerTrollingPedList, "Kitty Boom", {}, "Spawns a Kitty that will explode if shot", function(on)

    --   local radius = 4
    --   local hash = util.joaat("a_f_m_beach_01")
    --  util.request_model(hash)
    -- local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
    ----   local RandomOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
    --   local Offset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 10, 0)

    --  local Kitty = SET_ENTITY_INVINCIBLE(entities.create_ped(0, hash, RandomOffset, 0), true)




    -- local PedGoToTimer = 1000

    -- util.create_tick_handler(function(PedGoTo)

    --     PedGoToTimer = PedGoToTimer - 1
    --     util.draw_centred_text(PedGoToTimer)

    --    SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Kitty, true)
    --    TASK_GO_TO_COORD_ANY_MEANS(Kitty, Offset.x,Offset.y+5, Offset.z, 5.0, 0, false, 0, 0.0)
    --TASK_GO_TO_ENTITY(Kitty, Kitty1, 5000, 4.0, 100, 1073741824, 0)
    --    SET_PED_KEEP_TASK(Kitty, true)

    --    entities.set_can_migrate(Kitty, false)
    --    SET_PED_COMPONENT_VARIATION(Kitty, 0, 0, 1, 0)
    --     SET_ENTITY_INVINCIBLE(Kitty, true)

    --     NETWORK_REQUEST_CONTROL_OF_ENTITY(Kitty)
    --     TASK_FOLLOW_TO_OFFSET_OF_ENTITY(pedm, 0, -0.3, 0, 7.0, -1, 1.5, true)
    --     if PedGoToTimer < 0 then


    --          return false
    --      end
    -- end)







    --end)

    menu.action(PlayerTrollingPedList, "Stalking Kitty Boom", {}, "Spawns a kitty that will stalk the player and explode if killed", function(on)

        local Kitty = util.joaat("A_C_Cat_01")
        util.request_model(Kitty)
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local radius = 5
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local Kitty_pet = entities.create_ped(28, Kitty, SpawnOffset, 0)
        entities.set_can_migrate(Kitty_pet, false)
        SET_PED_COMPONENT_VARIATION(Kitty_pet, 0, 0, 1, 0)
        --SET_ENTITY_INVINCIBLE(Kitty_pet, true)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(Kitty_pet)

        util.create_tick_handler(function()

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Kitty_pet, true)
            TASK_GO_TO_COORD_ANY_MEANS(Kitty_pet, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Kitty_pet, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(Kitty_pet) then
                entities.delete(Kitty_pet)
                ADD_EXPLOSION(KittyOffset.x, KittyOffset.y, KittyOffset.z, 0, 1.0, true, false, 1.0, false)
                return false
            end
        end)

    end)


    local ZombieCount = {}

    function SpawnZombie(pedm)

        local ZombieHash = util.joaat("U_M_Y_Zombie_01")
        util.request_model(ZombieHash)
        local heading = GET_ENTITY_HEADING(pedm)
        local Radius = 50
        local ZombieOffsetSpawn = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-Radius, Radius), math.random(-Radius, Radius), math.random(0, 3))

        local Zombie = entities.create_ped(0, ZombieHash, ZombieOffsetSpawn, heading)



        util.create_tick_handler(function()
            local ZombieOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Zombie, 0, 0, 0)
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)

            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Zombie, true)
            TASK_GO_TO_COORD_ANY_MEANS(Zombie, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)

            util.yield(1500)

            if IS_ENTITY_DEAD(Zombie) then
                util.yield(2000)
                entities.delete(Zombie)
                return false
            end
        end)


        util.create_tick_handler(function()

            local ZombieOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Zombie, 0, 0, 0)
            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)

            if ZombieOffset:distance(pos) < 1.0 and not IS_PED_DEAD_OR_DYING(pedm) then
                APPLY_DAMAGE_TO_PED(pedm, 1, true, 0)
            end

            if IS_ENTITY_DEAD(pedm, false) then
                util.yield(2000)
                entities.delete(Zombie)
                return false
            end

            if IS_ENTITY_DEAD(Zombie) then
                entities.delete(Zombie)
                return false
            end
        end)

    end

    menu.action(PlayerTrollingPedList, "Zombie Apocalypse", {}, "Starts the Apolcalypse (Best results if you disable .Block Entity Spam. (Online > Protections > Block Entity Spam))=", function()
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i = 80, 0, -1 do

            SpawnZombie(pedm)
        end

    end)

    menu.divider(PlayerTrollingPedList, "------")

    menu.toggle_loop(PlayerTrollingPedList, "Infinite Ladder", {}, "Spawns a ladder on this player, legend says those who climb long enough will find Omelas", function(on)

        local LadderHash = 1122863164 --3469023669

        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 2, 2.5)


        if not DOES_ENTITY_EXIST(OBJ) then
            OBJ = entities.create_object(LadderHash, SpawnOffset)

        end

        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 2, 2.5)
        local Player_Rot = GET_ENTITY_ROTATION(pedm, 2)


        SET_ENTITY_COORDS_NO_OFFSET(OBJ, SpawnOffset.x, SpawnOffset.y, SpawnOffset.z, false, false, false)
        SET_ENTITY_ROTATION(OBJ, Player_Rot.x, Player_Rot.y, Player_Rot.z, 2, true)


    end, function()

        entities.delete(OBJ)

    end)


    

    --menu.toggle_loop(PlayerTrollingPedList, "OldKitty Boom", {}, "", function(on)



    --if not Kitty_pet or not DOES_ENTITY_EXIST(Kitty_pet) then

    --  entities.set_can_migrate(Kitty_pet, true)
    --   SET_PED_COMPONENT_VARIATION(Kitty_pet, 0, 0, 1, 0)
    --   SET_ENTITY_INVINCIBLE(Kitty_pet, true)
    --end

    -- NETWORK_REQUEST_CONTROL_OF_ENTITY(Kitty_pet)
    --  SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(Kitty_pet, true)
    --   TASK_GO_TO_COORD_ANY_MEANS(Kitty_pet, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
    --SET_PED_KEEP_TASK(Kitty_pet, true)

    --TASK_FOLLOW_TO_OFFSET_OF_ENTITY(Kitty_pet, pedm, 0, 0, 0, 0, -1, 0, true)
    --TASK_FOLLOW_TO_OFFSET_OF_ENTITY(Kitty_pet, players.user_ped(), 0, -0.3, 0, 7.0, -1, 1.5, true)




    --util.toast("loop")


    --  end, function()

    --util.toast("not loop")

    --entities.delete(Kitty)



    --end)

    --GET_NEAREST_PLAYER_TO_ENTITY(entity)
    --HAS_ENTITY_BEEN_DAMAGED_BY_ANY_OBJECT(entity)

    --[[function WoofSpammer (SelectedPetAnimal, Target)

        local AnimalHash = SelectedPetAnimal
        util.request_model(AnimalHash)
        local pedm = Target

        local radius = math.random(3, 5)
        local SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)


        radius = math.random(3, 5)
        SpawnOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, math.random(-radius, radius), math.random(-radius, radius), 0)
        local PetAnimal = entities.create_ped(28, AnimalHash, SpawnOffset, 0)
        NETWORK_REQUEST_CONTROL_OF_ENTITY(PetAnimal)



        util.create_tick_handler(function()

            --SET_ENTITY_VISIBLE(PetAnimal, false, false)
            --SET_ENTITY_COLLISION(PetAnimal, false)

            local pos = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, 0)
            SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(PetAnimal, true)
            TASK_GO_TO_COORD_ANY_MEANS(PetAnimal, pos.x, pos.y, pos.z, 5.0, 0, false, 0, 0.0)
            local KittyOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PetAnimal, 0, 0, 0)
            util.yield(1500)

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                return false
            end
        end)

        util.create_tick_handler(function()

            if IS_ENTITY_DEAD(PetAnimal) then
                entities.delete(PetAnimal)
                --util.toast("RIP " .. PetNamesList[math.random(1, #PetNamesList)] .. " :'(")
                return false
            end
        end)

    end



    menu.action(PlayerTrollingPedList, "Woof Spam", {}, "Spawns a ton of invisible doggies that will follow the player and bark at them to make them go crazy", function(on)

        local Target = GET_PLAYER_PED_SCRIPT_INDEX(pid)

        for i = 6, 0, -1 do
        SelectedWildAnimal = util.joaat("A_C_Poodle")
        WoofSpammer(SelectedWildAnimal, Target)

        SelectedWildAnimal = util.joaat("A_C_Westy")
        WoofSpammer(SelectedWildAnimal, Target)

        SelectedWildAnimal = util.joaat("A_C_Pug")
        WoofSpammer(SelectedWildAnimal, Target)
    
        SelectedWildAnimal = util.joaat("A_C_Rottweiler")
        WoofSpammer(SelectedWildAnimal, Target)

        SelectedWildAnimal = util.joaat("A_C_Rottweiler")
        WoofSpammer(SelectedWildAnimal, Target)
        
        SelectedWildAnimal = util.joaat("A_C_shepherd")
        WoofSpammer(SelectedWildAnimal, Target)

        SelectedWildAnimal = util.joaat("A_C_Husky")
        WoofSpammer(SelectedWildAnimal, Target)
        end

    end)--]]

   

end)










---
--- About LolaScript Menu
---

local script_meta_menu = menu.list(menu.my_root(),"About LolaScript", {},"Information and options about the script itself.")
menu.divider(script_meta_menu,"LolaScript")
menu.readonly(script_meta_menu,"Version", SCRIPT_VERSION)
menu.action(script_meta_menu,"Check for Update", {},"The script will automatically check for updates at most daily, but you can manually check using this option anytime.", function()
    auto_update_config.check_interval = 0
    if auto_updater.run_auto_update(auto_update_config) then
        util.toast("No updates found")
    end
end)
menu.action(script_meta_menu,"Clean Reinstall", {},"Force an update to the latest version, regardless of current version.", function()
auto_update_config.clean_reinstall = true
auto_updater.run_auto_update(auto_update_config)
end)
menu.hyperlink(script_meta_menu,"Github Source", "https://github.com/LolaThePretty/LolaScript","View source files on Github")
menu.hyperlink(script_meta_menu,"Discord Server", "https://discord.gg/qYu25S2Cqx","Join the community and submit your own ideas as future features !")
