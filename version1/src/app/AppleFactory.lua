--- 苹果工厂类
--- 用于随机的创造苹果

local Tool = require("app.GameTool")
local AppleFactory = class("AppleFactory")

function AppleFactory:ctor( bound,node )
    
    self.bound = bound
    self.node = node

    math.randomseed( os.time() )
    self:generate()
end

local function getPos( bound )
    return math.random( -bound , bound )
end

function AppleFactory:generate(snake)

    if self.appleSprite ~= nil then
        self.node:removeChild( self.appleSprite )
    end

    local sp = cc.Sprite:create("apple.png")

    local genBoundLimit = self.bound-1

    local x,y = getPos( genBoundLimit ) , getPos( genBoundLimit )

    local finalX,finalY = Tool.grid2Pos(x,y)

    sp:setPosition(finalX,finalY)

    -- print(finalX,finalY)
    self.node:addChild( sp )

    self.appleX= x
    self.appleY = y

    self.appleSprite = sp
end

function AppleFactory:checkCollide(x,y)

    if x==self.appleX and y == self.appleY then
        return true
    end
    return false

end

function AppleFactory:reset()
    self.node:removeChild( self.appleSprite)
end
return AppleFactory