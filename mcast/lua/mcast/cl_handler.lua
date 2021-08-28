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

local function CheckVersion()


	http.Fetch("https://raw.githubusercontent.com/maax-addons/mcast_adminbroadcast/main/version.txt",
		
		-- onSuccess function
		function( body, length, headers, code )
			-- The first argument is the HTML we asked for.
			if body == mCast.Verison then 
                 mCast.Print("Addon is up to date!")
			else 
			    if !mCast.ConfigNotifyOnUpdate then return end
			    timer.Create("AdvancedNotify.UpdateAddon", 20, 4000*4000, function() 
				     mCast.Print("A new version of the addon is available! Please update this installation.")
					 mCast:ChatPrint(Color(255,0,0), "Update", "A new version of the addon is available! Please update!") 
				end)
			end
		end,

		-- onFailure function
		function( message )
			-- We failed. =(
			print( message )
		end,

		-- header example
		{ 
			["accept-encoding"] = "gzip, deflate",
			["accept-language"] = "fr" 
		}
	)

end


concommand.Add("adn_version", CheckVersion())
