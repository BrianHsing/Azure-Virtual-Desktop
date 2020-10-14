# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab9.開始使用 WVD
 - 使用 Web 用戶端連線，任何支援 HTML5 的瀏覽器應該皆可正常運作。<br>
	- 開啟任何一台桌上型、筆記型電腦，開啟瀏覽器，並輸入 https://rdweb.wvd.microsoft.com/arm/webclient<br>
	- 登入 Azure AD 使用者帳號密碼，此步驟為第一階段驗證，與 Azure AD 驗證，您可以在這個步驟使用 MFA、條件式存取。<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use1.png "use1")
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use2.png "use2")<br>
	- 登入成功後，就可以看到 WVD 的使用者入口網站<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use3.png "use3")<br>
	- 點選 Default Desktop，會跳出存取本機資源視窗，點選允許。此視窗可以在 WVD 管理介面中選擇是否要顯示。<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use4.png "use4")<br>
	- 跳出輸入您的認證視窗後，請輸入 Azure AD Domain Services\/ Windows AD 的使用者帳號，此步驟為第二階段認證，您可以透過自訂網域，讓使用者帳號一致。<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use5.png "use5")<br>
	- 順利登入工作桌面<br>
	  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/use6.png "use6")<br>
	詳細請參考 https://docs.microsoft.com/zh-tw/azure/virtual-desktop/connect-windows-7-10<br>

回到[Windows 虛擬桌面](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop)。<br>