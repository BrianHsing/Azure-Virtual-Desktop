# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab1-3.建立 Azure Files 並啟用 Azure AD Domain Services 驗證

 - 在搜尋列搜尋儲存體帳戶，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage1.png "storage1")<br>
 - 點選「新增」<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage2.png "storage2")<br>
 - 基本的頁籤中，選擇與 Azure AD Domain Services 同樣的訂用帳戶與資源群組，輸入自定義的儲存體帳戶名稱，請注意，請使用小寫與數字且不能重複的名稱。此範例區域選擇東亞，此儲存體是要作為儲存體的容器，所以效能選擇進階，帳戶種類選擇 FileStorage，複寫可以依照情境需求選擇。<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage3.png "storage3")<br>
 - 網路的頁籤中，選擇公用端點(所有網路)。如果您有比較嚴謹的存取控管，您可以選擇公用端點，只允許您指定的虛擬網路中的流量存取。這一步，請直接點選下方「檢閱+建立」，完成儲存體帳戶的建立<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage4.png "storage4")<br>
 - 選擇剛建立好的儲存體帳戶，在左邊欄位的設定類別中選擇組態，並將 Azure Active Directory Domain Services (Azure AD DS)選擇「已啟用」後，儲存。<br>
 ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage5.png "storage5")<br>
 - 在左邊欄位的檔案服務類別中選擇檔案共用，並新增檔案共用，輸入您的檔案共用名稱與容量，容量介於 100 GiB 到 102,400 GiB。點選建立。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/storage6.png "storage6")<br>

 完成後，請[前往 Lab1-4](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1-4.md)。<br>