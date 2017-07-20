local GameLayer = cc.Layer:create()

local Tool = require("app.GameTool")
local Snake = require("app.Snake")
local Fence = require("app.Fence")
local AppleFactory = require("app.AppleFactory")

local cMoveSpeed = 0.3  -- 移动间隔
local cBound = 7    --苹果的位置区间
function GameLayer:init()
    -- 创建蛇类
    -- self.snake = Snake.new(GameLayer)
    self:createScoreBoard()
    self.fence = Fence.new(cBound,self)
    self:reset()
    print(self.score)
    -- 为蛇类绑定定时器
    cc.Director:getInstance():getScheduler():scheduleScriptFunc(
        function() 

            if self.stage == "dead" then return end
            self.snake:update()

            local headX,headY = self.snake:getHeadGrid()
            if self.appleFactory:checkCollide( headX,headY ) then
                self.appleFactory:generate()
                self.snake:grow()
                self:setScore(self.score +1)
            end

            if self.snake:checkSelfCollide() or 
            self.fence:checkCollide(headX,headY) then
            self.stage = "dead"
                self.snake:blink( function()
                    self:reset()
                end
                )
                
            end
        end,
        cMoveSpeed,false)

    

    -- 创建苹果工厂类
    -- self.appleFactory = AppleFactory.new(cBound,GameLayer)
end

function GameLayer:reset()

    if self.snake ~= nil then
        self.snake:kill()
    end

    if self.appleFactory ~= nil then
        self.appleFactory:reset()
    end

    self.snake = Snake.new( self )
    self.appleFactory = AppleFactory.new(cBound,self)

    self.stage = "running"
    self.score = 0
    self:setScore(0)

end
-- 触摸事件的创立与绑定
function GameLayer:processInput()

    local function onTouchBegan(touch,event)

        local location = touch:getLocation()
        local visibleSize = cc.Director:getInstance():getVisibleSize()
        local origin  = cc.Director:getInstance():getVisibleOrigin()

        local finaX = location.x - (origin.x + visibleSize.width/2)
        local finaY = location.y - (origin.y + visibleSize.height/2)

        self.snake:setDir(Tool.vector2Dir(finaX,finaY))
    end
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler( onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)

    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener,self)

end

function GameLayer:createScoreBoard()

print("test")
    display.newSprite("applesign.png")
    :move(display.right -200,display.cy + 150)
    :addTo(self)


    local score = cc.Label:createWithSystemFont("0","",40)
    print(score)
    self:addChild(score)
   
    score:setPosition(display.right-200,display.cy +80)
     
    
    self.scoreLabel = score

end

function GameLayer:setScore(score)
    --print("score="..score)
    self.score = score
    self.scoreLabel:setString(string.format("%d",self.score))
end
GameLayer:init()
GameLayer:processInput()
return GameLayer