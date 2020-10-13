# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab5.透過 Azure 入口網站建立主機集區

 - 在搜尋列搜尋 Windows 虛擬桌面，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/wvd1.png "wvd1")<br>
 - 點選「建立主機集區」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/wvd2.png "wvd2")<br>
 - 基本功能頁籤中，請建立新的資源群組，將主機集區放置在這，填入主機集區名稱，這裡的位置，指的是metadata，目前您只能選在美國區域。主機集區類型有兩種，集區式代表多個使用者可以共用一台主機，個人代表一個使用者綁定使用一台主機，此
 範例選擇集區式，工作階段上限設定為 10，代表一台主機限制 10 位使用者同時使用。負載平衡演算法分為廣度與深度優先，廣度優先是將使用者數量平均分配在主機集區，深度優先則是會先達到主機的工作階段上限時，才會將下一位使用者分配到另外一台主機。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/wvd3.png "wvd3")<br>
 - 虛擬機器頁籤中，選擇「是」新增虛擬機器，這邊的虛擬機器位置您就可以選擇離您最近的資料中心，並選擇您想建立的虛擬機器大小、數量、映像檔。
本範例設定位置為東亞、大小選擇 D2s v3、數目設定為 2、名稱前置詞 win10，選擇映像檔類型，選擇 Windows 10 Enterprise muti-session, Version 2004 + Microsoft 365 Apps<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/wvd4.png "wvd4")<br>
  > **Tips.名稱前置詞限制 11 個字元且不得重複** <br>

 完成後，請[前往 Lab6](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab6.md)。<br>