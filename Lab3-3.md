# Lab3-3 - 指派使用者存取權與自訂 RDP 屬性

# 指派使用者存取權限

- 點選稍早建立的資源群組 avd-addjoin，並且在左欄選擇存取控制(IAM)，點選新增，然後點選角色指派<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/permission1.png "permission1")<br>
- 在角色選擇`虛擬機器使用者登入`，並且選擇下一步<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/permission2.png "permission2")<br>
- 在成員頁籤中，存取權指派對象為使用者、群組或服務主體，成員選擇稍早所建立的 AVDGroup，完成後點選檢閱+指派<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/permission3.png "permission3")<br>

# 自訂 RDP 屬性

- 將視窗點選到稍早所建立的主機集區 `hostpool-personal`，在設定的功能欄位中選擇 `RDP 屬性`<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/customrdp1.png "customrdp1")<br>
- 點選`進階`頁籤，輸入`targetisaadjoined:i:1`，完成後點選儲存<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3/customrdp2.png "customrdp2")<br>

完成後，請[前往 Lab3-4](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab3-4.md)。<br>