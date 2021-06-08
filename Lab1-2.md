# 使用 Azure AD Domain Services 搭配 Azure Files 建立 AVD

## Lab1-2.建立 Azure AD Domain Services
 由於建立 Azure AD Domain Services 會需要兩個小時，如果您的練習時間較少，可前往Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 AVD，進行練習。

 - 在搜尋列搜尋 Azure AD Domain Services，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds1.png "addds1")<br>
 - 點選「新增」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds2.png "addds2")<br>
 - 基本的頁籤中，您有幾項需要填入<br>
	- 選擇您的訂用帳戶<br>
	- 建立資源群組，此範例新增名稱為 AADDS<br>
	- DNS 網域名稱您可以填入自己定義的網域，或是您在 Azure AD 上的自訂網域或預設網域。此範例使用 Azure AD 上的自訂網域 brianhsing.club。<br>
	  > **Tips.請不要使用結尾為「.local」的網域，此網域無法在虛擬網路內路由** <br>
	- 選擇符合您需要的資料中心位置，此範例選擇東亞。<br>
	- SKU 有三種類型標準、企業、進階，每個級距的差異是在驗證負載量與物件建議數量建議的數量不同，此範例選擇標準。<br>
	  https://azure.microsoft.com/zh-tw/pricing/details/active-directory-ds/<br>
	- 樹系類型主要有兩種，使用者和資源，差異是使用者類型的樹系，會同步 Azure AD 的所有物件，可以讓使用者帳戶直接和 Azure AD Domain Services 進行驗證。資源類型的樹系會需要和內部部署的 Windows ADDS 樹系單向信任，使用這個方法的時候，使用者物件和密碼雜湊不會同步至 Azure AD Domain Services。此範例選擇使用者類型的樹系。<br>
	  > **Tips.由於此範例使用 Azure AD 搭配 Azure AD Domain Services ，必須選擇使用者類型樹系，才能符合 AVD 需求** <br>

	![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds3.png "addds3")<br>
 - 網路的頁籤中，系統會先幫您建立預設的虛擬網路，您可以點選「建立新的項目」，去更改位置空間的大小，並且新增編輯子網路。此範例將位置範圍設定為 10.0.0.0/16，並新增子網路 hostpool-subnet 10.0.1.0/24。此子網路會放置稍後新增的 AVD 主機集區。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds4.png "addds4")<br>
 - 管理的頁籤中，您會需要將某位使用者加入到 AAD DC Administrators 管理群組，只有在此管理群組的成員可以管理。此管理群組內的使用者也可以登入管理加入網域的虛擬機器。在過去，只有管理群組的成員可以將虛擬機器加入網域。好消息是在近期已經沒有這個限制了<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds5.png "addds5")<br>
 - 同步處理的頁籤中，您可以選擇特定的群組不進行同步，此範例選擇全部同步處理類型。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds6.png "addds6")<br>
 - 點選「檢閱+建立」，如果沒有錯誤，即可開始建立。<br>
 - 建立完成後，請點選進建立好的 Azure AD Domain Services，在右欄必要的設定步驟中，選擇設定。此步驟是將虛擬網路中的 DNS 伺服器指向此服務，AVD 主機集區後續才能加入網域與驗證。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/aadds7.png "addds7")<br>

 > **Tips.完成資源建立後，您必須重設使用者密碼，Azure AD 使用者物件才會產生雜湊值，並同步至Azure AD Domain Services。此外您也需要等待至少 10 分鐘以上的同步時間** <br>

 完成後，請[前往 Lab1-3](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1-3.md)。<br>