--  写过的一些文件

--[[
    -- 背景
    local ret = cc.Layer:create()  
  
    local node1 = cc.Sprite:create("green.png")
     
    node1:setPosition(cc.p(400,500))
    node1:setAnchorPoint(cc.p(1,1))
    node1:setScale(0.2)
    ret:addChild(node1, 1)  

    local node2 = cc.Sprite:create("red.png")
    
    node2:setPosition(cc.p(200,300))
    node2:setAnchorPoint(cc.p(0.5,0.5))
    node2:setScale(0.2)
    ret:addChild(node2, 1)  
  
    
    local posx,posy = node2:getPosition()
    print(posx,posy)
    print(node1:getPosition())
    local point1 = node1:convertToNodeSpace(cc.p(posx,posy))
    local point3 = node1:convertToNodeSpaceAR(cc.p(posx,posy))

    print(point1.x,point1.y,point3.x,point3.y)
	
	
    ]]-- 

--键盘事件监听
    local layer = cc.Layer:create()
    print(layer:getContentSize().width)
    print(display.cx)

    local statusLabel  = cc.Label:createWithSystemFont("no KeyBoard Event Catched!","",40)
    statusLabel:setAnchorPoint(cc.p(0.5,0.5))
    statusLabel:setPosition(cc.p(display.cx, display.cy))
    layer:addChild(statusLabel)
    --statusLabel

    --Create Keyboard Listener
    local listener = cc.EventListenerKeyboard:create()
    listener:registerScriptHandler(onKeyPressed,cc.Handler.EVENT_KEYBOARD_PRESSED)
    listener:registerScriptHandler(onKeyReleased,cc.Handler.EVENT_KEYBOARD_RELEASED)
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()

    --add Listener
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,statusLabel)
--[[
    local bg = cc.Sprite:create("green.png")
    bg:move(cc.p(display.cx/2, display.cy/2))
    bg:scale(0.1)
    layer:addChild(bg)
]]--

--[[
local function createLayer()
    print("myLayer init")
    local layer = cc.Layer:create()     --create Layer

end
]]--

local function onKeyPressed(keyCode,event)
	local buf = string.format("%d键按下",keyCode)
	local label = event:getCurrentTarget()
    label:setString(buf)
end

local function onKeyReleased(keyCode,event)
	local buf = string.format("%d键抬起",keyCode)
	local label = event:getCurrentTarget()
    label:setString(buf)
end

local GameMainLayer = nil  


GameMainLayer = function ()  


    return layer  

    

end  
    
function cc.exports.CreateGameScene()  
    print("CreateGameScene...")  
  
    local scene = cc.Scene:create()  
    local layer = GameMainLayer()  
    scene:addChild(layer)  
    return scene  
end  

function MainScene:onCreate()
--[[
    -- add background image
    display.newSprite("grEEN.png")
        :move(display.center)
        :addTo(self)

    -- add HelloWorld label
    cc.Label:createWithSystemFont("Hello1235532 World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :setAnchorPoint(cc.p(0.5,0.5))
        :addTo(self)

	print("this is test")
]]--

    local layer = cc.Layer:create() --创建背景
    local red = cc.Sprite:create("red.png")
    bg:setPostion(cc.p(size.width/2.size.height/2))
    layer:addChild(red)

    
end