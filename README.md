# Azure 虛擬桌面

 本篇會教會您如何快速的建置 Azure Virtual Desktop，後續文章中簡稱為「AVD」， 主要會說明 AVD 的建置細節，使用適合的方式進行身分驗證、建立 Azure
 File 作 User Profile 的儲存區，協助您順暢的建置 AVD， 輕鬆的體驗 AVD 所帶來的好處。<br>
## 部署 Azure 虛擬桌面的先決條件
 - 什麼是 Azure 虛擬桌面？<br>
   https://docs.microsoft.com/zh-tw/azure/virtual-desktop/overview
 - 適當的授權<br>
   https://azure.microsoft.com/zh-tw/pricing/details/virtual-desktop/<br>
 - Azure 訂用帳戶，如果您沒有，可以註冊一個月的免費試用<br>
   https://azure.microsoft.com/zh-tw/free/<br>
## 選擇適合您的身分驗證
 由於 Azure AD 並不提供 NTLM/Kerberos 驗證，所以您必須選擇以下其中一種方式來滿足 AVD 的驗證需求，與 
 Azure AD 搭配。 當然實際情況會依據您目前的環境來彈性調整，例如您如果有使用 Site to Site VPN 和內部部
 署連接，您也可以使用現有的 Windows AD DS 來進行驗證。<br>
 - Azure AD Domain Services<br>
 https://docs.microsoft.com/zh-tw/azure/active-directory-domain-services/overview<br>
 - Azure VM ADDS<br>
 https://docs.microsoft.com/zh-tw/windows-server/identity/ad-ds/deploy/virtual-dc/adds-on-azure-vm<br>
## 選擇適合您的設定檔容器
 AVD 提供 FSLogix 設定檔，作為建議的使用者設定檔解決方案。您可以選擇使用以虛擬機器為基礎的檔案共用，
 也可以使用 Azure Files，當然您也可以選擇 Azure NetApp Files 做為您的容器。<br>
 - Azure Files 搭配 Azure AD Domain Services<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-profile-container-adds<br>
 - Azure Files 搭配 Azure VM ADDS<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-file-share<br>
 - 基於 VM 的檔案共用<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-host-pools-user-profile<br>
 - Azure NetApp Files 搭配 Windows ADDS<br>
 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/create-fslogix-profile-container<br>
## 需求參考的資訊

 - Azure 虛擬桌面體驗估算器<br>
   https://azure.microsoft.com/zh-tw/services/virtual-desktop/assessment/
 - 網路指導方針<br>
   https://docs.microsoft.com/zh-tw/windows-server/remote/remote-desktop-services/network-guidance?context=/azure/virtual-desktop/context/context
 - 虛擬機器縮放指導方針<br>
   https://docs.microsoft.com/zh-tw/windows-server/remote/remote-desktop-services/virtual-machine-recs?context=/azure/virtual-desktop/context/context
 - 不同的遠端桌面用戶端支援比較<br>
   https://docs.microsoft.com/zh-tw/windows-server/remote/remote-desktop-services/clients/remote-desktop-app-compare


## Lab 實戰演練
 下列每一個 Lab 都是能讓您建立出獨立且完整的 AVD 環境，您可以選擇適合自己情境的 Lab 進行練習。<br>
 練習路徑 1 - Lab1 + Lab4 ~ Lab8<br>
 練習路徑 2 - Lab2 + Lab5 ~ Lab8<br>
 練習路徑 3 為獨立 Lab，可讓您用最簡易的方式建立起 AVD 環境<br>
 - Lab1 - 使用 Azure AD Domain Services 搭配 Azure Files 建立 AVD<br>
	 - [Lab1-1 - 建立 Azure AD 使用者](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1-1.md)<br>
	 - [Lab1-2 - 建立 Azure AD Domain Services](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1-2.md)<br>
	 - [Lab1-3 - 建立 Azure Files 並啟用 Azure AD Domain Services 驗證](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1-3.md)<br>
 - Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 AVD<br>
	 - [Lab2-1 - 建立 Azure VM ADDS](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2-1.md)<br>
	 - [Lab2-2 - 設定 Azure AD Connect](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2-2.md)<br>
	 - [Lab2-3 - 建立 Azure Files 並啟用 Active Directory 驗證](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab2-3.md)<br>
  - Lab3 - 使用 Azure AD 建立 AVD (coming soon)<br>
     - [Lab3-1 - 建立 Azure AD User]()<br>
     - [Lab3-2 - 透過 Azure 入口網站建立主機集區]()<br>
     - [Lab3-3 - 指派使用者或群組]()<br>
     - [Lab3-4 - 自訂 RDP 屬性]()<br>
     - [Lab3-5 - 開始使用 AVD]()<br>
 - [Lab4 - 設定虛擬網路並建立 Azure Bastion](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab4.md)<br>
 - [Lab5 - 透過 Azure 入口網站建立主機集區](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab5.md)<br>
 - [Lab6 - 設定 FSLogix 使用者設定檔](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab6.md)<br>
 - [Lab7 - 建立 Remote App](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab7.md)<br>
 - [Lab8 - 指派使用者或群組](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab8.md)<br>
 - [Lab9 - 開始使用 AVD](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab9.md)<br>

## 如何將應用程式發布給特定使用者或群組
 完成 Lab 實戰演練，相信您已經知道如何建立 AVD 環境，現在您可能會思考應用程式如果正確地顯示在您指派的使用者登入的工作階段桌面，不同的工作角色常用的應用程式不盡相同，AVD 目前有三種方式讓您達到這個目的，您可以建立多個主機集區，讓不同的使用者或群組使用。或者您可以在同一個映像檔中先將您所有的應用程式安裝完成，再透過應用程式遮罩建立您的顯示使用原則。最後您也可以使用現代化的方式，將應用程式容器化，動態的掛載到相對應的使用者桌面。
 - 多個映像檔<br>
   - 為不同使用者定製不同的主機集區，是操作最容易的方式。<br>
 - FSLogix 應用程式遮罩<br>
   - 在同一個主機集區使用傳統應用程式分層，可自訂原則，可能會有授權許可的問題，操作難度中等。<br>
 - MSIX 應用程式連接<br>
   - 將應用程式容器化並動態掛載，可能需要重新打包應用程式，操作難度較高。<br>
   - 使用 Azure 入口網站設定 MSIX 應用程式附加<br>
      - [教學影片](https://www.youtube.com/channel/UCKIAAhvrZjMazrNqYV9asFA)<br>
      - [利用事件檢視器 XML 進行錯誤判斷](https://github.com/stgeorgi/msixappattach/tree/master/event_viewer_filter)<br>
   - [了解 MSIX 應用程式連接與 MSIX 映像檔準備](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX-package.md)<br>
   - [在 Azure Portal 設定 MSIX 應用程式連接](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Azure-Portal-MSIX-app-attach.md)<br>
   - [使用 PowerShell 設定 MSIX 應用程式連接](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX-app-attach.md)<br>
   - [MSIX Event Log Tool](https://github.com/RMITBLOG/MSIX_APP_ATTACH/raw/master/MSIX%20Event%20Log%20tool/View%20MSIX%20logs.exe)<br>

## 深入研究
 - 部署 Storage Spaces Direct (S2D)<br>
   https://docs.microsoft.com/zh-tw/windows-server/storage/storage-spaces/deploy-storage-spaces-direct
 - What is FSLogix?<br>
   https://docs.microsoft.com/en-us/fslogix/overview
 - 使用 Azure 防火牆來保護 Azure 虛擬桌面部署<br>
   https://docs.microsoft.com/zh-tw/azure/firewall/protect-windows-virtual-desktop
 
