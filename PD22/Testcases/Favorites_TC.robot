*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../Libs/Common_Base_Repo.py
Library    ../Libs/Home_Page.py
Library    ../Libs/Wagering_Pages.py
Library    ../Libs/My_Activity_Pages.py
Resource    ../Resources/Common.robot
# Resource    ../Resources/Login_Keywords.robot
# Resource    ../Resources/Wagering_Keywords.robot
Resource    ../Resources/My_Activity_Keywords.robot
# Library    ../libs/Common_Base_Repository.py
Test Teardown    Test Clean Up
Suite Setup   BeforeSuite
# Suite Teardown  AfterSuite
*** Variables ***
${browser_type}    Chrome
${url}    https://kyssit2.igtilotterycmdtest.com/en-us/home.html
${Email}    maruthi155@igt.com    
${password}    Welcome1
# ${delay}    50 seconds
${Sheet_Name}    Wagering
${xls_filename}    datafile_Portal_latest.xlsx
${environment}    Environment_details
${flag}
${customer_key}    QA
${i}    1
*** Test Cases ***
testcase for Wagering with Quickpick
    [TAGS]    Wagering
    Get test data from json file    ${i}
    Click on Login button    ${Loginbutton_location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box to accept terma and conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}
    Click on Sign in Button    ${Signin_Location}
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    # ${totalLoyalty}=     Get Total Loyalty
    # Log    LoyaltyBalance=${totalLoyalty}
    Click on Draw Games    ${Draw_Games_location}
    Select Game from the list    ${Game_Name}    ${bet_type}    ${draw_name}

    Do Quick Pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}
    # Do Manual pick by selecting No of Boards     ${No_Boards}    ${Game_Name}
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
    

    
    
    
