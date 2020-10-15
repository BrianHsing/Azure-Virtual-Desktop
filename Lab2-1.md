# Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 WVD
## Lab2-1.建立 Azure VM ADDS
 - 下載 Sigle-ADDS.ps1<br>
	- 此命令會建立 D4sv3 的虛擬機器、虛擬網路、堡壘<br>
 - 使用 Sigle-ADDS.ps1 佈署 Windows ADDS Server <br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Sigle-ADDS.ps1<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/cloudshell-uploadps1.PNG "cloudshell-uploadps1")<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/upload-succsess.png "upload-succsess")<br>
	- 輸入並執行 `./Sigle-ADDS.ps1` <br>
 - 設定虛擬網路DNS 伺服器 ADDS-vnet 指向 172.16.1.4<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/adds1.png "adds1")<br>
 - 進入虛擬機器設定 Active Directory 網域服務 <br> 
	- 進入 Azure Portal，選擇虛擬機器 ADDS，使用 Bastion 連線 (isadmin/isadmin@123) <br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/adds2.png "adds2")<br>
	- 開啟伺服器管理員 (Server Manager)，點選 Promote this server to a domain controller<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/adds3.png "adds3")<br>
	- 點選 Add a new forest，並輸入 Root domain name，此範例先設定 brianhsing.club，後續再做 AAD Connect 時，就不需要再另外設定 UPN 尾碼。<br>
	> **Tips.請不要使用結尾為「.local」的網域，此網域無法在虛擬網路內路由** <br>
	
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/adds4.png "adds4")<br>

