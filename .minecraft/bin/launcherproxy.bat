@echo off
:����JAVA��װ·�� �粻������������JAVA (JRE) ���ֶ�����·��
set appdata=%cd%
cd .minecraft/bin
set javapath=C:\Program Files\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files\Java\jre1.7.0\bin;C:\Program Files\Java\jre6\bin

set PATH=%SystemRoot%\sysnative;%path%;%javapath%

javaw -cp MagicLauncher.jar -Djava.library.path="./natives" %*