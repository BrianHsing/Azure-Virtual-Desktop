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
 - 設定 Virtual Network DNS 伺服器
 - 設定客體虛擬機器的 ADDS <br> 
	- 進入 Azure Portal，選擇虛擬機器 ADDS，使用 Bastion 連線 (isadmin/isadmin@123) <br>
	- 