
*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../Libs/Common_base.py
Library    ../Control_Pages.py
Resource   ../Resources/Common.robot
Resource   ../Resources/Control_Keywords.robot

Test Teardown    Test Clean Up
# Suite Setup   BeforeSuite    ${browser}    ${url}    ${Email}    ${password}    ${flag}
# Suite Teardown  AfterSuite
*** Variables ***
${browser_type}    Chrome
${url}    https://portal-q2.igtilotterycmdtest.com/en-us/home.html
${igtcontrol_url}    https://control-rnd-lot-cmd-q2-northeurope.igtilotterycmdtest.com/igtcontrol/
${Sheet_Name}    Registration
${xls_filename}    datafile_Portal.xls
${environment}    Environment_details
${Player Type}    Full Registration Level
${Xpath_Sheet_Name}    Xpaths
${Player_details_sheet}    Registration_Control
${facebook_url}    https://www.facebook.com/
${facebook_mailid}    nmnprasad@yahoo.com
${facebook_password}    maruthisivaram
*** Test Cases ***
testcase for Register New Player from Control
    [TAGS]    Register
    ${res}=    readxl    ${Sheet_Name}    ${xls_filename}
    ${xpaths_data}=    read xpaths from xlsx    ${Xpath_Sheet_Name}    ${xls_filename}
    Log   ${xpaths_data}
    Log    ${res}
    ${uid_Control}    set variable       ${res[0][2]}
    ${password_Control}    set variable       ${res[0][3]}
    
    open browser    ${igtcontrol_url}    ${browser_type}
    Maximize Browser Window
    Navigate to igt Control page     ${igtcontrol_url}
    Enter User Name and Password in Control page    ${uid_Control}    ${password_Control}
    Click Login Button
    Navigate to Players icon
    Navigate to Players
    Click on Create Player
    Select Player type from the List    ${Player Type}
    Enter Player Personal details    ${xpaths_data}
    

testcase for facebook
    open browser    ${facebook_url}    ${browser_type}
    Maximize Browser Window
    Login facebook account    ${facebook_mailid}    ${facebook_password}
    Navigate to Groups
    Create a group
    # Add group members
    # Add Post
    # delete member from group
    # Logout from facebook
    
    
    
    
    