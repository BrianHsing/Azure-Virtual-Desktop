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
 由於 Azure AD 並不提供 NTLM/Kerberos 驗證，所以您必須選擇以下其中一種方式來滿足 WVD 的驗證需求，與 
 Azure AD 搭配。 當然實際情況會依據您目前的環境來彈性調整，例如您如果有使用 Site to Site VPN 和內部部
 署連接，您也可以使用現有的 Windows AD DS 來進行驗證。<br>
 - Azure AD Domain Services<br>
 https://docs.microsoft.com/zh-tw/azure/active-directory-domain-services/overview<br>
 - Azure VM ADDS<br>
 https://docs.microsoft.com/zh-tw/windows-server/identity/ad-ds/deploy/virtual-dc/adds-on-azure-vm<br>
## 選擇適合您的設定檔容器
 WVD 提供 FSLogix 設定檔，作為建議的使用者設定檔解決方案。您可以選擇使用以虛擬機器為基礎的檔案共用，
 也可以使用 Azure Files，當然您也可以選擇 Azure NetApp Files 做為您的容器。<br>
 - Azure Files 搭配 Azure AD Domain Services<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-profile-container-adds<br>
 - Azure Files 搭配 Azure VM ADDS<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-file-share<br>
 - 基於 VM 的檔案共用<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-host-pools-user-profile<br>
 - Azure NetApp Files 搭配 Windows ADDS<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-fslogix-profile-container<br>
## Lab 實戰演練
 下列每一個 Lab 都是能讓您建立出獨立且完整的 WVD 環境，您可以選擇適合自己情境的 Lab 進行練習。<br>
 - Lab1 - 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD<br>
 - Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 WVD<br>
 - Lab3 - 使用 Azure AD Domain Services 搭配基於 VM 的檔案共用建立 WVD<br>
## 深入研究
 - 使用 Storage Spaces Direct (S2D) 作為設定檔容器<br>
