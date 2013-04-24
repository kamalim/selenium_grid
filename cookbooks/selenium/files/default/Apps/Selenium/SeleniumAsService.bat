set SELENIUM_PATH=C:\Apps\Selenium
set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_17\bin
"%SELENIUM_PATH%\instsrv.exe" Selenium "%SELENIUM_PATH%\srvany.exe"
instsrv.exe Selenium srvany.exe
reg add HKLM\SYSTEM\CurrentControlSet\Services\Selenium\Parameters /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\Selenium\Parameters /v Application /d "%JAVA_HOME%\java.exe" /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\Selenium\Parameters /v AppParameters /d "-jar %SELENIUM_PATH%\selenium-server.jar -role node -nodeConfig %SELENIUM_PATH%\winnodeconfig.json --Dwebdriver.ie.driver=C:\bin\IEDriverServer.exe --Dwebdriver.chrome.driver=C:\bin\chromedriver.exe" /f
net start Selenium