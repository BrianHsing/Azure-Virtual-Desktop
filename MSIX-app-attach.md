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
 - 使用 New-SelfSignedCertificate 來建立憑證
   ```
   New-SelfSignedCertificate -Type Custom -Subject "CN=brianhsing,C=TW" -KeyUsage DigitalSignature -FriendlyName "brianhsing" -CertStoreLocation "Cert:\CurrentUser\My" -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
   ```
 - 匯出憑證
## 將舊版應用程式轉換成 MSIX 套件
## 產生適用於 MSIX 的 VHD
## 建立 Azure File 儲存 VHD 並設定存取權限
## 在 WVD 工作階段主機準備 PowerShell 指令碼進行 MSIX 應用程式連接
## 在群組原則中使用啟動、關機、登入和登出指令碼