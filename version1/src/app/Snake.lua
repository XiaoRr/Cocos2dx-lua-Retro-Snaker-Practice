local Snake = class("Snake")

local Body = require("app.Body")

local cinitLen = 3

local hvTable = {
    ["left"] = "h",
    ["right"] = "h",
    ["up"] = "v",
    ["down"] = "v",
}

local rotTable = {
    ["left"] = 0,
    ["right"] = 180,
    ["up"] = -90,
    ["down"] = 90,
}


function Snake:ctor( node )

    self.bodys = {}
    self.node = node
    self.moveDir = "left"

    for i=1,cinitLen do
        self:grow(i==1)
    end

end

function Snake:getTailGrid()
    if #self.bodys == 0 then
        return 0,0
    end

    local tail = self.bodys[#self.bodys]
    return tail.x,tail.y
end

function Snake:grow( isHead )
    local tailX,tailY = self:getTailGrid()
    local body = Body.new(self,tailX,tailY,self.node,isHead,self.moveDir)

    table.insert( self.bodys, body )
end

local function offsetGridByDir(x,y,dir)

    if dir == "left" then
        return x-1,y
    elseif dir == "right" then
        return x+1,y
    elseif dir == "up" then
        return x,y-1
    elseif dir == "down" then
        return x,y+1
    end

    print("error:unknown dir:",dir)
    return x,y
end

function Snake:update()
    if #self.bodys == 0 then
        return 0,0
    end

    -- 
    for i = #self.bodys,1,-1 do
        local body = self.bodys[i]

        if i==1 then
            body.x, body.y = offsetGridByDir( body.x,body.y,self.moveDir)
            body.moveDir = self.moveDir
        else
            local front = self.bodys [i-1]
            body.x,body.y = front.x,front.y
        end

        body:update()
    end
end

function Snake:setDir(dir)
    if hvTable[dir] == hvTable[self.moveDir] then
        return 
    end
    self.moveDir = dir

    local head = self.bodys[1]
    head.sp:setRotation( rotTable[self.moveDir])
end

function Snake:getHeadGrid()
    if #self.bodys == 0 then
        return nil
    end

    local head = self.bodys[1]

    return head.x,head.y
end

function Snake:checkSelfCollide()
    if #self.bodys <2 then return end
    local headX,headY = self:getHeadGrid()

    for i = 2,#self.bodys do
        local body = self.bodys[i]
        if body.x == headX and body.y == headY then
            return true
        end
    end

    return false
end

function Snake:kill()
    for _,body in ipairs(self.bodys) do
        self.node:removeChild(body.sp)
    end
end

function Snake:blink( callback )
    for index,body in ipairs( self.bodys ) do
        local blink = cc.Blink:create(3,5)

        if index == 1 then 
            local a = cc.Sequence:create( blink ,cc.CallFunc:create(callback))

            body.sp:runAction(a)
        else
            body.sp:runAction( blink )
        end
    end
end
return Snake