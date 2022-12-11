EnablePrimaryMouseButtonEvents(true)
turn=0
down=0
function OnEvent(event, arg)
    local offset
    local recovery_offset
    local downcount
    local qwq = IsMouseButtonPressed(3)
    OutputLogMessage("Event: "..event.." Arg: "..arg.."\n")
    if(event== "MOUSE_BUTTON_PRESSED" and arg==1 and turn==1 and qwq==true) then
        downcount=0
        repeat
            downcount=downcount+1
            if(downcount<=150 and down==1) then
                MoveMouseRelative(0,1)
            end
            offset=math.random(5,7)
            recovery_offset = -offset
            Sleep(2)
            MoveMouseRelative(offset,offset)
            Sleep(2)
            MoveMouseRelative(recovery_offset,recovery_offset)
        until not IsMouseButtonPressed(1)
    end
    if(event== "MOUSE_BUTTON_PRESSED" and arg==4) then 
        if(turn==0) then
            turn=1
        else
            turn=0  
        end
    end
    if(event== "MOUSE_BUTTON_PRESSED" and arg==5) then
        if(down==0) then
            down=1
        else
            down=0  
        end
    end
end

