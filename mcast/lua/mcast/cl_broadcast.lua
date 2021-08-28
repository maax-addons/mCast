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
  
  File: cl_broadcast.lua

]]--


function mCast:Broadcast(type, header, text_, time)

    self = vgui.Create("DPanel")
    self:SetPos(ScrW()/4.0, ScrH() /6.1)
    self:SetSize(ScrW() / 2, 140)
    self:AlphaTo(255, 0.75, 0)
    self:AlphaTo(0, 0.75, 4.5 + 0.75)
    self.Paint = function(self,w,h)
    end

    local bg = vgui.Create("DPanel", self)
    bg:Dock(FILL)
    bg.Paint = function(self,w,h)
          draw.RoundedBoxEx(9, 0, 0, w,h, Color(38,38,38,200), false, false, true, true)
          draw.RoundedBoxEx(0, 0, 0, w,7, type, false, false, true, true)

          draw.DrawText(header, "AdvancedBroadcast.PopUPHead", self:GetWide() / 2, 10, type, TEXT_ALIGN_CENTER)
          draw.DrawText( text_, "AdvancedBroadcast.PopUPText", self:GetWide() / 2, self:GetTall() / 1.7, Color(255,255,255), TEXT_ALIGN_CENTER)
    end
    
    local time_remove = time or "4"

    timer.Simple(time_remove, function() 
     
        self:Remove()
    
    end)
    
    mCast:BroadcastPrint(type, header, text_)
end

net.Receive("mCast.Broadcast", function(len)
    mCast:Broadcast(net.ReadString(), net.ReadString(), net.ReadString())
end)

concommand.Add("popup_test", function()

  mCast:Broadcast(Color(255,0,0), "header", "tex..........._")

end)


