# MSIX 應用程式連接

## 設定 MSIX 應用程式連接的先決條件
 - 了解什麼是 MSIX？<br>
   https://docs.microsoft.com/zh-tw/windows/msix/overview<br>
 - 在 Azure 入口網站建立版本為 Windows 10 enterprise multi-session version 2004 的虛擬機器，並[下載 MSIX 封裝工具](https://www.microsoft.com/en-us/p/msix-packaging-tool/9n5lw3jbcxkf)<br>
 - 準備需要進行轉換 MSIX 套件的應用程式，此範例使用 [Notepad++](https://notepad-plus-plus.org/downloads/v7.8.8/)<br>
 - 了解您的安裝程式<br>
   https://docs.microsoft.com/zh-tw/windows/msix/packaging-tool/know-your-installer
## 建立套件簽署的憑證
 連入到您剛建立的虛擬機器，本文章會建立自我簽署憑證用於簽署 MSIX 套件<br>
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
 - 匯出使用密碼保護的憑證
   - 填入您自定義的密碼到此區塊 <Your Password><br>
   - 將剛顯示的參數 Thumbprint 填入 <Certificate Thumbprint><br>
   - FilePath 此參數指定您的匯出檔案的路徑<br>
   ```
   $password = ConvertTo-SecureString -String <Your Password> -Force -AsPlainText 
   Export-PfxCertificate -cert "Cert:\CurrentUser\My\<Certificate Thumbprint>" -FilePath C:\MSIXssc.pfx -Password $password
   ```
## 將舊版應用程式轉換成 MSIX 套件
## 產生適用於 MSIX 的 VHD
## 建立 Azure File 儲存 VHD 並設定存取權限
## 在 WVD 工作階段主機準備 PowerShell 指令碼進行 MSIX 應用程式連接
## 在群組原則中使用啟動、關機、登入和登出指令碼