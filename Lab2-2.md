# Lab2 - 使用 Azure VM ADDS 搭配 Azure Files 建立 WVD
## Lab2-2.設定 Azure AD Connect
 - 在 Server Manager 視窗中，選擇 Local Server，將 IE Enhanced Security Configuration 設定調整為 Off<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add1.PNG "add1")<br>
 - 開啟 IE 瀏覽器，輸入 https://go.microsoft.com/fwlink/?LinkId=615771，並下載。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add2.png "add2")<br>
 - 開啟 AzureADConnect.exe 安裝<br>
 - 勾選「I agree to the License terms and privacy notes.」，點選「Continue」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add3.png "add3")<br>
 - 選擇「Customize」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add4.png "add4")<br>
 - 選擇「Install」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add5.png "add5")<br>
 - 選擇「Password Hash Synchronization」，按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add6.png "add6")<br>
 - 輸入您具有的 Azure AD Global administrator 的管理者帳號，按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add7.png "add7")<br>
 - 點選「Add Directory」，選擇「Create new AD account」，輸入您具有 Enterprise admin 權限的帳號，按下「OK」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add8.png "add8")<br>
 - 成功後，可以看到您的樹系標示成功，按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add9.png "add9")<br>
 - 因為此範例已經實作 Azure AD 自訂網域設定，在 Windows ADDS 樹系名稱一致的狀況下，按下「Next」<br>
 > **Tips.如果您沒有實作自訂網域，請勾選 Continue without matching all UPN suffixes to verified domains 後繼續** <br>
 
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add10.png "add10")<br>
 - 選擇「Sync selected domains and OUs」，只勾選「WVD」，按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add11.png "add11")<br>
 - 按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add12.png "add12")<br>
 - 按下「Next」，如果您想針對名稱、群組等篩選，您可以在此設定<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add13.png "add13")<br>
 - 按下「Next」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add14.png "add14")<br>
 - 選擇「Install」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add5.png "add15")<br>
 - 完成<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2/add16.png "add16")<br>
 
 完成後，請[前往 Lab2-3](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab2-3.md)。<br>