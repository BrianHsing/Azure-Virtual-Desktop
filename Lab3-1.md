# Lab3-1 - 建立 Azure AD User

  本篇會與引導您如何在不建立 Windows AD 與 Azure AD Domain Services 的情境下來快速的佈署您所需要的遠距工作桌面環境，在佈署之前需要注意幾件事情：<br>
  1. 您必須具有租用戶的`全域管理員`與訂用帳戶`編輯者`或`擁有者`的角色權限<br>
  2. 目前會建議使用`個人桌面`類型的情境在使用此佈署方式，原因是如果您使用`集區`，那您可能會想要佈署 FSlogix 來當作使用者設定檔漫遊，但目前要這個功能必須要在`混合身分識別`的情境之下才能使用，所以您就會需要再與您的 Windows AD 進行整合，比較起來就會比其他方式更為繁瑣<br>
  3. 請參考此佈署類型官方文件所公告的已知限制，判斷現有情境是否適合採用<br>
    https://docs.microsoft.com/zh-tw/azure/virtual-desktop/deploy-azure-ad-joined-vm<br>

## 建立 Azure AD User

此情境假設是在純雲端環境中，沒有與任何環境的 Windows AD 進行整合，並且也不會使用 Azure AD Domain 來進行身分的驗證，所以我們必須先建立 Azure AD 的使用者，並且額外建立一個群組來統一指派權限<br>

- 首先先到 Azure  Active Directory，在管理的功能分類下方，找到群組，並且新建一個名為`AVDGroup`的群組，群組類型選擇`安全性`即可<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createaduser1.png "createaduser1")<br>
- 完成後，在管理的功能分類下方選擇使用者，分別建立 user1、user2，在建立的過程中，將使用者加入到`AVDGroup`的群組，後續記得要給予使用者相應的計費授權<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createaduser2.png "createaduser2")<br>

完成後，請[前往 Lab3-2](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3-2.md)。<br>