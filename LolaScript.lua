-- LolaScript
-- by LolaTheSquishy

local SCRIPT_VERSION = "1.0.7"

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







--Spawns a Hamsterball for the player--
---------------
-----IDEAS-----
---------------
--Spawn stunt bumpers under vehicles to slow them down without bonking
--Make a deathrun parkour
--Spawn a Loop in front of the players

--Jet Squadron
--Bigger Hamsterball, Thunderball for rocket voltics
--sharks spawed around a boat

--unload cargoplane when far of it in epic plane jump
--make squadron lfy ur own plane with random planes following

--Translate script





--make a blender with windmills on the player
--do a guess which car is the correct and if u wrong it spawn a kamikaze or a blender

--spawn invisble dogs around someone to sound spam them

--PvP enhancer

--auto give guns and u select which ones are auto given with a toggle loop for each

--giant baguette whatever this suggestion means Lol
--adding player peds as pet

--make a flappy bird feature with sideway cam







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


menu.toggle_loop(myListMiscSettings, "Diplay Location", {}, "Diplays Global Location", function(on)

    local RealOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

    util.draw_debug_text("pos x :" .. RealOffset.x)
    util.draw_debug_text("pos y :" .. RealOffset.y)
    util.draw_debug_text("pos z :" .. RealOffset.z)

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
local myListFunAnimalsWildSettings = menu.list(myListFunAnimalsSettings, "Wild", {}, "Wild Animals Options")
local myListFunAnimalsPetSettings = menu.list(myListFunAnimalsSettings, "Pet", {}, "Pet Animals Options")
menu.action(myListFunAnimalsSettings, "Populate world !", {}, "Will spawn a lot of random animals here and there around the every player", function ()

    spawn_animals_all(util.joaat(EveryAnimalHashList[math.random(1, #EveryAnimalHashList)]))

end)

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

    local PetNamesList = {"Ako", "Niko", "Izika", "Whiskers", "Nina", "Caramel", "Leonardo", "Jack", "Doodle", "Sonic", "Mario", "Sakuro", "Johnathan", "Therese", "Asuka", "Rei", "Hanna", "Dawn", "Sunshine", "Midnight", "Apauline", "Ernest", "Charles", "Sugar", "Squishy", "boo", "Peepo", "Raphael", "Sebastian", "Orlando", "Alyssa", "Yannis", "Joshua", "Peter", "Soup", "Dracula", "Alucard", "teemo", "yuki", "daboo", "pashoo", "squat", "Felix", "Lola", "Tigris", "Isoa", "Hannah", "Capucine", "Minette", "Tamagochi", "Pikachu", "Eevee", "Evely"}

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




    --menu.toggle(myListMiscSettings, "add divider", {}, "Trap the player within its car", function(on_change)

    --    if on_change == true then
    --        divider_1(on_change)
    --    else
    --        divider_1()
    --    end

    --end)
  





































--------------------------------------------------------------------------------------------
players.add_command_hook(function(pid, root) --[[you will need the pid for most things and the root is the root of the players
    menu. You can make a divider for the name of your script in the player menu]]
    menu.player_root(pid):divider("Lola Script")

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



    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rat", {}, "Spawns a pet rat near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rat")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rabbit", {}, "Spawns a pet rabbit near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_01")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Giant Rabbit", {}, "Spawns a pet giant rabbit near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rabbit_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Kitty", {}, "Spawns a pet kitty near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Cat_01")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)
    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Poodle", {}, "Spawns a pet poodle near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Poodle")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Westy", {}, "Spawns a pet westy near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Westy")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pug", {}, "Spawns a pet pug near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Pug", {}, "Spawns a pet zombie pug near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pug_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rottweiler", {}, "Spawns a pet rottweiler near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rottweiler")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Retriever", {}, "Spawns a pet retriever near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Retriever")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Shepherd", {}, "Spawns a pet shepherd near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_shepherd")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Husky", {}, "Spawns a pet husky near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Husky")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Coyote", {}, "Spawns a pet coyote near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Coyote", {}, "Spawns a pet zombie coyote near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Coyote_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Mountain Lion", {}, "Spawns a pet mountain lion near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Mountain Lion", {}, "Spawns a pet zombie mountain lion near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_MtLion_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Panther", {}, "Spawns a pet panther near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Panther")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Rhesus", {}, "Spawns a pet rhesus near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Rhesus")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Chimp", {}, "Spawns a pet chimp near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Chimp_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pig", {}, "Spawns a pet pig near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pig")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Boar", {}, "Spawns a pet boar near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet zombie boar", {}, "Spawns a pet zombie boar near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Boar_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Cow", {}, "Spawns a pet cow near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Cow")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Deer", {}, "Spawns a pet deer near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Zombie Deer", {}, "Spawns a pet zombie deer near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Deer_02")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Fishy", {}, "Spawns a pet fishy near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Fish")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Stingray", {}, "Spawns a pet stingray near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Stingray")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Dolphin", {}, "Spawns a pet dolphin near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Dolphin")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hammerhead Shark", {}, "Spawns a pet hammerhead shark near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkHammer")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Tiger Shark", {}, "Spawns a pet tiger shark near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_SharkTiger")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Killer Whale", {}, "Spawns a pet killer whale near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_KillerWhale")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hump Back Whale", {}, "Spawns a pet hump back whale near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_HumpBack")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Pigeon", {}, "Spawns a pet pigeon near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Pigeon")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Crow", {}, "Spawns a pet Crow near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Crow")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Hen", {}, "Spawns a pet hen near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Hen")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Seagull", {}, "Spawns a pet seagull near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Seagull")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Chickehawk", {}, "Spawns a pet chickenhawk near this player (must spectate or be near or it to work properly)", function ()

        SelectedPetAnimal = util.joaat("A_C_Chickenhawk")
        local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
        SpawnPetAnimal(SelectedPetAnimal, pedm)

    end)

    menu.action(PlayerFriendlyPetList, "Spawn a Pet Cormorant", {}, "Spawns a pet cormorant near this player (must spectate or be near or it to work properly)", function ()

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

menu.action(myListFunMinigamesSettings, "Flappy flap", {}, "Totally not a rip off of flappy bird that allows you to play using your own car and to flap using the space key", function()
    FlappyFlapminigamestarted = 0
    if IS_CONTROL_PRESSED(0, 68) and FlappyFlapminigamestarted == 0 then
        FlappyFlapminigamestarted= 1
        util.yield(1000)
    local time = 0
    

    local pedm = GET_PLAYER_PED_SCRIPT_INDEX(pid)
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
    util.yoeld(2000)
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

    menu.action(PlayerFunnyList, "Giant Rabbit Riding", {}, "Spawns a pet Giant Rabbit near this player that will become it's pet, you will be riding the rabbit (must spectate or be near or it to work properly)", function ()
        
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

    end)

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
menu.hyperlink(script_meta_menu,"Discord Server", "https://discord.gg/chAUB6r8EY","Join the community and submit your own ideas as future features !")
