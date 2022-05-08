# Lab3-2 - 透過 Azure 入口網站建立主機集區

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
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd1.png "avd1")<br>
 - 點選「建立主機集區」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd2.png "avd2")<br>
 - 基本功能頁籤中，請建立新的資源群組，將主機集區放置在這，填入主機集區名稱，這裡的位置，指的是 metadata，目前您只能選在美國與歐洲區域。主機集區類型有兩種，集區式代表多個使用者可以共用一台主機，個人代表一個使用者綁定使用一台主機，此
 範例選擇個人，指派類型分別有自動與直接，自動指派是當使用者登入時，會自動指派還未被指派的個人工作階段主機，不需要特別指派。直接需要特別的指派特定個人工作階段主機給予使用者，使用者才能在介面上看到個人工作階段主機的選項，本篇選擇自動<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd3.png "avd3")<br>
 - 虛擬機器頁籤中，選擇「是」新增虛擬機器，這邊的虛擬機器位置您就可以選擇離您最近的資料中心，並選擇您想建立的虛擬機器大小、數量、映像檔。
本範例設定位置為東亞、大小選擇 D2s v3、數目設定為 2、名稱前置詞 win11-p，選擇映像檔類型，選擇 Windows 11 Enterprise<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd4.png "avd4")<br>
  > **Tips.名稱前置詞限制 11 個字元且不得重複** <br>
 - 在同個頁籤中，選擇虛擬網路 vnet，子網路選擇 RDSH-subnet，其餘目前都先選擇否，後續均可以更改。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd5.png "avd5")<br>
 - 請注意，這裡是重點，在要加入的網域這個欄位下方，請選擇 Azure Active Directory，下方可以依據您購買的授權選擇是否要自動將工作階段主機註冊 Intune，後續也會透過 Intune 管理工作階段主機，後續可以手動註冊 Intune。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd6.png "avd6")<br>
 - 在虛擬機器系統管理員帳戶這個欄位中，您可以設定本機管理員的帳號與密碼，用於單獨管理，完成後選擇下一步:工作區<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/avd7.png "avd7")<br>
 - 工作區頁籤中，請選擇「是」，並新增工作區。完成後請點選「檢閱+建立」，開始部署 AVD<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd6.png "wvd6")<br>

  完成後，請[前往 Lab3-3](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3-3.md)。<br>