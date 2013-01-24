@echo OFF & MODE CON COLS=49 LINES=13 & title Nekocraft Launcher & COLOR 5F
:这是运行jar文件名(游戏版本)
set jar=minecraft_147_original.jar

:这是MOD载入列表(如手写顺序请正确,自行添加MOD文件名请勿带空格) 其他设置: _lite.txt  _hd.txt  _cjb.txt  _normal.txt
set modl=_normal.txt

:这是JAVA安装路径 如不能运行请下载JAVA (JRE) 并手动设置路径
set javapath=C:\Program Files\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files\Java\jre1.7.0\bin;C:\Program Files\Java\jre6\bin

set login=
:cscript nauth.js
:cscript ml.vbs %name% %pwd%

:init
set APPDATA=%cd%
set path=%path%;%javapath%
set javaname=cscript hrun.wsh.js javaw
call :readconf
call :banner
SET /P name=^>^>
IF /I '%name%'=='mem' call :setms & call :setmx & call :rstname & call :saveconf & goto init 
IF /I '%name%'=='pwd' call :setpwd & call :rstname & call :saveconf
IF /I '%name%'=='.' set javaname=start java
IF /I '%name%'=='' IF /I '%tmpname%'=='' goto init
call :saveconf
call :rungame
exit

:rungame
cd .\.minecraft\bin

:登录
IF /I '%login%' NEQ '' start %login%

:载入MOD
for /f "tokens=1,2" %%a in (.\injarmods\%modl%) do (
call :c %%a
)
:启动游戏
%javaname% -cp MagicLauncher.jar -Xms%min%m -Xmx%max%m -Xincgc -Dsun.java2d.noddraw=true -Dsun.java2d.pmoffscreen=false -Dsun.java2d.d3d=false -Dsun.java2d.opengl=false -Djava.library.path=".\natives" magic.launcher.Launcher -lcp="%mods%;%jar%;jinput.jar;lwjgl.jar;lwjgl_util.jar" "%name%" -
cd ..\..
cls 
echo =======   Here   ========
echo %mods% 
echo Mods Loaded.
echo Wait for 3 second to exit.

ping 127.0.0.1 -n 2 >nul 2>nul
echo .
ping 127.0.0.1 -n 2 >nul 2>nul
echo .
ping 127.0.0.1 -n 2 >nul 2>nul

exit
goto e


:banner
cls
echo ===============================================
echo ==                                           ==
echo ==             ~~ NekoCraft!~~               ==
echo ==             %version%               ==
echo ==                                           ==
echo             内存限制 %min%MB-%max%MB
echo ==    *修改内存输入mem 修改登录密码输入pwd   ==
echo ==                                           ==
IF /I '%name%'=='' (
echo ==        [首次启动]输入名字后按回车:        ==
) ELSE (
echo    输入名字修改或按回车使用默认名字:%name%
)
echo ==                                           ==
echo ===============================================
goto e

:setpwd
cls
echo ===============================================
echo ==                                           ==
echo ==             ~~ NekoCraft!~~               ==
echo ==             %version%               ==
echo ==                                           ==
echo ==          使用MineLogin登录协议            ==
echo ==   *注册请前往http://www.minecraft.com/ml  ==
echo ==       *注意:不注册将无法进入游戏!!!       ==
echo ==                                           ==
echo ==      [自动登录设置]输入密码后按回车:      ==
echo ==                                           ==
echo ===============================================
SET /P pwd=^>^>
goto e

:setms
cls
echo ===============================================
echo ==                                           ==
echo ==             ~~ NekoCraft!~~               ==
echo ==             %version%               ==
echo ==                                           ==
echo ==              修改内存起始值               ==
echo ==           请输入一个数字(单位:MB)         ==
echo ==                                           ==
echo ==        (注:32位系统请不要超过1433)        ==
echo ==                                           ==
echo ===============================================
SET /P min=^>^>
goto e

:setmx
cls
echo ===============================================
echo ==                                           ==
echo ==             ~~ NekoCraft!~~               ==
echo ==             %version%               ==
echo ==                                           ==
echo ==              修改内存最大值               ==
echo ==           请输入一个数字(单位:MB)         ==
echo ==                                           ==
echo ==        (注:32位系统请不要超过1433)        ==
echo ==                                           ==
echo ===============================================
SET /P max=^>^>
goto e

:readconf
SET version=Launcher bat R4
for /f "tokens=1,2 delims==" %%a in (.\.minecraft\Launcher.ini) do (
if %%a==name set name=%%b
if %%a==min set min=%%b
if %%a==max set max=%%b
if %%a==pwd set pwd=%%b
)
IF /I '%min%'=='' set min=512
IF /I '%max%'=='' set max=512
set lastname=%name%
goto e

:rstname
set name=%lastname%

:saveconf
echo version=%version%>"%CD%\.minecraft\Launcher.ini"&echo name=%name%>>"%CD%\.minecraft\Launcher.ini"&echo min=%min%>>"%CD%\.minecraft\Launcher.ini"&echo max=%max%>>"%CD%\.minecraft\Launcher.ini"&echo pwd=%pwd%>>"%CD%\.minecraft\Launcher.ini"
goto e

:c
set t=%1
set mods=injarmods\%t%;%mods%
goto e

:e