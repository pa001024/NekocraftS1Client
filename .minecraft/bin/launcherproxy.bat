@echo off
:����JAVA��װ·�� �粻������������JAVA (JRE) ���ֶ�����·��
set appdata=%cd%
cd .minecraft/bin
set javapath=C:\Program Files\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files\Java\jre1.7.0\bin;C:\Program Files\Java\jre6\bin;D:\Program Files\Java\jre7\bin;D:\Program Files (x86)\Java\jre7\bin;D:\Program Files (x86)\Java\jre7\bin;D:\Program Files\Java\jre1.7.0\bin;D:\Program Files\Java\jre6\bin


:��������ƫ�������,������߻����ʲ�����GCƵ��,��֧�ֳ�ʱ���ȶ�����
set basep=-server -XX:LargePageSizeInBytes=128m -Xss256k
:��������󲻾���Survivor����ֱ�ӽ������ϴ�
set basep=%basep% -XX:MaxTenuringThreshold=0
:�����ֶ�����GC�Ĵ���
set basep=%basep% -XX:+DisableExplicitGC
:�������ʹ�ò��л���
set basep=%basep% -XX:+UseParNewGC
:������Eden����С������YGC��ʱ�� 
set basep=%basep% -XX:SurvivorRatio=1
:ʹ��CMS����������,���ͱ��ͣ��,�����ͻ����ٶ�
set basep=%basep% -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly
:CMS��PermGen(������ͷ�����)���л���
set basep=%basep% -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled
:��������������,�������(��ע�ⷴ����ܻᵼ��FULLGC,��������)
:set basep=%basep% -Xnoclassgc
:GCʱѹ���ڴ�,�����ڴ���Ƭ,�ʺϷ�������ʱ������,�Կͻ���Ч��������
set basep=%basep% -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=0
:������ʼ,���ھ�ȷ����,һ��������(Xmx-Xmn)*(100-CMSInitiatingOccupancyFraction)/100>=Xmn
set basep=%basep% -XX:CMSInitiatingOccupancyFraction=80
:��ԭʼ���ͽ��п����Ż�
set basep=%basep% -XX:+UseFastAccessorMethods -XX:SoftRefLRUPolicyMSPerMB=0
:�ӿ����
set basep=%basep% -XX:+AggressiveOpts
:��������������
set basep=%basep% -XX:+UseBiasedLocking

set debugp=-XX:+PrintGC -XX:+PrintGCApplicationConcurrentTime
set debugfullp=-XX:+PrintGCDetails -XX:+PrintClassHistogram -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -XX:+PrintHeapAtGC -Xloggc:GCDetails.log

:����ƫ���ȶ���,����ͨ���������,������ȷ����Ķ�. �ֱ�Ϊ��ʼ�ڴ�,����ڴ�,�Ƕ��ڴ��ʼֵ(������ͷ�����),���ֵ,�������߳���
set litep=-Xms512m -Xmx512m -Xmn192m -XX:PermSize=64m -XX:MaxPermSize=128m -XX:ParallelGCThreads=2 %basep%
set normalp=-Xms2G -Xmx2G -Xmn768m -XX:PermSize=128m -XX:MaxPermSize=256m -XX:ParallelGCThreads=4 %basep%
set fullp=-Xms4G -Xmx4G -Xmn1536m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:ParallelGCThreads=8 %basep%
set studiop=-Xms8G -Xmx8G -Xmn3072m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:ParallelGCThreads=16 %basep%
set centerp=-Xms16G -Xmx16G -Xmn6144m -XX:PermSize=128m -XX:MaxPermSize=512m -XX:ParallelGCThreads=24 %basep%

set litepd=%litep% %debugp%
set normalpd=%normalp% %debugp%
set fullpd=%fullp% %debugp%
set studiopd=%studiop% %debugp%
set centerpd=%centerp% %debugp%

set litepdf=%litep% %debugfullp%
set normalpdf=%normalp% %debugfullp%
set fullpdf=%fullp% %debugfullp%
set studiopdf=%studiop% %debugfullp%
set centerpdf=%centerp% %debugfullp%


set PATH=%SystemRoot%\sysnative;%path%;%javapath%

javaw -cp MagicLauncher.jar -Djava.library.path="./natives" %*