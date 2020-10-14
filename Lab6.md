# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab6.設定 FSLogix 使用者設定檔

 - 點選資源群組 HostPool，選擇其中一台虛擬機器 win10-0<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/upd1.png "upd1")<br>
 - 點選連接，使用 Bastion 連線，點選使用堡壘。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/upd2.png "upd2")<br>
 - 使用 AAD DC Administrators 管理群組內的帳號登入，填入後按下連線。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/upd3.png "upd3")<br>
 - 登入後，開啟瀏覽器，輸入https://aka.ms/fslogix_download，下載至桌面後，解壓縮。<br>
 - 點選您剛解壓縮的資料夾，點選 x64 資料夾後，點選 Release 資料夾，點選執行 FSLogixAppSetup.exe<br>
 - 勾選 I agree to the license terms and conditions，選擇 Install，安裝完成後點選 Close。<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/upd4.png "upd4")<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/upd5.png "upd5")<br>
 - 使用系統管理員身分執行 Powershell，此區指令分別設定以下資訊：<br>
	- 設定檔容器路徑，可參考 Lab1-3、Lab2-3、Lab3-1<br>
	- 在登錄檔指定路徑建立機碼<br>
	- 啟用設定檔容器<br>
	- 指定 VHD 儲存讀取路徑<br>
	- 指定
	```
	$FSShare = "設定檔容器路徑"
	New-Item -Path HKLM:\SOFTWARE\FSLogix\Profiles
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name Enabled -PropertyType DWORD -Value 1
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name VHDLocations -PropertyType MultiString -Value $FSShare
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name SizeInMBs -PropertyType DWORD -Value 100000
	```
 - 
 完成後，請[前往 Lab7](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab7.md)。<br>