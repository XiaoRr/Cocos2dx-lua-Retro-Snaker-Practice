
local MenuLayer = cc.Layer:create()

--改写print
local old_print = print
local print = function (...)
    old_print("[MyDebug]",...)
end

-- 创建button
local function createButton(node,imgname,x,y,callback)
    ccui.Button:create(imgname,imgname)
    :setAnchorPoint(cc.p(0.5,0.5))
    :setPosition(cc.p(x,y))
    :addTo(node)
    :addTouchEventListener(callback)
end 


function MenuLayer:Create()
    print("Draw Background")
    display.newSprite("background.png")
    :move(display.cx, display.cy)
    :addTo(self)
    
    print("Draw StartButton")
    
    createButton(
        self,
        "btn_start.png",
        display.cx,
        display.cy-150,
        function (ref, type)
            if type == ccui.TouchEventType.ended then
                print("Start game")
                cc.exports.multLayer:switchTo(1)
            end
        end
    )

    createButton(
        self,
        "btn_setting.png",
        display.cx-180,
        50,
        function (ref, type)
            if type == ccui.TouchEventType.ended then
                print("Setting")
            end
        end
    )

    createButton(
        self,
        "btn_help.png",
        display.cx,
        50,
        function (ref, type)
            if type == ccui.TouchEventType.ended then
                print("Help")
            end
        end
    )

    createButton(
        self,
        "btn_exit.png",
        display.cx+180,
        50,
        function (ref, type)
            if type == ccui.TouchEventType.ended then
                print("Exit")
            end
        end
    )
    
    print("finish MainScene Creating")
end
--[[
    function onButtonClicked(function()
    print("clicked")
    end
    ]]--
MenuLayer:Create()
return MenuLayer
