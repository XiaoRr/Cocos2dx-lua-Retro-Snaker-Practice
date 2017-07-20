
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"


local s = cc.Director:getInstance():getWinSize()
print(s.width)

cc.exports.multLayer = {}

local menuLayer = require("app.views.MenuLayer")
local gameLayer = require("app.views.GameLayer")
multLayer =CCLayerMultiplex:create(menuLayer)
multLayer:addLayer(gameLayer)
multLayer:switchTo(1)


local function main()
    --require("app.MyApp"):create():run()

    local scene = cc.Scene:create() 
    scene:addChild(multLayer)

    --local scene = cc.exports.CreateGameScene()
    
    cc.Director:getInstance():runWithScene(scene)  
end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
