@ECHO OFF
set TMN_HOME=C:\Localhost\Temenos\R17\Env\Slot01\Products
set JAVA_HOME=C:\Localhost\Temenos\R17\Infra\Java\Default
set TAFJ_HOME=%TMN_HOME%\TAFJ\default
set JBOSS_HOME=C:\Localhost\Temenos\R17\Infra\AppServer\JBoss
set PATH=%JAVA_HOME%\bin;%TAFJ_HOME%\bin;%JBOSS_HOME%\bin;%PATH%
set T24_HOME=C:\Localhost\Temenos\R17\Env\Slot01\Data\T24\UD
@ECHO ON
@ECHO ENV ready with T24_HOME=%T24_HOME%