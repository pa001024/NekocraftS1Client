Nekocraft2sX 客户端项目
======================

客户端一服二服通用,进入一服请开启Forge

----------------------
__当前版本标记:B2__

目前进度:
+ 基本功能(原创皮肤MOD)
+ 伪正版登陆
+ 实现可选MOD加载及其UI

未来计划:
+ 原创MOD
+ 原创插件
+ 原创服务端或更加优化的性能
+ 自动更新
+ 游戏内自定义GUI
+ Spoutcraft支持可能

编译:`git archive --format=zip -9 -o pack.zip master` 

-----------------------------------

关于客户端
===============
mod安装
---------------
+ 客户端使用配置文件载入mod,具体配置文件见Launcher.json
    
    {
      "user":"pa001024",
      "password":"******",
      "mods":[
        "ShadersMod.zip",
        "LiteLoader.zip",
        "ZHInput.zip",
        "Font_HKSN_U.zip",
        "OptiFine_HD_U.zip",
        "MySkinConfig.zip",
        "NekoLogin.zip",
        "FML.zip"
      ],
      "extparm":"-Xmx2G -Xincgc"
    }
    
全部MOD可定制,只需按顺序加入mods中即可( __如无特殊需要一般无需修改,将MOD放入mods文件夹即可__ ).

*MySkinConfig皮肤配置MOD说明*
+ 皮肤配置MOD适用于往返于多个服务器之间时需要切换皮肤提供源时使用
+ 配置方法:
    配置文件-skins.txt存在于.minecraft/bin文件夹下
    以nekocraft的配置为例
*

        http://nekocraft.com/mcskin/?p=%s
        http://nekocraft.com/mccloak/?p=%s

    第一行是皮肤文件的路径 第二行是披风的路径 以%s表示玩家名
    

-----------------------------------

关于服务器
===============
如何进服
---------------
+ 下载客户端
+ 前往[Nekocraft](http://nekocraft.com/)注册
  1. 注册后会发一封邮件里面有初始密码,登录后修改即可
  2. 登录后可以上传皮肤和披风.
+ 无论如何请先进一下服务器 否则任何请求不受理
+ 刚进服默认为游客模式 但是请不要着急退出(退出状态下无法被邀请)
+ 服务器施行邀请制度 邀请别人的指令为`/i ID` 进服后请联系周围玩家进行邀请(注意非OP玩家每小时可邀请一次)
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