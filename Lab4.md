# 使用 Azure AD Domain Services 搭配 Azure Files 建立 WVD

## Lab4.設定虛擬網路並建立 Azure Bastion
 - 在搜尋列搜尋 aadds-vnet，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/vnet1.png "vnet1")<br>
 - 點選左欄設定類別的子網路，點選新增子網路，輸入子網路名稱 rdsh-subnet，點選確定。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/vnet2.png "vnet2")<br>
 - 點選左欄設定類別的子網路，點選新增子網路，輸入子網路名稱 AzureBastionSubnet，點選確定。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/vnet3.png "vnet3")<br>
 - 在搜尋列搜尋 Bastion，並點選<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/bastion1.png "bastion1")<br>
 - 點選「新增」<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/bastion2.png "bastion2")<br>
 - 資源群組選擇 AADDS、名稱輸入 Bastion、區域選擇 East Asia、虛擬網路選擇 aadds-vnet，下方子網路會自動帶入。建立新的公用 IP 位置，填入 bastion-pip 公用 IP 位置名稱，填妥後點選「檢閱+建立」。<br>
  ![GITHUB](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab1/bastion3.png "bastion2")<br>

 完成後，請[前往 Lab5](https://github.com/BrianHsing/Azure-Windows-Virtual-Desktop/blob/master/Lab5.md)。<br>