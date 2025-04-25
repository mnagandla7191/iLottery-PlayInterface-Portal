
*** Settings ***
Library    SeleniumLibrary
Library     Collections
# Library    ../Libs/Common_base.py
Library    ../Libs/Home_Page.py
Library    ../Libs/My_Subscription_Pages.py
Library    ../Libs/My_Activity_Pages.py
Library    ../Libs/Common_base_portal.py
Library    ../Libs/Wagering_Pages.py
Resource    ../Resources/Common.robot
Resource    ../Resources/Login_Keywords.robot
Resource    ../Resources/Wagering_Keywords.robot
Resource    ../Resources/My_Activity_Keywords.robot
Resource    ../Resources/My_Subscriptions_Keywords.robot

# Library    ../libs/Common_Base_Repository.py
Test Teardown    Test Clean Up
Suite Setup   BeforeSuite    ${browser}    ${url}    ${Email}    ${password}    ${flag}
# Suite Teardown  AfterSuite
*** Variables ***
${browser_type}    Chrome
${url}    https://kyssit2.igtilotterycmdtest.com/en-us/home.html
${Email}    maruthi155@igt.com    
${password}    Welcome1
# ${delay}    50 seconds
${Sheet_Name}    Subscriptions
${xls_filename}    datafile_Portal_latest.xlsx
${environment}    Environment_details
${flag}    0
${customer_key}    KY
${sub_flag}    1
${No_draws}    4
*** Test Cases ***
testcase for Subscription from Supscription page
    [TAGS]    Subscription
    # ${res}=    readxl    ${Sheet_Name}    ${xls_filename}
    ${res}=    Import Data From Xlsx    ${Sheet_name}    ${xls_filename}
    Log    ${res}
    # ${Email}    set variable       ${res[0][0]}
    # ${password}    set variable       ${res[0][1]}
    ${Game_Name}    set variable       ${res[0][2]}
    ${No_Boards}    set variable       ${res[0][3]}
    ${bet_type}    set variable       ${res[0][4]}
    ${draw_name}    set variable       ${res[0][5]}
    ${No_draws}    set variable       ${res[0][6]}
    Log    ${Email}, ${password}, ${Game_Name}, ${No_Boards}
    
    ${res}=    import data from xlsx    ${environment}    ${xls_filename}
    ${url}    set variable       ${res[0][0]}
    ${browser_type}    set variable       ${res[0][1]}
    ${customer_key}    set variable       ${res[0][2]}    
    # open browser    ${url}    ${browser_type}
    # Maximize Browser Window
    # Click on Login button
    # Enter User Name and Password    ${Email}    ${password}
    # Click on Sign in Button
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    # ${totalLoyalty}=     Get Total Loyalty
    # Log    LoyaltyBalance=${totalLoyalty}
    Click on Player Menu
    Click on My Subscriptions link
    Click on Create New Subscription button
    Select Game From Subscriptions games list    ${Game_Name}
    Do Quick Pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}    ${flag}    ${sub_flag}
    Select No of Draws    ${No_draws}
    Click on Activate Subscription button
    Select check box to Certify age and boundaries of the player
    Click on Save or Activate Subscription
    Click Confirm button
    Sleep    5 seconds
    Close Browser





