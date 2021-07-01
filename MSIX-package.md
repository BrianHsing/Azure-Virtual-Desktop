# MSIX 應用程式連接

## 了解什麼是 MSIX？ 
 MSIX 是一種 Windows 應用程式套件格式，可為所有 Windows 應用程式提供新式封裝體驗。MSIX 套件格式除了支援對 Win32、WPF 和 Windows Forms 應用程式的新式封裝和部署功能，也保留了現有應用程式套件和安裝檔案的功能。<br>

 MSIX 主要提供了三個重要功能：<br>
 1.提供了可靠的安裝，在保證解除安裝的情況下，進行數百萬次安裝，成功率為 99.96％。<br>
 2.透過只下載 64k 區塊，減少對網路頻寬的影響。<br>
 3.應用程式之間不會有重複的檔案，而且 Windows 可跨應用程式管理共用檔案。<br>
 
 透過 MSIX，使用檔案系統和登錄虛擬化進行隔離，應用程式會寫入至自己的虛擬登錄和應用程式資料檔案夾，並在解除安裝或重設應用程式時刪除此資料，利用 MSIX 應用程式容器化與 FSLogix 使用者設定檔容器化幫助 WVD 達到完全的動態環境。<br>

[更深入了解什麼是 MSIX？](https://docs.microsoft.com/zh-tw/windows/msix/overview)<br>
[了解您的安裝程式](https://docs.microsoft.com/zh-tw/windows/msix/packaging-tool/know-your-installer)<br>
## 設定 MSIX 應用程式連接的準備工作
 - 在 Azure 入口網站建立版本為 Windows 10 enterprise multi-session version 2004 的虛擬機器，並[下載 MSIX 封裝工具](https://www.microsoft.com/en-us/p/msix-packaging-tool/9n5lw3jbcxkf)<br>
 - 準備需要進行轉換 MSIX 套件的應用程式，此範例使用 [Notepad++](https://notepad-plus-plus.org/downloads/v7.8.8/)，請下載至桌面<br>
## 建立套件簽署的憑證
 -連入到您剛建立的虛擬機器，本文章會建立自我簽署憑證用於簽署 MSIX 套件<br>
 - 開啟以系統管理員權限執行的 PowerShell<br>
 - 使用 New-SelfSignedCertificate 來建立憑證<br>
   - Subject 為您自訂的主體名稱，此範例設定為「CN=brianhsing,C=TW」，您可以替換為自定義的<br>
   - KeyUsage 定義憑證的用途，參數應設定為 DigitalSignature<br>
   - CertStoreLocation 將會指定位置新增至本機憑證存放區中<br>
   - TextExtension 此延伸模組表示可能會使用已認證公開金鑰的其他用途，自我簽署憑證應包含副檔名字串 "2.5.29.37 = {text} 1.3.6.1.5.5.7.3.3"，這表示憑證將用於程式碼簽署。另外擴充字串 "2.5.29.19 = {text}"，這表示憑證是 (不是 CA) 的終端實體。<br>
   ```
   New-SelfSignedCertificate -Type Custom -Subject "CN=brianhsing,C=TW" -KeyUsage DigitalSignature -FriendlyName "brianhsing" -CertStoreLocation "Cert:\CurrentUser\My" -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
   ```
 - 檢視您的憑證，這會顯示出您本機存放區中的所有憑證，參數 Thumbprint 稍後會使用到<br>
   ```
   Set-Location Cert:\CurrentUser\My
   Get-ChildItem | Format-Table Subject, FriendlyName, Thumbprint
   ```
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/cert1.png "cert1")
 - 匯出使用密碼保護的憑證
   - 填入您自定義的密碼到此區塊 <Your Password><br>
   - 將剛顯示的參數 Thumbprint 填入 <Certificate Thumbprint><br>
   - FilePath 此參數指定您的匯出檔案的路徑，此範例可以從 C 磁碟找到 MSIXssc.pfx<br>
   ```
   $password = ConvertTo-SecureString -String <Your Password> -Force -AsPlainText 
   Export-PfxCertificate -cert "Cert:\CurrentUser\My\<Certificate Thumbprint>" -FilePath C:\MSIXssc.pfx -Password $password
   ```
   原文說明請參考 https://docs.microsoft.com/zh-tw/windows/msix/package/create-certificate-package-signing<br>
## 使用群組原則將憑證散發到工作階段主機
 - 在您的網域控制站上啟動「群組原則管理」<br>
 - 尋找現有的群組原則物件，或是用於測試您可以直接選擇「Defult Domain Policy」，按下右鍵點選編輯<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/cert2.png "cert2")
 - 依據展開「電腦設定原則」、「Windows 設定」、「安全性設定」、「公開金鑰原則」，找到「信任的根憑證授權」按下滑鼠右鍵，點選匯入<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/cert3.png "cert3")
 - 請將憑證 MSIXssc.pfx 按照步驟匯入<br>
 - 完成後請開啟命令提示字元，輸入`gpupdate /force`<br>
## 將傳統應用程式轉換成 MSIX 套件
 - 開啟 MSIX Packaging Tool，點選 Application Package<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package1.png "package1")<br>
 - 選取「在這部電腦上建立套件」，按下一步<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package2.png "package2")<br>
 - 等待準備電腦頁面檢查，完成準備電腦後，按下一步<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package3.png "package3")<br>
 - 選擇您剛下載的安裝程式，此範例的安裝程式使用 npp.7.8.8.Installer。憑證請選擇您剛剛建立的自我簽署憑證<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package4.png "package4")<br>
 - 分別填入必要資訊套件名稱、套件顯示名稱、發行者顯示名稱、版本<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package5.png "package5")<br>
 - 工具監視和抓取應用程式安裝作業的安裝階段，此工具將會在先前指定的環境中啟動安裝程式，而您必須透過安裝程式嚮導來安裝應用程式，如果您的 安裝程式需要重新啟動，您可以執行手動重新開機，或使用「重新開機」按鈕來執行重新開機，而在重新開機後，您會回到轉換程式中的這個點，完成應用程式安裝時，請按下一步<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package6.png "package6")<br>
 - 點選下一步會出現提示視窗，請點選「Yes, move on」<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package7.png "package7")<br>
 - 此頁面會顯示轉換包含服務的安裝程式服務報告，此範例不會有任何顯示，請點選下一步<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package8.png "package8")<br>
 - 此步驟您需要選擇要將此套件建立在哪個位置，並點選建立，成功建立後點選關閉即可<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package9.png "package9")<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package10.png "package10")<br>
 - 桌面會出現您封裝好的 MSIX 套件，此範例檔名為「notepad_1.0.0.0_x64__78b8wv0dmcrmj」<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/package11.png "package11")<br>
 - 稍後請將此檔案「notepad_1.0.0.0_x64__78b8wv0dmcrmj」移動至 C 磁碟下的 MSIX 資料夾<br>
## 產生適用於 MSIX 的 VHD
 - 在 C 磁碟建立 MSIX 資料夾，[下載 msixmgr 工具](https://aka.ms/msixmgr)，並將 .zip 解壓縮至 MSIX 資料夾<br>
 - 因為等等用到的指令會需要安裝 Hyper-V 功能，以系統管理員身分開啟 Powershell 輸入以下指令後，重新開機<br>
   `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
 - 以系統管理員身分開啟 Powershell 產生適用於 MSIX 的 VHD<br>
   ```
   # 定義您的 VHD 名稱
   $App = 'Notepad'
   # 建立一個 50 MB 的動態 VHD，建立在指定位置，請確定 VHD 夠大，足以持有解壓的 MSIX
   New-VHD -SizeBytes 50MB -Path C:\msix\msixmgr\$App.vhd -Dynamic -Confirm:$false
   # 掛載新建立的 VHD
   $vhdObject = Mount-VHD C:\msix\msixmgr\$App.vhd -Passthru
   # 初始化 VHD
   $disk = Initialize-Disk -Passthru -Number $vhdObject.Number
   # 建立新的磁碟分割，您可能會看到需要請您格式化的訊息，如果您已經照著執行格式化，您就不需要在執行下一個命令
   $partition = New-Partition -AssignDriveLetter -UseMaximumSize -DiskNumber $disk.Number
   # 格式化磁碟分割
   Format-Volume -FileSystem NTFS -Confirm:$false -DriveLetter $partition.DriveLetter -Force
   ```
 - 更改您新建的 VHD 磁碟代號為 x <br>
 - 繼續使用 Powershell 執行以下命令將 MSIX 套件解壓縮至您剛新建好的 VHD<br>
   ```
   # 將 MSIX 套件解壓縮至您建立並掛載的 VHD
   & 'C:\msix\msixmgr\x64\msixmgr.exe' -Unpack -packagePath 'C:\msix\notepad_1.0.0.0_x64__78b8wv0dmcrmj.msix' -destination 'X:\notepad++' -applyacls
   # 抓取磁碟區 GUID 稍後會用到
   $volumeGuid = (((Get-Volume -DriveLetter x).UniqueId).split('{')[1]).split('}')[0]
   $volumeGuid
   ```
   此範例抓取到的值為`4147afac-3b5d-46ca-96ab-2edd2da08e09`，稍後會填入 volumeGuid 的參數<br>
 - 開啟您掛載的 VHD，x 磁碟，可以看到 Notepad++ 資料夾，稍後請將此資料夾名稱填入 parentFolder 的參數<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/vhd1.png "vhd1")<br>
 - 點兩下後，會看到 notepad_1.0.0.0_x64__78b8wv0dmcrmj 資料夾，稍後請將此資料夾名稱填入 packageName 的參數<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/vhd2.png "vhd2")<br>
## 建立 Azure File 儲存 VHD 並設定存取權限
 - 建立檔案共用 app，100 GB，可以參考下面兩種方式建立，並設定相應權限<br>
   - [Lab1-3 - 建立 Azure Files 並啟用 Azure AD Domain Services 驗證](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1-3.md)<br>
   - [Lab2-3 - 建立 Azure Files 並啟用 Active Directory 驗證](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2-3.md)<br>

 - 權限重點有兩個，首先您必須在 Azure File 設定使用者和工作階段主機擁有儲存體檔案資料 SMB 共用參與者的權限，其次您必須將 Azure File 設定 NTFS 權限，將電腦物件給予讀取和執行、讀取、列出資料夾內容的權限<br>
   - 啟用虛擬機器系統指派的身分識別<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/msix-af-permission.png "msix-af-permission")<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/msix-af-permission2.png "msix-af-permission2")<br>
   - 新增群組，將這些擁有系統指派的受控識別虛擬機器加入到同一個群組中。如果您是使用 ADDS，請在您的網域控制站中新增群組，如果您使用 Azure AD Domain Services，請直接在 Azure AD 中新增<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/msix-af-permission3.png "msix-af-permission3")<br>
   - 設定使用者和工作階段主機擁有儲存體檔案資料 SMB 共用參與者的權限<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/msix-af-permission4.png "msix-af-permission4")<br>
   - 開啟您網域控制站，或是如果您使用的是 Azure AD Domain Services，請開啟加入網域的虛擬機器，並且安裝 遠端伺服器管理工具<br>
   - 將將檔案共用掛接到您開啟的虛擬機器中，並確保將您的電腦物件設定好 NTFS 權限<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/msix-af-permission5.png "msix-af-permission5")<br>
 - 將名稱為 notepad 的 VHD 檔移動到此檔案共用<br>
   ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/vhd3.png "vhd3")<br>
   > **本範例的路徑為 \\\stor1111.file.core.windows.net\app**<br>