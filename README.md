Nekocraft2sX 客户端项目
======================
----------------------
__当前版本标记:145b4__

目前进度:
+ 基本功能(原创皮肤MOD)
+ 实现MOD加载 

未来计划(原创启动器):
+ 可定制登录协议
+ 美观GUI实现
+ 自动更新
+ 游戏内自定义GUI
+ Spoutcraft支持可能

编译:`git archive --format=zip -9 -o nekocraftS2-pack.zip master` 

-----------------------------------

关于客户端
===============
mod安装
---------------
+ 客户端使用bat包装MagicLauncher的命令行模式载入MOD
  如需自行载入MOD 请将mod的zip文件放入`.minecraft\bin\injarmods` 并修改mod载入文件
  
mod载入文件说明 (以lite.txt为例)
---------------

    ZH_Input_1.4.4.zip #中文输入 优先级0
    Font_HKSN_U.zip #字体 优先级0
    OptiFine_1.4.4_HD_U_D2.zip #高清修复 优先级0
    ModLoader_1.4.4.zip #ML 优先级1
    MySkinConfig.zip #皮肤配置 优先级9

  MOD载入顺序 ZH_Input_1.4.4.zip->Font_HKSN_U.zip...以此类推。其运行的效果等同于按该顺序将mod拖入jar中。
  用此方法载入MOD省去了频繁打开jar文件拖放mod的麻烦，一次配置多次使用。如果出了错也容易修改，不用备份jar文件。
  同时规避了MagicLauncher本体只能使用绝对路径载入mod的麻烦(对懒人包作者来说)。

*MySkinConfig皮肤配置MOD说明*
+ 皮肤配置MOD适用于往返于多个服务器之间时需要切换皮肤提供源时使用
+ 配置方法:
    配置文件-skins.txt存在于.minecraft/bin文件夹下
    以skinme的配置为例
*

        http://sm.skinme.co/get.php?type=skin&file=%s.png
        http://sm.skinme.co/get.php?type=cloak&file=%s.png

    第一行是皮肤文件的路径 第二行是披风的路径 以%s表示玩家名
    

-----------------------------------

关于服务器
===============
如何进服
---------------
+ 下载客户端
+ 前往[minelogin](http://www.minelogin.com/ml)注册验证
  p.s.你可能会遇到以下两种情况:
  1. 注册时提示用户名已存在 (换一个用户名)
  2. 收不到验证邮件 ()
+ 无论如何请先进一下服务器 否则任何请求不受理
+ 刚进服默认为游客模式 没有任何权限(包括`/login`) 但是请不要着急退出(退出状态下无法被邀请)
+ 服务器施行邀请制度 邀请别人的指令为`/w ID` 进服后请联系周围玩家进行邀请(注意非OP玩家每小时可邀请一次)
+ 正式加入服务器后请先熟悉相关功能 不要着急出去冒险 出生点的牌子请多看看
+ 游戏时请遵守一些基本的游戏道德和服务器的规定

服务器规定
---------------
+ 这是个有爱的服务器 一切行为准则以良心为准 以下是一些性能上的考虑:
+ 占资源的结构因尽量少造 包括但不仅限以下:高频或永动红石电路 大规模饲养场/刷怪塔 高空流水/岩浆
+ 不要利用游戏BUG做任何事

常用指令
---------------
+ `/spawn` 回到出生点
+ `/sethome` 设置家
+ `/home` 回到家
+ `/tpa ID` 传送到名为ID的玩家身边
+ `/tpahere ID` 将名为ID的玩家传送到身边
+ `/jobs help` 查看关于职业的帮助
+ `/bal` 查看当前剩余的金钱
+ `/t ID MSG`向玩家发送私聊信息
+ `/scvron``/scvroff` 开启和关闭死亡不掉落物品



----------------------------------
Copyright 2012 Nekocraft 项目组 本文使用[CC BY-NC-SA 协议](http://creativecommons.org/licenses/by-nc-sa/2.5/cn/)