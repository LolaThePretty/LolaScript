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


 local myListVehicleSpawner = menu.list(myListVehicle, "Vehicle Spawner", {}, "Vehicle Spawner Options")
 local myListVehicleSettings = menu.list(myListVehicle, "Vehicle Settings", {}, "Vehicle Settings")
 local myListFunSettings = menu.list(menu.my_root(), "Fun", {}, "Fun Options")
 local myListMiscSettings = menu.list(menu.my_root(), "Misc", {}, "Miscellaneous Options")


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

local KittyRingSettings = {"Default", "Invincible"}

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
    end)

    menu.divider(myListFunSettings, "------")
    
    menu.action(myListFunSettings, "Kitty Friend", {}, "Spawns a kitty friend that will follow you", function(on)

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


    menu.action(myListFunSettings, "Doggy Friend", {}, "Spawns a Doggy friend that will follow you", function(on)

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
    
    end)


    menu.divider(myListFunSettings, "------")
    
 local myListFunVehicleSettings = menu.list(myListFunSettings, "Vehicle", {}, "Fun Vehicle Options")
 local myListFunBombVan = menu.list(myListFunSettings, "Bomb Van", {}, "Bomb Van Options")

 

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








menu.toggle_loop(myListMiscSettings, "Diplay Location", {}, "Diplays Global Location", function(on)

    local RealOffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 0, 0)

    util.draw_debug_text("pos x :" .. RealOffset.x)
    util.draw_debug_text("pos y :" .. RealOffset.y)
    util.draw_debug_text("pos z :" .. RealOffset.z)

end, function() 

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


--local SimulatePlayerInputTimerMax = 600
local SimulatePlayerInputTimer = 1000
local SimulatePlayerInputTimerMax = 1000

myListFunBombVan:slider("Bomb Van Timer", {}, "Changes the timer of the Bomb Van", 0, 10000, 1000, 100, function (BombVanTimerSettings)
    SimulatePlayerInputTimerMax = BombVanTimerSettings
end)

myListFunBombVan:action("Bomb Van", {}, "Spawns van contening a bomb (Right click to detonate prematuraly)", function () -- changed these value names to be more sense
        
    
    
        

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
    SimulatePlayerInputTimer = SimulatePlayerInputTimer - 1
    util.draw_centred_text(SimulatePlayerInputTimer)
    local Bomboffset = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(spawnedCar, 0, 0, 0)
    if SimulatePlayerInputTimer < 0 then
        ADD_EXPLOSION(Bomboffset.x, Bomboffset.y, Bomboffset.z, 0, 1.0, true, false, 1.0, false)
        util.yield(100)
        entities.delete_by_handle(spawnedCar)
        
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



        
    local EpicJumpSettings = {"Low", "Medium", "High", "Very High"}

    menu.textslider(myListFunSettings, "Epic Jump", {}, "Jump out from a plane !", EpicJumpSettings, function(index, name)
    

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

        local PlaneSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, SpawnHeight)
        local CarSpawnLoc = GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(pedm, 0, 0, SpawnHeight + 4) --104
        
        local Plane = entities.create_vehicle(PlaneHash, PlaneSpawnLoc, 0)
        SET_ENTITY_INVINCIBLE(Plane, true)
        local Car = entities.create_vehicle(CarHash, CarSpawnLoc, 180)
        SET_ENTITY_VELOCITY(Plane, 0, 100, 0)
        
        SET_PED_INTO_VEHICLE(pedm, Car, -1)
        util.yield(1)
        SET_ENTITY_VELOCITY(Car, 0, 100, 0)

        local Timer = 200
        util.create_tick_handler(function()
            Timer = Timer - 1
            util.draw_centred_text(Timer)
            if Timer < 0 then
                SET_VEHICLE_DOOR_OPEN(Plane, 2, false, false)
                return false
            end
        end)

 

        --local doors = GET_NUMBER_OF_VEHICLE_DOORS(Plane)
        --util.toast(doors)

    end)

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
       
       local PlayerFunnyList =  root:list('Funny', {'Funny'}, 'Funny Options')
       local PlayerFunnyVehicleList =  PlayerFunnyList:list('Vehicle', {'Vehicle'}, 'Funny Vehicle Options')

   menu.action(PlayerSpectate, "Spectate Player ?", {}, "Spectate Player On/Off", function (on_change)
        local  pname = GET_PLAYER_NAME(pid)
        menu.trigger_commands('spectate'.. pname)
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
    local PlayerFriendlyVehicleList = menu.list(PlayerFriendlyList, "Vehicle", {}, "Vehicle Settings")


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

    
   -- menu.divider(PlayerTrollingList, "------")

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




    ---------------------------
    --Friendly
    ---------------------------

    

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

    


    
end)
