*** Comments ***

*** Settings ***
Library    ../Libs/Common_Base_Repo.py
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/HomePage.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/Control_Keywords.robot

# Suite Setup   BeforeSuite    
# Suite Teardown  AfterSuite
# Test Teardown    Test Clean Up 

*** Variables ***

${Sheet_Registration_Paths}    Registration_Paths
${Sheet_Registration_Data}    Registration_Data
${Sheet_Login_Paths}    Login_Paths
${xlsx_filename}    datafile_Portal.xlsx
${browser_type}    Chrome
${url}    https://sit-play.kylottery.com/
${igtcontrol_url}    https://control-kys-lot-cmd-s1-northeurope.igtilotterycmdtest.com/igtcontrol/
${uid_Control}    1
${password_Control}    1
# ${email_code_mail_path}    //div[text()='New Email Address Verification']/parent::td/parent::tr/td[6]//button
${email_code_mail_path}    //tr[2]//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained tableActionButton MuiButton-containedPrimary MuiButton-containedSizeSmall MuiButton-sizeSmall MuiButton-disableElevation']
${verified_text_Loc}    //div[@id='verifiedContactModal']//h1
${expected_text}    Email Verified!
*** Test Cases ***
Test case for Full Registration with valid values
    [TAGS]    Full Registration    smoke    Regression
    Get Registarion data from excel
    Get Registarion paths from excel
    Get Login Paths from excel
    Open Browser with Portal url  ${browser_type}     ${url}
    Maximize Browser Window 
    Click on Signup Button    ${Register_loc}
    Sleep    5 seconds
    Enter Firstname    ${Firstname_loc}    ${Firstname}
    Enter Last name    ${Lastname_loc}    ${Lastname}
    Enter new Email    ${New_Email_loc}    ${New_Email}
    Enter confirm Email    ${Confirm_Email_loc}    ${Confirm_Email}
    Enter Mobile Number    ${Mobile_loc}    ${Mobile}
    Enter new password    ${password_loc}    ${password}
    Enter Confirm password    ${Confirm_password_loc}    ${Confirm_password}
    Click on Next Button    ${Next_button_loc}
    Sleep    5 seconds
    Enter Address details    ${Address_loc}    ${Address}
    Enter City    ${Town_loc}    ${Town}
    Enter Zip Code    ${ZipCode_loc}    ${ZipCode}
    Enter DOB   ${dob_date_loc}    ${dob_date}
    Enter SSN Number    ${SSN_loc}    ${SSN}
#   Select State    ${State_loc}    ${State}
    
    Accept terms and conditions check box    ${TC_Check_loc}
    Click on Submit Button    ${Button_loc}
    Execute Javascript    window.open('${igtcontrol_url}');
    # Navigate to igt Control page
    Switch Window   locator=NEW     
    Control Enter User Name and Password in Control page    ${uid_Control}    ${password_Control}
    Control Click Login Button
    Control Navigate to Search player page

    Control Enter E-mail and Click Search Button    ${New_email}
    Sleep    5 seconds
    Control Click View Button
    Control Click on Communication
    Control Click on Communication History
    # Control Click on Email verification code mail
    Sleep    5 seconds
    Click on Email verification code mail    ${email_code_mail_path} 
    ${email_code}    Get_email_verification_code_from_control
    Switch Window   MAIN
    Enter email code    id:code    ${email_code}
    Click on Verify button    //button[text()='Verify']
    ${actual_text}    Get text Message from email verified popup    ${verified_text_Loc}
    Should Be Equal As strings    ${actual_text}    ${expected_text}
    Click on Login button in Email verified popup    //button[@id='closeNOpenLoginModal']
    enter User Name    ${Username_Location}    ${New_Email}
    enter Password    ${password_Location}    ${Password}
    # Accept terms and conditions check box    ${Agree_TC_location}
    Click on Sign in Button with new user    ${Signin_Location}



Get verification code from Control
    Open Browser with Portal url  ${browser_type}     ${url}
    Maximize Browser Window 
    Execute Javascript    window.open('${igtcontrol_url}');
    # Navigate to igt Control page
    Switch Window   locator=NEW     
    Control Enter User Name and Password in Control page    ${uid_Control}    ${password_Control}
    Control Click Login Button
    Control Navigate to Search player page
    Control Enter E-mail and Click Search Button    ${New_email}
    Control Click View Button
    Control Click on Communication
    Control Click on Communication History
    Switch Window   locator=NEW 
    # Control Click View button on ContactVerification Email
    # Control Click on Email verification link
    # Control Navigate to igt Cloud Portal page     ${url}
    # Control Click on Login button
    # Control Enter User Name and Password    ${New_email}    ${New_password}
    # Click on Sign in for First time

test to Switch Window
    Open Browser with Portal url  ${browser_type}     ${url}
    
    
*** Keywords ***
Get Registarion paths from excel

    ${reg_paths}=    import data from xlsx    ${Sheet_Registration_Paths}    ${xlsx_filename}
    
    Log    ${reg_paths}
    

    ${Reg_button_Location}    set variable       ${reg_paths[0][1]}
    ${New_Email_loc}    set variable       ${reg_paths[1][1]}
    ${Confirm_Email_loc}    set variable       ${reg_paths[2][1]}
    ${password_loc}    set variable       ${reg_paths[3][1]}
    ${Confirm_password_loc}    set variable       ${reg_paths[4][1]}
    ${SecurityQ_loc}    set variable       ${reg_paths[5][1]}
    ${Agree_Continue_buton_Location}    set variable       ${reg_paths[6][1]}
    ${answer_loc}    set variable       ${reg_paths[7][1]}
    ${Close_popup}    set variable       ${reg_paths[8][1]}
    ${Draw_games_Location}    set variable       ${reg_paths[9][1]}
    ${Select_game}    set variable       ${reg_paths[10][1]}
    ${BuyNow_loc}    set variable       ${reg_paths[11][1]}
    ${Register_loc}    set variable       ${reg_paths[12][1]}
    ${Accept_button_Full_loc}    set variable       ${reg_paths[13][1]}
    ${citizen_loc}    set variable       ${reg_paths[14][1]}
    ${lang_loc}    set variable       ${reg_paths[15][1]}
    ${Next_button_loc}    set variable       ${reg_paths[16][1]}
    ${Firstname_loc}    set variable       ${reg_paths[17][1]}
    ${Lastname_loc}    set variable       ${reg_paths[18][1]}
    ${Gender_loc}    set variable       ${reg_paths[19][1]}
    ${dob_date_loc}    set variable       ${reg_paths[20][1]}
    ${Address_loc}    set variable       ${reg_paths[21][1]}
    ${Town_loc}    set variable       ${reg_paths[22][1]}
    ${ZipCode_loc}    set variable       ${reg_paths[23][1]}
    ${State_loc}    set variable       ${reg_paths[24][1]}
    ${SSN_loc}    set variable       ${reg_paths[25][1]}
    ${Country_loc}    set variable       ${reg_paths[26][1]}
    ${Mobile_loc}    set variable       ${reg_paths[27][1]}
    ${TC_Check_loc}    set variable       ${reg_paths[28][1]}
    ${Button_loc}    set variable       ${reg_paths[29][1]}
    Set Global Variable    ${Reg_button_Location}
    Set Global Variable    ${New_Email_loc}
    Set Global Variable    ${Confirm_Email_loc}
    Set Global Variable    ${password_loc}
    Set Global Variable    ${Confirm_password_loc}
    Set Global Variable    ${SecurityQ_loc}
    Set Global Variable    ${Agree_Continue_buton_Location}
    Set Global Variable    ${answer_loc}
    Set Global Variable    ${Close_popup}
    Set Global Variable    ${Draw_games_Location}
    Set Global Variable    ${Select_game}
    Set Global Variable    ${BuyNow_loc}
    Set Global Variable    ${Register_loc}
    Set Global Variable    ${Accept_button_Full_loc}
    Set Global Variable    ${citizen_loc}
    Set Global Variable    ${lang_loc}
    Set Global Variable    ${Next_button_loc}
    Set Global Variable    ${Firstname_loc}
    Set Global Variable    ${Lastname_loc}
    Set Global Variable    ${Gender_loc}
    Set Global Variable    ${dob_date_loc}
    Set Global Variable    ${Address_loc}
    Set Global Variable    ${Town_loc}
    Set Global Variable    ${ZipCode_loc}
    Set Global Variable    ${State_loc}
    Set Global Variable    ${SSN_loc}
    Set Global Variable    ${Country_loc}
    Set Global Variable    ${Mobile_loc}
    Set Global Variable    ${TC_Check_loc}
    Set Global Variable    ${Button_loc}
    
Get Registarion Data from excel
    ${reg_data}=    import data from xlsx    ${Sheet_Registration_Data}    ${xlsx_filename}
    Log    ${reg_data}
    ${New_Email}    set variable       ${reg_data[0][1]}
    ${Confirm_Email}    set variable       ${reg_data[1][1]}
    ${password}    set variable       ${reg_data[2][1]}
    ${Confirm_password}    set variable       ${reg_data[3][1]}
    ${question}    set variable       ${reg_data[4][1]}
    ${answer}    set variable       ${reg_data[5][1]}
    ${boards}    set variable       ${reg_data[6][1]}
    ${citizen}    set variable       ${reg_data[7][1]}
    ${language}    set variable       ${reg_data[8][1]}
    ${Firstname}    set variable       ${reg_data[9][1]}
    ${Lastname}    set variable       ${reg_data[10][1]}
    ${Gender}    set variable       ${reg_data[11][1]}
    ${dob_date}    set variable       ${reg_data[12][1]}
    ${Address}    set variable       ${reg_data[13][1]}
    ${Town}    set variable       ${reg_data[14][1]}
    ${Zipcode}    set variable       ${reg_data[15][1]}
    ${State}    set variable       ${reg_data[16][1]}
    ${SSN}    set variable       ${reg_data[17][1]}
    ${Country}    set variable       ${reg_data[18][1]}
    ${Mobile}    set variable       ${reg_data[19][1]}
    Set Global Variable    ${New_Email}
    Set Global Variable    ${Confirm_Email}
    Set Global Variable    ${password}
    Set Global Variable    ${Confirm_password}
    Set Global Variable    ${question}
    Set Global Variable    ${answer}
    Set Global Variable    ${boards}
    Set Global Variable    ${citizen}
    Set Global Variable    ${language}
    Set Global Variable    ${Firstname}
    Set Global Variable    ${Lastname}
    Set Global Variable    ${Gender}
    Set Global Variable    ${dob_date}
    Set Global Variable    ${Address}
    Set Global Variable    ${Town}
    Set Global Variable    ${Zipcode}
    Set Global Variable    ${State}
    Set Global Variable    ${SSN}
    Set Global Variable    ${Country}
    Set Global Variable    ${Mobile}


Get Login Paths from excel
    ${Login_paths}=    import data from xlsx    ${Sheet_Login_Paths}    ${xlsx_filename}
    Log    ${Login_paths}
    ${Username_Location}    set variable       ${Login_paths[0][1]}
    ${password_Location}    set variable       ${Login_paths[1][1]}
    ${Loginbutton_location}    set variable       ${Login_paths[2][1]}
    ${Signin_Location}    set variable       ${Login_paths[3][1]}
    ${emailid_location}    set variable       ${Login_paths[4][1]}
    ${Agree_TC_location}    set variable       ${Login_paths[5][1]}
    ${Check_box_status}    set variable       ${Login_paths[10][1]}
    Set Global Variable    ${Username_Location}
    Set Global Variable    ${password_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${emailid_location}
    Set Global Variable    ${Agree_TC_location}
    Set Global Variable    ${Check_box_status}


        






        



