*** settings ***
Library  Selenium2Library

*** Variables ***
${browser}   chrome
${url}   //url
${url2}  //url
${logout}  //process/proc_logout.php
${result}
${count}
${count2}
${count3}
${resultcount}
${resultcountread}

*** keywords ***
Go to MTLSU
    open Browser   ${url}   ${browser}
    maximize browser window
    set selenium speed  0.3
*** Test Cases ***
1.MTLSU Index
    Go to MTLSU
2.กรอก username และ password
    Input Text  id:user_username  00117407
    Input Text  id:user_password  BoomBom2540
3.กดปุ่มเข้าสู่ระบบ
    Click Element   //button[@class="btn btn-primary"]   
4.กรอกค้นหารายการ "เรื่อง ไล่"
    Input Text  name=search_title  เรื่อง ไล่
    Click Element   //button[@class="btn btn-default"]
    set selenium speed  0.3
5.ค้นหาหัวข้อ "MTC UNIVERSITY"
    Title Should Be  MTC UNIVERSITY   
6.เช็คปุ่ม เปิด-เปิด ใช้งานได้หรือไม่
    click Element  //div[@class="fa fa-bars tooltips"]
    set selenium speed  0.1
    click Element  //div[@class="fa fa-bars tooltips"]
7.นับลำดับ
     ${count}=  Get Element Count    //li[@class="sub-menu"]
     ${count2}=  Get Element Count    //li[@class="sub-menu dcjq-parent-li"]
     ${resultcount}=   Evaluate   ${count}+${count2}
     Log to Console  ${resultcount}
8.กดปุ่มผู้เข้าชม
    click Element  //a[@class="various tooltips"]
    set selenium speed  2
9.กดออกหน้าผู้เข้าชม
    click Element  //a[@class="fancybox-item fancybox-close"]
10.กดเมนูหัวหน้าหน่วย
    click Element  //a[@id="li_resume3"]
11.กรอกข้อมูลหัวหน้าหน่วย
    Input Text   name=bookname  test01
    Choose File  id=openFile  C:/Users/MTC/Downloads/score.pdf  
    Choose File  id=openFile2  C:/Users/MTC/Downloads/score.pdf 
12.กลับไปหน้าหลัก
    click Element  //a[@id="li_Main"]
13.เช็คจำนวนการอ่าน
    ${count3}=  Get Element Count    //img[@src="icon/ok-icon.gif"]
    ${resultcountread}=   Evaluate   ${count3}-1
    Log to Console  ${resultcountread}
14.คลิกปุ่มจัดการวารสาร
    click Element  //a[@id="li_resume5"]
15.กรอกข้อมูลวารสาร
    Input Text   name=flienameshow  test02
    select from list by label  monthfile   กุมภาพันธ์
    select from list by index  monthfile   2
16.ปิด browser
    close browser
    

