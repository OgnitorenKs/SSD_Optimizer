:: ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
::
::       ██████   ██████   ██    ██ ████ ████████  ██████  ████████  ████████ ██    ██ ██    ██  ██████
::      ██    ██ ██    ██  ███   ██  ██     ██    ██    ██ ██     ██ ██       ███   ██ ██   ██  ██    █
::      ██    ██ ██        ████  ██  ██     ██    ██    ██ ██     ██ ██       ████  ██ ██  ██   ██     
::      ██    ██ ██   ████ ██ ██ ██  ██     ██    ██    ██ ████████  ██████   ██ ██ ██ █████      ██████
::      ██    ██ ██    ██  ██  ████  ██     ██    ██    ██ ██   ██   ██       ██  ████ ██  ██         ██
::      ██    ██ ██    ██  ██   ███  ██     ██    ██    ██ ██    ██  ██       ██   ███ ██   ██  ██    ██
::       ██████   ██████   ██    ██ ████    ██     ██████  ██     ██ ████████ ██    ██ ██    ██  ██████ 
::
::  ► Hazırlayan: Hüseyin UZUNYAYLA / OgnitorenKs
::
::  ► İletişim - Contact;
::  --------------------------------------
::  • Discord: ognitorenks
::  •    Mail: ognitorenks@gmail.com
::  •    Site: https://ognitorenks.blogspot.com
::
:: ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
echo off
chcp 65001 > NUL 2>&1
setlocal enabledelayedexpansion
cls
cd /d "%~dp0"
Call :ABC
title SSD_Optimizer │ ?/13 │ %ABC%
mode con cols=100 lines=30
:: -------------------------------------------------------------
:: Renklendirme
FOR /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E#&echo on&for %%b in (1) do rem"') do (set R=%%b)
:: -------------------------------------------------------------
:: Bilgi alırken boş ekran görünmemesi için
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                            %R%[36m SSD Optimizer %R%[0m
echo.
echo                       %R%[33m████ ████ █   █ ███ █████ ████ ████ ███ █   █ █  █ ████%R%[0m
echo                       %R%[33m█  █ █    ██  █  █    █   █  █ █  █ █   ██  █ █ █  █   %R%[0m
echo                       %R%[33m█  █ █ ██ █ █ █  █    █   █  █ ████ ██  █ █ █ ██   ████%R%[0m
echo                       %R%[33m█  █ █  █ █  ██  █    █   █  █ █ █  █   █  ██ █ █     █%R%[0m
echo                       %R%[33m████ ████ █   █ ███   █   ████ █  █ ███ █   █ █  █ ████%R%[0m
echo.
echo.
echo.
echo.
:: -------------------------------------------------------------
dir /b "%~dp0SSD_Optimizer.CMD" > NUL 2>&1
	if %errorlevel% NEQ 0 (cls&echo.
						   echo ► %R%[91m Dosya adını%R%[37m "SSD_Optimizer.cmd"%R%[91m olarak kayıt ediniz %R%[0m
						   echo.
						   echo ► %R%[91m Save the file name as%R%[37m "SSD_Optimizer.cmd" %R%[0m
						   timeout /t 10 /nobreak >NUL
						   exit
)
:: -------------------------------------------------------------
:: Yönetici yetkisi
reg query "HKU\S-1-5-19" > NUL 2>&1
	if !errorlevel! NEQ 0 (Call :Powershell "Start-Process '%~dp0SSD_Optimizer.CMD' -Verb Runas"&exit)
:: -------------------------------------------------------------
:: Sistem dil entegrasyonu
FOR /F "tokens=6" %%a in ('Dism /Online /Get-intl ^| Find /I "Default system UI language"') do (
	if "%%a" EQU "tr-TR" (set Dil=TR)
	if "%%a" NEQ "tr-TR" (set Dil=EN)
)
:: Varsayılan dili değiştirmek için aşağıdaki "set Dil=" değişkenine istediğiniz dili tanımlayın. Yukarıdaki dilleri seçebilirsiniz. 
:: Ayrıca aşağıdaki yorum satırını bozmayı ihmal etmeyin yani "::" silmeyi unutmayın.
::set Dil=EN
:: -------------------------------------------------------------
:: Eski kalıntıları sil
DEL /F /Q /A "%Temp%\DiskDetail" > NUL 2>&1
:: Güncel disk bilgilerini al
Call :Powershell "Get-PhysicalDisk | Select-Object -Property MediaType,FriendlyName,Size | Format-List" > %Temp%\DiskDetailAll
set Count=0
FOR /F "tokens=3" %%a in ('Findstr /i "MediaType" %Temp%\DiskDetailAll 2^>NUL') do (
	set /a Count+=1
	echo  TYPE_!Count!_^>%%a^> >> %Temp%\DiskDetail
	if %%a EQU SSD (set Target=!Count!)
)
set Count=0
FOR /F "tokens=3" %%a in ('Findstr /i "FriendlyName" %Temp%\DiskDetailAll 2^>NUL') do (
	set /a Count+=1
	echo  Brand_!Count!_^>%%a^> >> %Temp%\DiskDetail
)
set Count=0
FOR /F "tokens=4" %%a in ('Findstr /i "FriendlyName" %Temp%\DiskDetailAll 2^>NUL') do (
	set /a Count+=1
	echo  Model_!Count!_^>%%a^> >> %Temp%\DiskDetail
)
set Count=0
FOR /F "tokens=3" %%a in ('Findstr /i "Size" %Temp%\DiskDetailAll 2^>NUL') do (
	set /a Count+=1
	echo  Boyut_!Count!_^>%%a^> >> %Temp%\DiskDetail
)
:: -------------------------------------------------------------
:: SSD disk verisini kontrol et
Find "SSD" %Temp%\DiskDetailAll > NUL 2>&1
	if %errorlevel% NEQ 0 (goto NSSD)
Call :Dil A 2 Language_%Dil%_2_
Call :Dil B 2 Language_%Dil%_3_
Call :Dil C 2 Language_%Dil%_4_
FOR /F "delims=> tokens=2" %%a in ('Findstr /i "Brand_!Target!_" %Temp%\DiskDetail 2^>NUL') do (
	FOR /F "delims=> tokens=2" %%b in ('Findstr /i "Model_!Target!_" %Temp%\DiskDetail 2^>NUL') do (
		FOR /F "delims=> tokens=2" %%c in ('Findstr /i "Boyut_!Target!_" %Temp%\DiskDetail 2^>NUL') do (
			set Value=%%c
			Call :Uzunluk 1 !Value!
			if !Uzunluk1! EQU 10 (set SSD=•%R%[36m !LA2!:%R%[33m %%a %R%[90m│%R%[36m !LB2!:%R%[33m %%b %R%[90m│%R%[36m !LC2!:%R%[33m !Value:~0,1!%R%[37m GB %R%[0m)
			if !Uzunluk1! EQU 11 (set SSD=•%R%[36m !LA2!:%R%[33m %%a %R%[90m│%R%[36m !LB2!:%R%[33m %%b %R%[90m│%R%[36m !LC2!:%R%[33m !Value:~0,2!%R%[37m GB %R%[0m)
			if !Uzunluk1! EQU 12 (set SSD=•%R%[36m !LA2!:%R%[33m %%a %R%[90m│%R%[36m !LB2!:%R%[33m %%b %R%[90m│%R%[36m !LC2!:%R%[33m !Value:~0,3!%R%[37m GB %R%[0m)
			if !Uzunluk1! EQU 13 (set SSD=•%R%[36m !LA2!:%R%[33m %%a %R%[90m│%R%[36m !LB2!:%R%[33m %%b %R%[90m│%R%[36m !LC2!:%R%[33m !Value:~0,1!%R%[37m TB %R%[0m)
		)
	)
)
goto Optimizer
:: -------------------------------------------------------------
:NSSD
Call :Dil A 2 Language_%Dil%_1_
set SSD=•%R%[91m !LA2! %R%[0m
goto Optimizer

:: ██████████████████████████████████████████████████████████████████
:Optimizer
mode con cols=100 lines=23
FOR %%a in (YD LA LB LT LS) do (set %%a=)
echo ►%R%[93m SSD_Optimizer │ %ABC%%R%[0m
echo !SSD!
Call :Dil A 2 Language_%Dil%_10_
Call :Dil B 2 Language_%Dil%_9_
echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
::echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
echo %R%[92m ♦ %R%[90m= !LA2! │ █ = !LB2!
Call :Dil A 2 Language_%Dil%_11_
Call :Dil B 2 Language_%Dil%_12_
echo %R%[90m !LA2! = E,1,2 │ !LB2! = D,2,5
echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
::echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
set Yuzde_Deger=0
Call :Dil Z 2 Language_%Dil%_5_
Call :Dil Y 2 Language_%Dil%_6_
Call :Dil V 2 Language_%Dil%_7_
FOR /L %%a in (1,1,13) do (
	if %%a EQU 1 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 2 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 3 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 4 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 5 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 6 (Call :Kontrol_%%a "Reg_Query" "Servis_Query"&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 7 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 8 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 9 (Call :Kontrol_%%a Reg_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 10 (Call :Kontrol_%%a&Call :Total 0 "%%a" "Language_Menu_%Dil%_%%a_" "!LV2!")
	if %%a EQU 11 (Call :Kontrol_%%a Servis_Query&Call :Total 0 "%%a" "Language_Menu_%Dil%_%%a_" "!LV2!")
	if %%a EQU 12 (Call :Kontrol_%%a Servis_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
	if %%a EQU 13 (Call :Kontrol_%%a Servis_Query&Call :Total 1 "%%a" "Language_Menu_%Dil%_%%a_" "!LY2!")
)
echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
::echo %R%[90m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬%R%[0m
Call :Dil A 2 Language_%Dil%_8_
set /p Menu=► %R%[92m!LA2! %R%[90m[E,1,2,3,D,6,7,8] = %R%[0m
Call :Upper "%Menu%" "Menu"
Call :Dil T 2 Language_%Dil%_13_
Call :Dil S 2 Language_%Dil%_14_
cls
FOR %%a in (%Menu%) do (Call :Rotasyon "%%a")
Call :Dil A 2 Language_%Dil%_15_
echo.&echo ►%R%[92m !LA2! %R%[0m
timeout /t 2 /nobreak > NUL
goto Optimizer

:: ██████████████████████████████████████████████████████████████████
:__HANGAR__
:Dil
:: Dil verilerini buradan alıyorum. Call komutu ile buraya uygun değerleri gönderiyorum.
:: %~1= Harf │ %~2= tokens değeri │ %~3= Find değeri
set L%~1%~2=
FOR /F "delims=> tokens=%~2" %%g in ('Findstr /i "%~3" %~dp0SSD_Optimizer.CMD 2^>NUL') do (set L%~1%~2=%%g)
goto :eof

:: -------------------------------------------------------------
:Powershell
:: chcp 65001 kullanıldığında Powershell komutları ekranı kompakt görünüme sokuyor. Bunu önlemek için bu bölümde uygun geçişi sağlıyorum.
chcp 437 > NUL 2>&1
Powershell -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -C %*
chcp 65001 > NUL 2>&1
goto :eof

:: -------------------------------------------------------------
:ABC
set ABC=OgnitorenKS
goto :eof 

:: -------------------------------------------------------------
:Uzunluk
:: %~1: Değişken değeri  %~2: Uzunluğu hesaplanacak olan değer
chcp 437 > NUL
FOR /F "tokens=*" %%a in ('Powershell -C "'%~2'.Length"') do (set Uzunluk%~1=%%a)
chcp 65001 > NUL
goto :eof

:: -------------------------------------------------------------
:Upper
:: Bu bölüme yönlendirdiğim kelimeleri büyük harf yaptırıyorum.
chcp 437 > NUL 2>&1
FOR /F %%g in ('Powershell -command "'%~1'.ToUpper()"') do (set %~2=%%g)
chcp 65001 > NUL 2>&1
goto :eof

:: ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
:Total
Call :Dil A 2 %~3
if !Yuzde! EQU %~1 (set /a YD+=1)
title SSD_Optimizer │ !YD!/13 │ %ABC%
if %~2 GTR 9 (echo  %R%[92m%~2%R%[90m- !Check!%R%[33m !LA2! %R%[90m[!LZ2!= %~4]%R%[0m)
if %~2 LEQ 9 (echo  %R%[92m %~2%R%[90m- !Check!%R%[33m !LA2! %R%[90m[!LZ2!= %~4]%R%[0m)
goto :eof

:: -------------------------------------------------------------
:Reg_Query
reg query "%~1" /v "%~2" > NUL 2>&1
	if !errorlevel! NEQ 0 (set Check=%R%[90m█%R%[0m&goto :eof)
set Check=%R%[92m♦%R%[0m
FOR /F "skip=2 tokens=3" %%a in ('reg query "%~1" /v "%~2" 2^>NUL') do (
	if "%~4" NEQ "%%a" (set Yuzde=1&set Check=%R%[90m█%R%[0m)
)
goto :eof

:: -------------------------------------------------------------
:Servis_Query
reg query "HKLM\SYSTEM\CurrentControlSet\Services\%~1" /v "Start" > NUL 2>&1
	if !errorlevel! NEQ 0 (set Yuzde=1&set Check=%R%[90m█%R%[0m)
	if !errorlevel! EQU 0 (FOR /F "skip=2 tokens=3" %%g in ('reg query "HKLM\System\CurrentControlSet\Services\%~1" /v "Start" 2^>NUL') do (
								if %%g NEQ 0x4 (if !Yuzde! EQU 0 (set Check=%R%[92m♦%R%[0m))
								if %%g EQU 0x4 (set Yuzde=1&set Check=%R%[90m█%R%[0m))
						  )
goto :eof

:: -------------------------------------------------------------
:SC
if !Proces! EQU E (sc config %~1 start= %~2 > NUL 2>&1
				   net start %~1 /y > NUL 2>&1
				  )
if !Proces! EQU D (sc config %~1 start= disabled > NUL 2>&1
				   net stop %~1 /y > NUL 2>&1
				  )
goto :eof

:: ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
:Reg_ON
Reg add "%~1" /f /v "%~2" /t "%~3" /d "%~4" > NUL 2>&1
goto :eof

:Reg_OFF
Reg add "%~1" /f /v "%~2" /t "%~3" /d "%~5" > NUL 2>&1
goto :eof

:RegAdd
Reg add "%~1" /f /v "%~2" /t "%~3" /d "%~4" > NUL 2>&1
goto :eof
::
:RegVeAdd
Reg add "%~1" /f /ve /t "%~2" /d "%~3" > NUL 2>&1
goto :eof
::
:RegDel
Reg delete %* /f > NUL 2>&1
goto :eof
:: -------------------------------------------------------------
:Kontrol_1
:: Hazırda beklet kapat
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Power" "HibernateEnabled" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Power" "HibernateEnabledDefault" REG_DWORD 0x1 0x0
goto :eof

:Kontrol_2
:: Zaman damgası
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\FileSystem" "NtfsDisableLastAccessUpdate" REG_DWORD 0x80000002 0x80000001
goto :eof

:Kontrol_3
:: Fastboot
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Power" "HiberbootEnabled" REG_DWORD 0x1 0x0
goto :eof

:Kontrol_4
:: Thumbnail cache
set Yuzde=0
Call :%~1 "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoThumbnailCache" REG_DWORD 0x1 0x0
Call :%~1 "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableThumbnailCache" REG_DWORD 0x1 0x0
Call :%~1 "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "NoThumbnailCache" REG_DWORD 0x1 0x0
Call :%~1 "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisableThumbnailCache" REG_DWORD 0x1 0x0
Call :%~1 "HKCU\Software\Policies\Microsoft\Windows\Explorer" "DisableThumbsDBOnNetworkFolders" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoThumbnailCache" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableThumbnailCache" REG_DWORD 0x1 0x0
goto :eof

:Kontrol_5
:: Windows çekirdeğinin değiştirilmesi │ Aç=0 kapat=1
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" "DisablePagingExecutive" REG_DWORD 0x0 0x1
goto :eof

:Kontrol_6
:: Prefetch │ Aç=1 kapat=0
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" "EnablePrefetcher" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" "EnableSuperFetch" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\Prefetchparameters" "EnableBoottrace" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" "EnableAutoLayout" REG_DWORD 0x1 0x0
Call :%~2 Sysmain Auto
goto :eof

:Kontrol_7
:: Önyükleme dosyalarının birleştirilmesini kapat │ Açmak için "Y" değerini gir
set Yuzde=0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" "Enable" REG_SZ Y N
goto :eof

:Kontrol_8
:: Windows olay günlüğünü kapat │ Aç=1 kapat=0
set Yuzde=0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Wbem\CIMOM" "EnableEvents" REG_DWORD 0x1 0x0
Call :%~1 "HKLM\SOFTWARE\Microsoft\Wbem\CIMOM" "Logging" REG_SZ 0x1 0x0
goto :eof

:Kontrol_9
:: 16-bit Dos uyumluluğu için ad oluşturmayı kapat │ Aç=0 kapat=1
set Yuzde=0
Call :%~1 "HKLM\System\CurrentControlSet\Control\FileSystem" "NtfsDisable8dot3NameCreation" REG_DWORD 0x0 0x1
goto :eof

:Kontrol_10
:: Trim özelliğini aç
set Yuzde=0
Call :RegDel "HKLM\SYSTEM\CurrentControlSet\Policies" /v "DisableDeleteNotification"
set Check=%R%[92m♦%R%[0m
FOR /F "tokens=4" %%a in ('fsutil behavior query disabledeletenotify ^| Find "NTFS DisableDeleteNotify" 2^>NUL') do (
	if %%a EQU 1 (set Yuzde=1&set Check=%R%[90m█%R%[0m)
)
goto :eof

:K_10_
fsutil behavior set DisableDeleteNotify %~1 > NUL 2>&1
goto :eof

:Kontrol_11
set Yuzde=0
Call :%~1 defragsvc Auto
goto :eof

:Kontrol_12
set Yuzde=0
Call :%~1 FontCache Auto
Call :%~1 FontCache3.0.0.0 Demand
goto :eof

:Kontrol_13
set Yuzde=0
Call :%~1 WSearch Auto
goto :eof

:Rotasyon
if %~1 EQU E (set Proces=E&goto :eof)
if %~1 EQU D (set Proces=D&goto :eof)
if %~1 LEQ 9 (if !Proces! EQU E (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LT2!%R%[0m&Call :Kontrol_%~1 "Reg_ON" "SC")
			  if !Proces! EQU D (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LS2!%R%[0m&Call :Kontrol_%~1 "Reg_OFF" "SC")
		     )
if %~1 EQU 10 (if !Proces! EQU E (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LT2!%R%[0m&Call :K_10_ 0)
			   if !Proces! EQU D (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LS2!%R%[0m&Call :K_10_ 1)
			  )
if %~1 GEQ 11 (if !Proces! EQU E (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LT2!%R%[0m&Call :Kontrol_%~1 SC)
			   if !Proces! EQU D (Call :Dil A 2 Language_Menu_%Dil%_%~1_&echo •%R%[36m !LA2!%R%[37m !LS2!%R%[0m&Call :Kontrol_%~1 SC)
			  )
goto :eof

:: ██████████████████████████████████████████████████████████████████
:__DİL_HANGAR__
:Turkish
Language_TR_1_>SSD bulunamadı>
Language_TR_2_>Marka>
Language_TR_3_>Model>
Language_TR_4_>Boyut>
Language_TR_5_>Tavsiye>
Language_TR_6_>Kapat>
Language_TR_7_>Aç>
Language_TR_8_>Çoklu seçim>
Language_TR_9_>Kapalı>
Language_TR_10_>Açık>
Language_TR_11_>Açmak için>
Language_TR_12_>Kapatmak için>
Language_TR_13_>açılıyor>
Language_TR_14_>kapatılıyor>
Language_TR_15_>İşlem tamamlandı>
Language_Menu_TR_1_>Hazırda beklet>
Language_Menu_TR_2_>Zaman damgası>
Language_Menu_TR_3_>Hızlı başlat>
Language_Menu_TR_4_>Küçük resim önbelliği>
Language_Menu_TR_5_>Ram bellekleme>
Language_Menu_TR_6_>Hızlı getir [Prefetch]>
Language_Menu_TR_7_>Önyükleme dosya birleşimi>
Language_Menu_TR_8_>Windows olay günlüğü>
Language_Menu_TR_9_>Kısa adlar [8dot3]>
Language_Menu_TR_10_>Trim>
Language_Menu_TR_11_>Disk birleştirme>
Language_Menu_TR_12_>Yazı tipi önbelleği>
Language_Menu_TR_13_>Windows Arama>
:English
Language_EN_1_>SSD not found>
Language_EN_2_>Brand>
Language_EN_3_>Model>
Language_EN_4_>Size>
Language_EN_5_>Recommendation>
Language_EN_6_>Close>
Language_EN_7_>Open>
Language_EN_8_>Multiple selection>
Language_EN_9_>Closed>
Language_EN_10_>Open>
Language_EN_11_>To open>
Language_EN_12_>To close>
Language_EN_13_>Opening>
Language_EN_14_>shutting down>
Language_EN_15_>Process completed>
Language_Menu_EN_1_>Hibernate>
Language_Menu_EN_2_>Time stamp>
Language_Menu_EN_3_>Fast boot>
Language_Menu_EN_4_>Thumbnail cache>
Language_Menu_EN_5_>Ram caching>
Language_Menu_EN_6_>Prefetch>
Language_Menu_EN_7_>Boot file defragmentation>
Language_Menu_EN_8_>Windows event log>
Language_Menu_EN_9_>Short names [8dot3]>
Language_Menu_EN_10_>Trim>
Language_Menu_EN_11_>Disk defragmentation>
Language_Menu_EN_12_>Font cache>
Language_Menu_EN_13_>Windows Search>