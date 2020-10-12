# Windows 虛擬桌面
 本篇會教會您如何快速的建置 Windows Virtual Desktop，再文章中簡稱為「WVD」，
 主要會說明 WVD 的建置細節，使用Azure AD Domain Service 進行身分驗證、建立 Azure
 File 作 User Profile 的儲存區，協助您順暢的建置 WVD， 輕鬆的享受 WVD 所帶來的好處。<br>
## 部署 Windows 虛擬桌面的先決條件
 - 適當的授權<br>
   https://azure.microsoft.com/zh-tw/pricing/details/virtual-desktop/<br>
 - Azure 訂用帳戶，如果您沒有，可以註冊一個月的免費試用<br>
   https://azure.microsoft.com/zh-tw/free/<br>
## 選擇適合您的身分驗證
 由於 Azure AD 並不提供 NTLM/Kerberos 驗證，所以您必須選擇以下其中一種方式來滿足 WVD 的驗證需求。<br>
 - Azure AD Domain Services<br>
 https://docs.microsoft.com/zh-tw/azure/active-directory-domain-services/overview<br>
 - Azure VM ADDS<br>
 https://docs.microsoft.com/zh-tw/windows-server/identity/ad-ds/deploy/virtual-dc/adds-on-azure-vm<br>
## 選擇適合您的設定檔容器
 - Azure Files 搭配 Azure AD Domain Services<br>
 - Azure Files 搭配 Azure VM ADDS<br>
 - 基於VM的檔案共用<br>
## 建立主機集區