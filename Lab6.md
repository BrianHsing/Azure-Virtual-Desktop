# 使用 Azure AD Domain Services 搭配 Azure Files 建立 AVD

## Lab6.設定 FSLogix 使用者設定檔

 - 點選資源群組 HostPool，選擇其中一台虛擬機器 win10-0<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd1.png "upd1")<br>
 - 點選連接，使用 Bastion 連線，點選使用堡壘。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd2.png "upd2")<br>
 - 使用 AAD DC Administrators 管理群組內的帳號登入，填入後按下連線。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd3.png "upd3")<br>
 - 登入後，開啟瀏覽器，輸入https://aka.ms/fslogix_download，下載至桌面後，解壓縮。<br>
 - 點選您剛解壓縮的資料夾，點選 x64 資料夾後，點選 Release 資料夾，點選執行 FSLogixAppSetup.exe<br>
 - 勾選 I agree to the license terms and conditions，選擇 Install，安裝完成後點選 Close。<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd4.png "upd4")<br>
 > **Tips.如果您使用的作業系統為 Windows 10 Enterprise 20H2 版本，內建 FSLogix 安裝程式，不需要再安裝，可以略過上述步驟。** <br>
 
 - (GPO)使用群組原則自動套用至虛擬主機
    - 開啟您稍早解壓縮的資料夾，會看到兩個檔案 fslogix.adml、fslogix.admx<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/gpofslogix1.PNG "gpofslogix1")<br>
    - 複製 fslogix.adml 到您的 ADDS Server 或運作群組原則服務的 Server 資料夾路徑C:\Windows\PolicyDefinitions\en-US <br>
    - 複製 fslogix.admx 至同上環境，資料夾路徑 C:\Windows\PolicyDefinitions <br>
    - 開啟群組原則管理編輯器，點選電腦管理，展開原則、展開系統管理範本、FSLogix、Profile Containers
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/gpofslogix2.PNG "gpofslogix2")<br>
	- 啟用 FSLogix Profile<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/gpofslogix3.PNG "gpofslogix3")<br>
	- 設定 Profile Container Size，建議最小設定 30 GB<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/gpofslogix4.PNG "gpofslogix4")<br>
	- 設定使用者設定檔儲存路徑
	- ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/gpofslogix5.PNG "gpofslogix5")<br>
 
 - (手動)使用系統管理員身分執行 Powershell ISE，此區指令分別設定以下資訊：<br>
	- 設定檔容器路徑，可參考 Lab1-3、Lab2-3、Lab3-1<br>
	- 在登錄檔指定路徑建立機碼<br>
	- 啟用設定檔容器<br>
	- 指定 VHD 儲存讀取路徑<br>
	- 指定每個使用者設定檔容量上限 10G<br>
	```
	$FSShare = "設定檔容器路徑"
	New-Item -Path HKLM:\SOFTWARE\FSLogix\Profiles
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name Enabled -PropertyType DWORD -Value 1
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name VHDLocations -PropertyType MultiString -Value $FSShare
	New-ItemProperty -Path HKLM:\SOFTWARE\FSLogix\Profiles -Name SizeInMBs -PropertyType DWORD -Value 100000
	```
	![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd6.png "upd6")<br>
 - 當您完成 [Lab9](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab9.md) 時，您可以在完成設定的虛擬主機中，看到使用者設定檔已成功被掛載。<br>
 	![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/upd7.png "upd7")<br>

 > **Tips.每台虛擬主機均需要做此步驟，您可以透過 GPO、Golden Image 的方式快速部署** <br>
 
 完成後，請[前往 Lab7](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab7.md)。<br>