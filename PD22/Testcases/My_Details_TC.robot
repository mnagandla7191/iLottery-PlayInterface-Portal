 
*** Settings ***
Library    SeleniumLibrary
Library    ../Libs/Common_base.py
Library    ../Libs/Home_Page.py
Library    ../Libs/My_Details_Page.py
Resource    ../Resources/Common.robot
Resource    ../Resources/Login_Keywords.robot
Resource    ../Resources/Control_Keywords.robot
Resource    ../Resources/My_Details_Keywords.robot
Resource    ../Resources/Registration_Keywords.robot

# Test Teardown    Test Clean Up    ${browser_type}    ${url}     ${Email}    ${password}
Test Teardown    Test Clean Up
*** Variables ***
${browser_type}
${url}
${igtcontrol_url}
${delay}    15 seconds
${Sheet_Name}    My_details
${xls_filename}    datafile_Portal.xls
${environment}    Environment_details
${fname}
${fname_new}
*** Test Cases ***
testcase for My Details page first name verification and update
    [TAGS]    Update_Profile    
    ${res}=    readxl   ${Sheet_Name}    ${xls_filename}
    Log    ${res}
    # ${Email}    set variable       ${res[0][0]}
    ${password}    set variable       ${res[0][1]}
    # ${fname}    set variable       ${res[0][2]}
    # ${lname}    set variable       ${res[0][3]}
    Log    ${Email}, ${password}
    
    ${res}=    readxl    ${environment}    ${xls_filename}
    ${uid_Control}    set variable       ${res[0][3]}
    ${password_Control}    set variable       ${res[0][4]}
    

    open browser    ${url}    ${browser_type}
    Maximize Browser Window 
    Settings for Headless browser    ${browser_type}
    Click on Login button
    Enter User Name and Password    ${Email}    ${password}
    Click on Sign in Button
    Click on Player Menu
    Click on My details link
    ${first_name}   Get personal details from My details page
    Log    ${first_name}
    Should Be Equal As Strings     ${fname}    ${first_name}
    Update First Name Details    ${fname_new}
    Click on Apply Changes Button
    Logout from portal page
    Navigate to igt Control page     ${igtcontrol_url}
    Enter User Name and Password in Control page    ${uid_Control}    ${password_Control}
    Click Login Button
    Navigate to Search player page
    Enter E-mail and Click Search Button    ${Email}
    Click View Button
    Click on Player Info
    Click on Player Details
    ${first_name_control}    Get Player details from control
    Should Be Equal As Strings     ${fname_new}    ${first_name_control}
    Close Browser
    




 testcase for My Details page Change Password tab
    ${res}=    readxl   ${Sheet_Name}    ${xls_filename}
    Log    ${res}
    ${Email}    set variable       ${res[0][0]}
    ${password}    set variable       ${res[0][1]}
    ${Current_Password}    set variable       ${res[4][0]}
    ${New_Password}    set variable       ${res[4][1]}
    ${Confrim_Password}    set variable       ${res[4][2]}
    Log    ${Email}, ${password}
    
    ${res}=    readxl    ${environment}    ${xls_filename}
    ${url}    set variable       ${res[0][0]}
    ${browser_type}    set variable       ${res[0][1]}

    open browser    ${url}    ${browser_type}
    Maximize Browser Window
    Click on Login button
    Enter User Name and Password    ${Email}    ${password}
    Click on Sign in Button
    Click on Player Menu
    Click on My details link
    Click on Change password Tab
    Enter Current Password    ${Current_Password}
    Enter New Password    ${New_Password}
    Enter Confirm Password    ${Confrim_Password}
    Click on Save Changes Button
    Logout from portal page
    Close Browser
    
    
    
    



    