rem -*- coding:gbk; mode:batch -*-
@echo off
cls

rem brief : install you-get & python on windows
rem author : gongqijian@gmail.com
rem date : 2013/03/04

rem ===========================================================

set ygroot=%~dp0
set ygroot=%ygroot:~0,-1%
set ygsrc=%ygroot%\you-get

set pyver=3.3.0
set pymsi=python-%pyver%.msi
set pydir=C:\Python33

rem ===========================================================

if /i "%PROCESSOR_IDENTIFIER:~0,3%" NEQ "X86" pymsi=python-%pyver%.amd64.msi

if not exist %pydir% (
    if not exist %pymsi% (
        wget.exe -c http://www.python.org/ftp/python/%pyver%/%pymsi%
	)
	echo 正在安装，请稍候。。。 && msiexec.exe /i %pymsi% /qn
)

if not exist %ygsrc% (
    if not exist you-get.zip (
        wget.exe -O you-get.zip https://github.com/soimort/you-get/archive/master.zip
	)
	7za.exe x you-get.zip -o"%ygsrc%"
)

if not exist get.cmd echo python you-get/you-get-master/you-get %%*>get.cmd

rem ===========================================================

set PATH=%PATH%;%pydir%;%ygsrc%/you-get-master

cls
color 27

echo usage:
echo.
echo    get [url]
echo.
echo example:
echo.
echo    get www.youtube.com/watch?v=jNQXAC9IVRw
echo.
echo * 注意看上边的例子！
echo * 付费视频下载不了！
echo * 粘帖请使用鼠标右键，忘了 ctrl + v 吧。
echo * 终止下载请按 ctrl + c 键，或直接叉掉窗口。
echo * 如何卸载？删除 %pydir% 目录即可，安全无毒副作用。

cmd /k "cd %ygroot%"
