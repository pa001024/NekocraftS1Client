@echo OFF & MODE CON COLS=49 LINES=13 & title Nekocraft Launcher & COLOR 5F
:��������jar�ļ���(��Ϸ�汾)
set jar=minecraft_147_original.jar

:����MOD�����б�(����д˳������ȷ,�������MOD�ļ���������ո�) ��������: _lite.txt  _hd.txt  _cjb.txt  _normal.txt
set modl=_normal.txt

:����JAVA��װ·�� �粻������������JAVA (JRE) ���ֶ�����·��
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

:��¼
IF /I '%login%' NEQ '' start %login%

:����MOD
for /f "tokens=1,2" %%a in (.\injarmods\%modl%) do (
call :c %%a
)
:������Ϸ
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
echo             �ڴ����� %min%MB-%max%MB
echo ==    *�޸��ڴ�����mem �޸ĵ�¼��������pwd   ==
echo ==                                           ==
IF /I '%name%'=='' (
echo ==        [�״�����]�������ֺ󰴻س�:        ==
) ELSE (
echo    ���������޸Ļ򰴻س�ʹ��Ĭ������:%name%
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
echo ==          ʹ��MineLogin��¼Э��            ==
echo ==   *ע����ǰ��http://www.minecraft.com/ml  ==
echo ==       *ע��:��ע�Ὣ�޷�������Ϸ!!!       ==
echo ==                                           ==
echo ==      [�Զ���¼����]��������󰴻س�:      ==
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
echo ==              �޸��ڴ���ʼֵ               ==
echo ==           ������һ������(��λ:MB)         ==
echo ==                                           ==
echo ==        (ע:32λϵͳ�벻Ҫ����1433)        ==
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
echo ==              �޸��ڴ����ֵ               ==
echo ==           ������һ������(��λ:MB)         ==
echo ==                                           ==
echo ==        (ע:32λϵͳ�벻Ҫ����1433)        ==
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