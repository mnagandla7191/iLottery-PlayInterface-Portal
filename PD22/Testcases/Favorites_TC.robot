
*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../Libs/Common_base.py
Library    ../Libs/Home_Page.py
Library    ../Libs/Wagering_Pages.py
Library    ../Libs/My_Activity_Pages.py
Library    ../Libs/Favorites_Pages.py
Resource    ../Resources/Common.robot
Resource    ../Resources/Login_Keywords.robot
Resource    ../Resources/Wagering_Keywords.robot
Resource    ../Resources/My_Activity_Keywords.robot
Resource    ../Resources/Favorites_Keywords.robot
# Test Teardown    Test Clean Up    ${browser_type}    ${url}     ${Email}    ${password}
# Suite Setup   BeforeSuite    ${browser}    ${url}    ${Email}    ${password}    ${flag}
*** Variables ***
${browser_type}    Chrome
${url}    https://refqa2playdigital.dev.igt.com/
# ${Email}    autoplayer0502@igt.com
# ${password}    Welcome1
${delay}    15 seconds
${Sheet_Name}    Favorites
${xls_filename}    datafile_Portal.xls
${environment}    Environment_details
${flag}    1
*** Test Cases ***
testcase for Create Favorite
    [TAGS]    Login
    ${res}=    readxl    ${Sheet_Name}    ${xls_filename}
    Log    ${res}
    ${Email}    set variable       ${res[0][0]}
    ${password}    set variable       ${res[0][1]}
    ${Game_Name}    set variable       ${res[0][2]}
    ${No_Boards}    set variable       ${res[0][3]}
    ${bet_type}    set variable       ${res[0][4]}
    ${draw_name}    set variable       ${res[0][5]}
    ${Pick_Numbers}    set variable       ${res[0][6]}
    ${group_name}    set variable       ${res[0][7]}
    Log    ${Email}, ${password}, ${Game_Name}, ${No_Boards}
    
    ${res}=    readxl    ${environment}    ${xls_filename}
    ${url}    set variable       ${res[0][0]}
    ${browser_type}    set variable       ${res[0][1]}
    open browser    ${url}    ${browser_type}
    Maximize Browser Window
    Click on Login button
    Enter User Name and Password    ${Email}    ${password}
    Click on Sign in Button
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    ${totalLoyalty}=     Get Total Loyalty
    Log    LoyaltyBalance=${totalLoyalty}
    Click on Player Menu
    Click on Favorite iLottery link
    Click on Add Favorite Button
    Select Game from Favorite games list    ${Game_Name}
    Click on Add New Group
    Enter Group Name and Add New Group    ${group_name}
    Click Next Button
    Do Quick pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}    ${flag}
    Run Keyword If    '${Game_Name}' == 'Pick 3' or '${Game_Name}' == 'Pick 4' or '${Game_Name}' == 'All or Nothing'    Select Game Type and Draw Time    ${Game_Name}    ${bet_type}    ${draw_name}
    Click on Add Group Button
    

    
    
    
