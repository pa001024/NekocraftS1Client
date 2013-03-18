@echo off
:这是JAVA安装路径 如不能运行请下载JAVA (JRE) 并手动设置路径
set appdata=%cd%
cd .minecraft/bin
set javapath=C:\Program Files\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files (x86)\Java\jre7\bin;C:\Program Files\Java\jre1.7.0\bin;C:\Program Files\Java\jre6\bin;D:\Program Files\Java\jre7\bin;D:\Program Files (x86)\Java\jre7\bin;D:\Program Files (x86)\Java\jre7\bin;D:\Program Files\Java\jre1.7.0\bin;D:\Program Files\Java\jre6\bin


:下列设置偏向服务器,尽量提高回收率并降低GC频率,以支持长时间稳定运行
set basep=-server -XX:LargePageSizeInBytes=128m -Xss256k
:年轻代对象不经过Survivor区，直接进入年老代
set basep=%basep% -XX:MaxTenuringThreshold=0
:忽略手动调用GC的代码
set basep=%basep% -XX:+DisableExplicitGC
:对年轻代使用并行回收
set basep=%basep% -XX:+UseParNewGC
:降低了Eden区大小，降低YGC的时间 
set basep=%basep% -XX:SurvivorRatio=1
:使用CMS并发回收器,降低标记停顿,并降低回收速度
set basep=%basep% -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly
:CMS对PermGen(储存类和方法等)进行回收
set basep=%basep% -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled
:禁用类垃圾回收,提高性能(请注意反射可能会导致FULLGC,酌情启用)
:set basep=%basep% -Xnoclassgc
:GC时压缩内存,减少内存碎片,适合服务器长时间运行,对客户端效果不明显
set basep=%basep% -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=0
:回收起始,属于精确参数,一般需满足(Xmx-Xmn)*(100-CMSInitiatingOccupancyFraction)/100>=Xmn
set basep=%basep% -XX:CMSInitiatingOccupancyFraction=80
:对原始类型进行快速优化
set basep=%basep% -XX:+UseFastAccessorMethods -XX:SoftRefLRUPolicyMSPerMB=0
:加快编译
set basep=%basep% -XX:+AggressiveOpts
:改善锁机制性能
set basep=%basep% -XX:+UseBiasedLocking

set debugp=-XX:+PrintGC -XX:+PrintGCApplicationConcurrentTime
set debugfullp=-XX:+PrintGCDetails -XX:+PrintClassHistogram -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -XX:+PrintHeapAtGC -Xloggc:GCDetails.log

:设置偏向稳定性,与下通用设置配合,参数精确请勿改动. 分别为起始内存,最大内存,非堆内存初始值(储存类和方法等),最大值,回收器线程数
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