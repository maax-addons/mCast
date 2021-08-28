////////////////////////////////////////
//        Advanced Broadcast          //
//          Coded by: Maax            //
//                                    //
//      Version: v1.0 (Workshop)      //
//                                    //
//      You are not permitted to      //
//        reupload this Script!       //
//                                    //
////////////////////////////////////////

--[[
  
  File: sh_init.lua

]]--


mCast = mCast or {}

local dir = "mcast/"

mCast.Verison = "v1.0"

function mCast.Print(...)
	MsgC(Color(225, 20, 30), "[mCast - " ..mCast.Verison.."] ", Color(129, 225, 20), ..., "\n\r")
end


if SERVER then
    
    if !MLIB then 
        mCast.Print("MLIB is not installed! This Addon will not work without the MLIB Libary!")
        return 
    end
    mCast.Print("MLIB is installed! So we can continue!")
    
    AddCSLuaFile(dir..'cl_admin.lua')
    AddCSLuaFile(dir..'cl_handler.lua')
    AddCSLuaFile(dir..'cl_fonts.lua')
    AddCSLuaFile(dir..'cl_hudpopup.lua')
    AddCSLuaFile(dir..'cl_util.lua')
    AddCSLuaFile(dir..'sh_config.lua')
    AddCSLuaFile(dir..'cl_admin.lua')
    AddCSLuaFile(dir..'cl_broadcast.lua')
    
    mCast.Print("Loading Config...")
        mCast.Print("Includeing File: sh_config.lua")
        include(dir..'sh_config.lua')
    mCast.Print("Config loaded!")

    mCast.Print("Loading Serverside...")
        mCast.Print("Includeing File: sv_broadcast.lua")
        include(dir..'sv_broadcast.lua')
    mCast.Print("Serverside loaded!")
else

    if !MLIB then 
        mCast.Print("MLIB is not installed! This Addon will not work without the MLIB Libary!")
        return 
    end
    mCast.Print("MLIB is installed! So we can continue!")

    mCast.Print("Loading Config...")
        mCast.Print("Includeing File: sh_config.lua")
        include(dir..'sh_config.lua')
    mCast.Print("Config loaded!")

    mCast.Print("Loading Clientside...")
        mCast.Print("Includeing File: cl_broadcast.lua")
        include(dir..'cl_broadcast.lua')

        mCast.Print("Includeing File: cl_handler.lua")
        include(dir..'cl_handler.lua')
    
        mCast.Print("Includeing File: cl_util.lua")
        include(dir..'cl_util.lua')

        mCast.Print("Includeing File: cl_admin.lua")
        include(dir..'cl_admin.lua')
        
        mCast.Print("Includeing File: cl_fonts.lua")
        include(dir..'cl_fonts.lua')
        
        mCast.Print("Includeing File: cl_broadcast.lua")
        include(dir..'cl_broadcast.lua')
    mCast.Print("Clientside loaded!")

end