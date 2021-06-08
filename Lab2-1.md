# Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 AVD
## Lab2-1.建立 Azure VM ADDS
 - 下載 Sigle-ADDS.ps1<br>
	- 此命令會建立規格為 D4sv3 的虛擬機器、虛擬網路、堡壘<br>
 - 使用 Sigle-ADDS.ps1 佈署 Windows ADDS Server <br> 
	- 啟用 CloudShell<br>
    - 輸入`Connect-AzAccount` 登入<br>
	- 上傳 Sigle-ADDS.ps1<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Migrate/blob/master/hyper-v/image/cloudshell-uploadps1.PNG "cloudshell-uploadps1")<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/upload-succsess.png "upload-succsess")<br>
	- 輸入並執行 `./Sigle-ADDS.ps1` <br>
 - 設定虛擬網路DNS 伺服器 ADDS-vnet 指向 172.16.1.4<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds1.png "adds1")<br>
 - 進入虛擬機器設定 Active Directory 網域服務 <br> 
	- 進入 Azure Portal，選擇虛擬機器 ADDS，使用 Bastion 連線 (isadmin/isadmin@123) <br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds2.png "adds2")<br>
	- 開啟伺服器管理員 (Server Manager)，點選 Promote this server to a domain controller<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds3.png "adds3")<br>
	- 點選 Add a new forest，並輸入 Root domain name，此範例先設定 brianhsing.club，後續再做 AAD Connect 時，就不需要再另外設定 UPN 尾碼。<br>
	> **Tips.請不要使用結尾為「.local」的網域，此網域無法在虛擬網路內路由** <br>
	
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds4.png "adds4")<br>
	- 自行輸入 Directory Services Restore Mode 密碼<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds5.png "adds5")<br>
	- DNS Option 直接選擇下一步<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds6.png "adds6")<br>
	- Additional Option 直接選擇下一步，稍後登入會使用 NETBIOS\isadmin 帳號格式<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds7.png "adds7")<br>
	- Path 直接選擇下一步。如果是正式環境，建議將這三個資料夾與系統磁區分開<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds8.png "adds8")<br>
	- Review Option 下一步後，Prerequisites Check 頁面選擇 Install，等待安裝結束後，會自動開機。<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds9.png "adds9")<br>
	- 使用 Bastion 連線 (您設定的NetBios\isadmin / isadmin@123)<br>
	- 開啟 Active Directory Users and Computers <br>
	- 建立組織單位 (organizational unit) AVD<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds10.png "adds10")<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds11.png "adds11")<br>
	- 建立使用者物件 user1、user2、user3<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds12.png "adds12")<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds13.png "adds13")<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds14.png "adds14")<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2/adds15.png "adds15")<br>
	
	完成後，請[前往 Lab2-2](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2-2.md)。<br>