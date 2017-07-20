local Tool = require("app.GameTool")

local Body = class("Body")

function Body:ctor(snake,x,y,node,isHead)

    self.snake = snake
    self.x = x
    self.y = y


    if isHead then
        self.sp = cc.Sprite:create("headL.png")
    else
        self.sp = cc.Sprite:create("body.png")
    end

    node:addChild( self.sp )

    self:update()

end

function Body:update()

    local posx,posy = Tool.grid2Pos( self.x,self.y)

    self.sp:setPosition(posx,posy)
end
--[[
function Body:SetDir(dir)
    self.dir = dir
end
]]--
return Body