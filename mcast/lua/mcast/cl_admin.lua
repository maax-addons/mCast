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


function mCast:AdminCreate()
    
     
    self = vgui.Create("MLIB.Frame")
    self:SetSize(ScrW() / 2,230)
    self:Center()
    self:SetTitle("Admin Broadcast")
    self:MakePopup()

    self.titleentry = vgui.Create("MLIB.TextEntry", self)
    self.titleentry:SetSize(130,40)
    self.titleentry:Dock(TOP)
    self.titleentry:SetPlaceholder("Head...")
    self.titleentry:SetFont("mlib.broadcastentry")
    self.titleentry:DockMargin(10,10,10,10)

    self.textentry = vgui.Create("MLIB.TextEntry", self)
    self.textentry:SetSize(130,40)
    self.textentry:Dock(TOP)
    self.textentry:SetPlaceholder("Content...")
    self.textentry:SetFont("mlib.broadcastentry")
    self.textentry:DockMargin(10,0,10,10)

    self.submit = vgui.Create("MLIB.Button", self)
    self.submit:SetSize(130,50)
    self.submit:Dock(TOP)
    self.submit:SetColor(Color(255,0,0))
    self.submit:SetColorHoverd(Color(204, 0, 0))
    self.submit:SetText("Submit")
    self.submit:DockMargin(10,0,10,10)
    self.submit.DoClick = function()
          
        local head = self.titleentry:GetText()
        local text = self.textentry:GetText()

        if head == "" then 
          mCast:ChatPrint(Color(255,0,0), "Error", "Title: No content found!") 
        return end
        if text == "" then 
          mCast:ChatPrint(Color(255,0,0), "Error", "Content: No content found!") 
        return end

        net.Start("mCast.ReciveBroadcast")
          net.WriteString(head)
          net.WriteString(text)
        net.SendToServer()
   
    end
    
   
end

function mCast:Open()
  
  if table.HasValue(mCast.ConfigAllowedGroupes, LocalPlayer():GetUserGroup() ) then
    mCast:AdminCreate()
  else
    mCast:ChatPrint(Color(255,0,0), "Error", "You do not have permission to open this menu!") 
  end

end

concommand.Add("mCast_open", function()
    mCast:Open()
end)

net.Receive("mCast.Open", function(len)
    mCast:Open()
end)

net.Receive("mCast.SendToUser", function(len)
    mCast:Broadcast(Color(255,0,0), net.ReadString(), net.ReadString())
    mCast:ChatPrint(Color(0,255,0), "Success", "Message successfully created!") 
end)