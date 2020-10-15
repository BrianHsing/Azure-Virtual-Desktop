# Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 WVD
## Lab2-3.建立 Azure Files 並啟用 Active Directory 驗證

 - 到 Azure 入口網站中，在搜尋列搜尋儲存體帳戶，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage1.png "storage1")<br>
 - 點選「新增」<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage2.png "storage2")<br>
 - 基本的頁籤中，選擇與 Azure AD Domain Services 同樣的訂用帳戶與資源群組，輸入自定義的儲存體帳戶名稱，請注意，請使用小寫與數字且不能重複的名稱。此範例區域選擇東亞，此儲存體是要作為儲存體的容器，所以效能選擇進階，帳戶種類選擇 FileStorage，複寫可以依照情境需求選擇。<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage3.png "storage3")<br>
 - 網路的頁籤中，選擇公用端點(所有網路)。如果您有比較嚴謹的存取控管，您可以選擇公用端點，只允許您指定的虛擬網路中的流量存取。這一步，請直接點選下方「檢閱+建立」，完成儲存體帳戶的建立<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage4.png "storage4")<br>
 - 開啟 IE 瀏覽器，輸入 https://github.com/Azure-Samples/azure-files-samples/releases 後下載最新版本 AzFilesHybrid.zip，下載後解壓縮<br>
 - 重新回到虛擬機器的頁面，開啟 Powershell ISE<br>
 - 輸入`Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Currentuser`，跳出確認視窗，請選擇 「Yes to All」<br>
 - Powershell ISE 中的路徑移動至完成解壓縮的 AzFilesHybrid 資料夾路徑<br>
 - 輸入以下指令後，後續跳出的視窗請依序按下「Run once」、「Run once」、「Yes to All」<br>
	```
	.\CopyToPSPath.ps1
	Import-Module -name AzFilesHybrid
	``` 
 - 完成後會提示您重新啟動 Powershell ISE，請關閉後重新啟動，開啟後需要重複做一次一樣的動作<br>
 - Powershell ISE 中的路徑移動至完成解壓縮的 AzFilesHybrid 資料夾路徑<br>
 - 輸入以下指令後，後續跳出的視窗請依序按下「Run once」、「Run once」、「Yes to All」<br>
	```
	.\CopyToPSPath.ps1
	Import-Module -name AzFilesHybrid
	``` 
 - 完成後請輸入`Connect-AzAccount`，輸入您具有 Azure AD Global admin 權限的管理者帳號密碼<br>
 - 請輸入以下指令，其中 resourceGroup、OU、StorageAccountName，會替換成您實際使用的名稱<br>
   	```
	$resourceGroup = 'ADDS'
	$OU = 'WVD'
	$StorageAccountName = 'stor1015'

	join-AzStorageAccountForAuth -ResourceGroupName $resourceGroup `
                             -Name $StorageAccountName `
                             -DomainAccountType "ComputerAccount" `
                             -OrganizationalUnitName $OU
	``` 