*** Comments ***

*** Settings ***
Library    ../Libs/Common_Base_Repo.py
Library    ../Libs/Loginpage.py
Library    SeleniumLibrary
Library    OperatingSystem
Library    JSONLibrary

# Resource    ../Resources/HomePage.robot
Resource    ../Resources/Common.robot
Suite Setup   BeforeSuite    
Suite Teardown  AfterSuite
Test Teardown    Test Clean Up 
*** Variables ***
${Sheet_Login_Data}    Login_Data
${Sheet_Login_Paths}    Login_Paths
${xlsx_filename}    datafile_Portal.xlsx
${browser_type}    Chrome
${url}    https://sit-play.kylottery.com/
*** Test Cases ***
Get Data and paths from excel
    # Get Login Paths from excel
    # Get Login Data from excel
    # Get Login Data from json file
    Get Data from Json file


Test case to verify functionality of Login without entering username and password
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Get Login Paths from excel
    # Get Login Data from excel
    Click on Login button    ${Loginbutton_location}
    Click on Sign in Button    ${Signin_Location}
    ${user_id_error_message}    Get Error Message displayed in Portal page    ${Error_user_id_loc}
    ${Password_error_message}    Get Error Message displayed in Portal page    ${Error_Password_Loc}
    Should Be Equal As strings    ${without_user_name}    ${user_id_error_message}
    Should Be Equal As strings    ${without_Password}    ${Password_error_message}

Test case to verify functionality of Login without entering Login details
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Get Login Paths from excel
    # Get Login Data from excel
    # Click on Login button    ${Loginbutton_location}
    enter Password    ${password_Location}    ${Password}
    Click on Sign in Button    ${Signin_Location}
    ${Actual_error_message}    Get Error Message displayed in Portal page    ${Error_user_id_loc}
    Should Be Equal As strings    ${without_user_name}    ${Actual_error_message}
Test case to verify functionality of Login without entering Password details
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Get Login Paths from excel
    # Get Login Data from excel
    # Click on Login button    ${Loginbutton_location}
    Clear password field    ${password_Location}
    enter User Name    ${username_Location}    ${invalid_user_name}
    Click on Sign in Button    ${Signin_Location}
    ${Actual_error_message}    Get Error Message displayed in Portal page    ${Error_Password_Loc}
    Should Be Equal As strings    ${without_Password}    ${Actual_error_message}

Test case to verify functionality of Login with invalid credentials
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Get Login Paths from excel
    # Get Login Data from excel
    # Click on Login button    ${Loginbutton_location}
    
    Clear user name field    ${username_Location}
    Clear password field    ${password_Location}
    enter User Name    ${username_Location}    ${invalid_user_name}
    enter Password    ${password_Location}    ${invalid_Password}
    Click on Sign in Button    ${Signin_Location}
    ${Actual_error_message}    Get Error Message displayed in Portal page    ${Error_Message_Loc} 
    Should Be Equal As strings    ${invalid_Credentials}    ${Actual_error_message}
Test case to verify functionality of Login without accepting Terms and Conditions
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Get Login Paths from excel
    # Get Login Data from excel
    # Click on Login button    ${Loginbutton_location}
    Clear user name field    ${username_Location}
    Clear password field    ${password_Location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Uncheck Terms and Conditions check box    ${Check_box_status}    
    Click on Sign in Button    ${Signin_Location}
    ${Actual_error_message}    Get Error Message displayed in Portal page    ${Error_Message_uncheck_TC_Location}
    Should Be Equal As strings    ${without_Acceptence}    ${Actual_error_message}
Test case to verify functionality of Login with valid credentials
    [TAGS]    Login_Testing    smoke    Regression
    # Open Browser with Portal url  ${browser_type}     ${url}
    # Maximize Browser Window
    # Get Login Paths from excel
    # Get Login Data from excel
    # Click on Login button    ${Loginbutton_location}
    Clear user name field    ${username_Location}
    Clear password field    ${password_Location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box and Agree Terms and Conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}

*** Keywords ***

Get Data from Json file
    ${file}    Load JSON From file    Login_data.json
    # FOR    ${counter}    IN RANGE    ${len}
    # for i in data['emp_details']:
    # print(i)
    Log To Console    ${file}
    ${user_name}    Get Value From Json    ${file}    Login_data.username
    ${user_name}    set variable       ${user_name[0]} 
    Log    ${user_name}
    ${password}    Get Value From Json    ${file}    Login_data.password
    ${password}    set variable       ${password[0]}
    Log    ${password}
    ${without_user_name}    Get Value From Json    ${file}    Login_data.error_messages.message1
    ${without_user_name}    set variable       ${without_user_name[0]}
    Log    ${without_user_name}
    ${without_Password}    Get Value From Json    ${file}    $.Login_data.error_messages.message2
    ${without_Password}    set variable       ${without_Password[0]}
    Log    ${without_Password}
    ${without_Acceptence}    Get Value From Json    ${file}    $.Login_data.error_messages.message3
    ${without_Acceptence}    set variable       ${without_Acceptence[0]}
    Log    ${without_Acceptence}
    ${invalid_Credentials}    Get Value From Json    ${file}    $.Login_data.error_messages.message4
    ${invalid_Credentials}    set variable       ${invalid_Credentials[0]}
    Log    ${invalid_Credentials}
    ${invalid_user_name}    Get Value From Json    ${file}    $.Login_data.invalid_user_name
    ${invalid_user_name}    set variable       ${invalid_user_name[0]}
    Log    ${invalid_user_name}
    ${invalid_Password}    Get Value From Json    ${file}    $.Login_data.invalid_Password
    ${invalid_Password}    set variable       ${invalid_Password[0]}
    Log    ${invalid_Password}
    ${username_Location}    Get Value From Json    ${file}    Login_path.username_path
    ${username_Location}    set variable       ${username_Location[0]} 
    Log    ${username_Location}
    ${password_Location}    Get Value From Json    ${file}    Login_path.password_path
    Log    ${password_Location}
    ${password_Location}    set variable       ${password_Location[0]}
    ${Loginbutton_location}    Get Value From Json    ${file}    Login_path.Loginbutton_path
    Log    ${Loginbutton_location}
    ${Loginbutton_location}    set variable       ${Loginbutton_location[0]}
    ${Signin_Location}    Get Value From Json    ${file}    Login_path.Signin_path
    Log    ${Signin_Location}
    ${Signin_Location}    set variable       ${Signin_Location[0]}
    ${emailid_location}    Get Value From Json    ${file}    Login_path.emailid_path
    Log    ${emailid_location}
    ${emailid_location}    set variable       ${emailid_location[0]}
    ${Agree_TC_location}    Get Value From Json    ${file}    Login_path.Agree_TC_path
    Log    ${Agree_TC_location}
    ${Agree_TC_location}    set variable       ${Agree_TC_location[0]}
    ${Error_Message_Loc}    Get Value From Json    ${file}    Login_path.Error_Message_path
    Log    ${Error_Message_Loc}
    ${Error_Message_Loc}    set variable       ${Error_Message_Loc[0]}
    ${Error_Message_Username_Location}    Get Value From Json    ${file}    Login_path.Error_Message_Username_path
    Log    ${Error_Message_Username_Location}
    ${Error_user_id_loc}    set variable       ${Error_Message_Username_Location[0]}
    ${Error_Message_password_Location}    Get Value From Json    ${file}    Login_path.Error_Message_password_path
    Log    ${Error_Message_password_Location}
    ${Error_Password_Loc}    set variable       ${Error_Message_password_Location[0]}
    ${Error_Message_uncheck_TC_Location}    Get Value From Json    ${file}    Login_path.Error_Message_uncheck_TC_path
    Log    ${Error_Message_uncheck_TC_Location}
    ${Error_Message_uncheck_TC_Location}    set variable       ${Error_Message_uncheck_TC_Location[0]}
    ${Agree_TC_Check_box_status_Loc}    Get Value From Json    ${file}    Login_path.Agree_TC_Check_box_status_path
    Log    ${Agree_TC_Check_box_status_Loc}
    ${Check_box_status}    set variable       ${Agree_TC_Check_box_status_Loc[0]}

    Set Global Variable    ${user_name}
    Set Global Variable    ${Password}
    Set Global Variable    ${without_user_name}
    Set Global Variable    ${without_Password}
    Set Global Variable    ${without_Acceptence}
    Set Global Variable    ${invalid_Credentials}
    Set Global Variable    ${invalid_user_name}
    Set Global Variable    ${invalid_Password}
    Set Global Variable    ${username_Location}
    Set Global Variable    ${password_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${emailid_location}
    Set Global Variable    ${Agree_TC_location}
    Set Global Variable    ${Error_Message_Loc}
    Set Global Variable    ${Error_user_id_loc}
    Set Global Variable    ${Error_Password_Loc}
    Set Global Variable    ${Error_Message_uncheck_TC_Location}
    Set Global Variable    ${Check_box_status}

   
    
    