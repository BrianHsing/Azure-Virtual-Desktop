# 在 AVD 工作階段主機準備 PowerShell 指令碼讓使用者手動進行 MSIX 應用程式連接
 - Session Host
 - 讓使用者連入您的 WVD 工作階段主機，並提供四個 Powershell 指令集給予使用者自行手動連接<br>
 - MSIX 應用程式連接流程主要分為四個階段，使用者如需使用必須要執行暫存、註冊這兩個 Powershell 指令集，如需取消使用會要執行取消註冊、取消暫存這兩個 Powershell 指令集<br>
   - 如果您想直接執行 ps1，不使用逐行執行時，您必須要先執行`Set-ExecutionPolicy RemoteSigned`<br>
   - 暫存
     - 可參考下載[stage.ps1](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/Stage.ps1)，開啟此 ps1 檔案您必須要填入幾個參數 vhdSrc、packageName、parentFolder、volumeGuid<br>
        ```
        $vhdSrc="\\stor1111.file.core.windows.net\app\notepad.vhd"
        $packageName = "notepad_1.0.0.0_x64__78b8wv0dmcrmj"
        $parentFolder = "notepad++"
        $parentFolder = "\" + $parentFolder + "\"
        $volumeGuid = "d5816682-b370-4ee0-ac2a-252aa2591bf6"
        $msixJunction = "C:\temp\AppAttach\"
        ```
     - 逐行執行的成功畫面如下<br>
       ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/stage1.png "stage1")<br>
       ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/stage2.png "stage2")<br>
       ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/stage3.png "stage3")<br>
   - 註冊，可立即使用應用程式<br>
     - 可參考下載[Register.ps1](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/Register.ps1)，開啟此 ps1 檔案您必須要填入一個參數 packageName<br>
     - 您在執行這個 Powershell 指令碼時，可以先確認工作階段主機是否確實沒有安裝 Notepad++ 應用程式<br>
     - 執行此 ps1 指令碼，您就可以搜尋 Notepad++ 並開啟此應用程式，下圖可展示在沒有安裝在本機的狀況下，也可以正常執行<br>
       ![GITHUB](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/register1.png "register1")<br>
   - 取消註冊，應用程式立即無法從工作階段主機被使用<br>
     - 可參考下載[Deregister.ps1](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/Deregister.ps1)，開啟此 ps1 檔案您必須要填入一個參數 packageName<br>
     - 執行此 ps1 指令碼，您將無法搜尋到 Notepad++ 此應用程式<br>
   - 取消暫存，建議在關機時使用<br>
     - 可參考下載[Destage.ps1](https://github.com/BrianHsing/Azure-Virtual-Desktop/blob/master/MSIX/Destage.ps1)，開啟此 ps1 檔案您必須要填入兩個參數 vhdSrc、packageName<br>

回到[Azure 虛擬桌面](https://github.com/BrianHsing/Azure-Virtual-Desktop)。<br>