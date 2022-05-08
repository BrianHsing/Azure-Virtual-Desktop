# Lab3-1 - 透過 Azure 入口網站建立主機集區

## 建立虛擬網路與 Azure Bastion
 - 在搜尋列搜尋虛擬網路，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createvnet1.png "createvnet1")<br>
 - 點選建立後，新建`資源群組`、`名稱`與`區域`，本篇資源群組名稱設置為 avd-aadjoin，執行個體名稱為 vnet，區域選擇 East Asia，完成後，點選下一步。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createvnet2.png "createvnet2")<br>
 - 更改子網路名稱為 RDSH-subnet，完成後，點選儲存，並且點選下一步：安全性<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createvnet3.png "createvnet3")<br>
 - 在 BastionHost 的功能選項中，點選啟用，輸入 Bastion 名稱、 AzureBastionSubnet 位置空間與新增公用 IP 位置，完成後點選檢閱 + 建立按鈕，完成虛擬網路的建立。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/createvnet4.png "createvnet4")<br>

## 透過 Azure 入口網站建立主機集區

 - 在搜尋列搜尋虛擬桌面，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd1.png "wvd1")<br>
 - 點選「建立主機集區」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd2.png "wvd2")<br>
 - 基本功能頁籤中，請建立新的資源群組，將主機集區放置在這，填入主機集區名稱，這裡的位置，指的是metadata，目前您只能選在美國區域。主機集區類型有兩種，集區式代表多個使用者可以共用一台主機，個人代表一個使用者綁定使用一台主機，此
 範例選擇集區式，工作階段上限設定為 10，代表一台主機限制 10 位使用者同時使用。負載平衡演算法分為廣度與深度優先，廣度優先是將使用者數量平均分配在主機集區，深度優先則是會先達到主機的工作階段上限時，才會將下一位使用者分配到另外一台主機。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd3.png "wvd3")<br>
 - 虛擬機器頁籤中，選擇「是」新增虛擬機器，這邊的虛擬機器位置您就可以選擇離您最近的資料中心，並選擇您想建立的虛擬機器大小、數量、映像檔。
本範例設定位置為東亞、大小選擇 D2s v3、數目設定為 2、名稱前置詞 win10，選擇映像檔類型，選擇 Windows 10 Enterprise muti-session, Version 2004 + Microsoft 365 Apps<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd4.png "wvd4")<br>
  > **Tips.名稱前置詞限制 11 個字元且不得重複** <br>
 - 在同個頁籤中，選擇虛擬網路 aadds-vnet，子網路選擇 rdsh-subnet，其餘目前都先選擇否，後續均可以更改。下方請填入 Azure AD 任何一個使用者帳號密碼，但此組使用者物件必須擁有密碼雜湊，否則加入網域會失敗。另外如果在虛擬網路的 DNS 伺服器如果也沒有設定指向 Azure AD Domain Services 或 Windows ADDS 任一個的話，在這個步驟也會失敗。<br>
  https://docs.microsoft.com/zh-tw/azure/active-directory-domain-services/faqs#ive-enabled-azure-ad-domain-services-what-user-account-do-i-use-to-domain-join-machines-to-this-domain<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd5.png "wvd5")<br>
 - 工作區頁籤中，請選擇「是」，並新增工作區。完成後請點選「檢閱+建立」，開始部署 AVD<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd6.png "wvd6")<br>