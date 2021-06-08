# 使用 Azure AD Domain Services 搭配 Azure Files 建立 AVD

## Lab8.指派使用者或群組
 在 Lab7 已經指派了 RemoteApp 的使用者，但是桌面類型的還未指派，所以我們需要將需要使用桌面類型的使用者進行指派。<br>
 - 在搜尋列搜尋 Windows 虛擬桌面，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/wvd1.png "wvd1")<br>
 - 點選「應用程式群組」，可以看到已建立好桌面應用程式群組類型，點選「HostPool-DAG」，選擇指派，點選新增，新增 user1、user2。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/assign1.png "assign1")<br>
 - 當您完成 [Lab9](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab9.md) 時，您可以比較 user1、user2、user3 登入後所看到的畫面差異。
	- user1<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/assign2.png "assign2")<br>
	- user2<br>
	 ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/assign3.png "assign3")<br>
	- user3<br>
     ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab1/assign4.png "assign4")<br>

 完成後，請[前往 Lab9](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/Lab9.md)。<br>