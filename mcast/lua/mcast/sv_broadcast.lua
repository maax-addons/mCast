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



MLIB:AddNetworkString("mCast.SendToUser")
MLIB:AddNetworkString("mCast.ReciveBroadcast")
MLIB:AddNetworkString("mCast.Open")

net.Receive("mCast.ReciveBroadcast", function()
   local head = net.ReadString() 
   local text = net.ReadString()

   net.Start("mCast.SendToUser")
      net.WriteString(head or "Error!")
      net.WriteString(text or "Error!")
    net.Broadcast()
end)



MLIB:AddChatCommand( "/mcast" , function() 
   net.Start("mCast.Open")
   net.Broadcast() 
end)