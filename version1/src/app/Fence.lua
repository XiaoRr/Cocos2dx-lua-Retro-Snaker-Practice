local Fence = class("Fence")

local Tool = require("app.GameTool")

local function fenceGenerator( node, bound, callback )

    for i = -bound,bound do
        local sp = cc.Sprite:create("fence.png")
        local posx,posy = callback(i)
        sp:setPosition(posx,posy)
        node:addChild(sp)
    end
end

function Fence:ctor( bound,node )
    self.bound = bound

    --up
    fenceGenerator(node,bound,function(i)
        return Tool.grid2Pos(i,bound)
    end)

    --down
    fenceGenerator(node,bound,function(i)
        return Tool.grid2Pos(i,-bound)
    end)

    --left
    fenceGenerator(node,bound,function(i)
        return Tool.grid2Pos(bound,i)
    end)

    --right
    fenceGenerator(node,bound,function(i)
        return Tool.grid2Pos(-bound,i)
    end)
end

function Fence:checkCollide(x,y)
    return x >= self.bound or x <= -self.bound or y >= self.bound or y <= -self.bound
end
return Fence