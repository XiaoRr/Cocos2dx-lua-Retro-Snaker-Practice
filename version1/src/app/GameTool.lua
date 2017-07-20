--- 存放一些工具类的函数
--- 本来是准备存成全局变量，然而cocos的全局变量调试时不显示堆栈信息很恶心

local Tool = {}
local cGridSize = 33
local scaleRate = 1/display.contentScaleFactor

--- 根据游戏坐标求出绘图坐标
function Tool.grid2Pos(x, y)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin =  cc.Director:getInstance():getVisibleOrigin()

    local finalX = origin.x + visibleSize.width/2 + x*cGridSize * scaleRate
    local finalY= origin.y + visibleSize.height/2 + y*cGridSize * scaleRate

    return finalX,finalY
end

--- 根据游戏坐标求出其位于屏幕上的方位（上下左右）
function Tool.vector2Dir(x,y)

    if math.abs(x) > math.abs(y) then
        if x<0 then
            return "left"
        else 
            return "right"
        end
    else
        if y<0 then
            return "up"
        else
            return "down"
        end
    end
    
end
return Tool