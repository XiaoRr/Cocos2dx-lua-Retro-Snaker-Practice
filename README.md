## Cocos2dx-lua-Snake-Game-Practice（贪吃蛇练习项目）

基于版本为cocos2dx 3.15.1 (lua)

运行之前你需要配置好cocos2dx的开发环境

由于整个目录过大，这里只提供simluator/Win32下的res和src文件，直接覆盖编译出的HelloWorld下的同目录即可

ps:我的项目叫Snake，如果发生不可名状的错误，你可能需要创建一个同名的项目。

### 参考配置方法：
http://www.cocos.com/docs/native/v3/getting-started/setting-up-development-environments-on-windows7-with-vs2013/zh.html

### 提示：

你可能需要VS2013来编译这个过时的技术

修改SimluatorWin.cpp内的宏为1以保证debug窗口为显示状态

### 该项目课程链接：
http://www.imooc.com/learn/487

本人基于新版本以及个人理解，对代码进行了一定改动。

代码将分为两个版本，分别对应课程上部分和下部分的最终结果，同时可能会有本人的魔改版。（目前只完成了上部分）

代码注释不多，由于本人为初学者可能架构紊乱，望有学习的人有一定的基础。

### 主要体现：

听从业内人事建议，放弃了Scene而采用Layer的切换（CCLayerMultiplex）。

放弃了MVC架构

### 个人感想

cocos2dx-lua已经完蛋了，但是依然有一定的学习意义，本人由于苦逼的实习被迫拾起这门2年前的技术（没错，而且还只能找到两年前的同一个教程），希望能给寥寥无几的后来者一点帮助。

[api查询](http://api.cocos.com/index.html)
