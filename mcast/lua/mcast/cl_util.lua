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


function mCast:BroadcastPrint(type, header, text_)
    MsgC( type, "[mCast - "..header.. "] ", Color(255,255,255), text_ ,"\n")
end

function mCast:ChatPrint(type, header, text)
  chat.AddText( type , "[mCast - "..header.."] ",Color(255,255,255), text)
end
