# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab7.建立 Remote App

 - 在搜尋列搜尋 Windows 虛擬桌面，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/wvd1.png "wvd1")<br>
 - 點選「應用程式群組」，可以看到已建立好桌面應用程式群組類型，點選「新增」。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/remoteapp1.png "remoteapp1")<br>
 - 基本功能的頁籤中，選擇您要放置的資源群組、主機集區，並輸入應用程式群組名稱。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/remoteapp2.png "remoteapp2")<br>
 - 應用程式頁籤中，點選新增應用程式，應用程式來源選擇開始功能表，應用程式選擇 Paint，點選「儲存」。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/remoteapp3.png "remoteapp3")<br>
 - 重複上述動作在應用程式選擇 Remote Desktop Connection，點選儲存後點選「下一步」。<br>
 - 指派頁籤中，您可以指派使用者或群組，授予權限使用，點選「下一步」。此範例加入 user2 這位使用者。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/remoteapp4.png "remoteapp4")<br>
 - 工作區頁籤中，註冊應用程式群組選擇「是」，並選擇 workspace 後，以點選「檢閱+建立」，完成 RemoteApp 的建立。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/remoteapp5.png "remoteapp6")<br>

 完成後，請[前往 Lab8](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab8.md)。<br>