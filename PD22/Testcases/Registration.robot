*** Comments ***

*** Settings ***
Library    ../Libs/Common_Base_Repo.py
Library    ../Libs/Registration_Pages.py
Library    SeleniumLibrary
Library    Collections
Library    wagering_pages
Resource    ../Resources/HomePage.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/Control_Keywords.robot
Resource    ../Resources/Login_Keywords.robot
Resource    ../Resources/Favorites_Keywords.robot
Resource    ../Resources/Wagering_Keywords.robot

Suite Setup   BeforeSuite for Registration    
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
${i}    1
*** Test Cases **
Test Case for lite Registration
    [TAGS]    Lite Registration
    Get test data from json file    ${i}
    Click on Register button    ${Register_Location}
    Enter Email    ${Email_Location}    ${Email_data}
    Enter Password    ${Password_Location}    ${Password_data}
    Select value from secret question list    ${secq_Location}    What was the name of your first school teacher?
    Enter Secret answer    ${seca_Location}    njj
    Click on Agree and Continue button    ${Agree_conti_Location}
    Sleep    5 seconds    
    Click on Close popup    ${closeX_verification_Location}
    Click on Login in Button    ${Loginbutton_location}
    Enter Email    ${username_Location_L}    ${Email_data}
    Enter Password    ${password_Location_L}    ${Password_data}
    Click on Sign in Button    ${Signin_Location}
    # Click on Cancel button    ${Cancel_verify_pop_Location}
    # Enter User Name    ${username_Location_L}    ${Email_data}
    # Enter User Password    ${password_Location_L}    ${Password_data}
    # Click on Sign in Button    ${Signin_Location}
    # Click on upgrade button    ${Upgrade_Location}
    Click on playPreferences Continue button    ${playPreferences_Continue_Location}
    Click on upgrade button    ${Upgrade_Location}
    Click on Accept button in Privacy and Policy    ${upgradePP_Location}
    Enter First Name    ${Firstname_Location}    Maruthi
    Enter Last Name    ${LastName_Location}    Nagandla
    Select value of gender    ${Gender_Location}    Male
    Pick DOB from calender    ${DOB_Location}    Aug/12/1978  
    Enter Address    ${Address_Location}    Houseno 94
    Enter Town    ${Town_Location}    Sunnyvale
    Enter Zipcode    ${Zip_Location}    52300
    Select value of State    ${State_Location}    LA
    ${SSN_No}    generate 4 random number
    Enter SSN Number    ${SSN_Location}    ${SSN_No}
    Select value from Country    ${Country_Location}    United States
    ${Mobile_No}    generate 10 random number
    Enter Mobile Number    ${Mobile_no_Location}    ${Mobile_No}
    # Click on Tangable Rewards toggle button    Consent_TR_Location
    # Click on Accept button    ${AcceptTR_Location}
    scroll down in_page
    scroll down in_page
    Click on Terms and conditions check box    ${TC_Location}
    Click on Submit button    ${Reg_Upgrade_submit_Location}
    Click on OK button    ${OK_button_Location}    

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
    Pick DOB from calender    ${dob_date_loc}    ${dob_date}
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
    # Open Browser with Portal url  ${browser_type}     ${url}
    Get test data from json file    ${i}
    
    
*** Keywords ***

***Keywords***    
Get test data from json file
    [Arguments]    ${i}
    ${Registration_file}    Load JSON From file    Registration_data.json
    ${Register_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Register_path
    ${Register_Location}    set variable       ${Register_Location[0]} 
    Log    ${Register_Location}
    ${Email_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Email_path
    ${Email_Location}    set variable       ${Email_Location[0]} 
    Log    ${Email_Location}
    ${Email_data}    Get Value From Json    ${Registration_file}    $.Registration_data[${i}].email
    ${Email_data}    set variable       ${Email_data[0]} 
    Log    ${Email_data}
    ${Password_data}    Get Value From Json    ${Registration_file}    $.Registration_data[${i}].password
    ${Password_data}    set variable       ${Password_data[0]} 
    Log    ${Password_data}

    ${Password_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Password_path
    ${Password_Location}    set variable       ${Password_Location[0]} 
    Log    ${Password_Location}
    ${secq_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.secq_path
    ${secq_Location}    set variable       ${secq_Location[0]} 
    Log    ${secq_Location}
    ${seca_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.seca_path
    ${seca_Location}    set variable       ${seca_Location[0]} 
    Log    ${seca_Location}

    ${Agree_conti_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Agree_conti_path
    ${Agree_conti_Location}    set variable       ${Agree_conti_Location[0]} 
    Log    ${Agree_conti_Location}
    ${closeX_verification_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.closeX_verification_path
    ${closeX_verification_Location}    set variable       ${closeX_verification_Location[0]} 
    Log    ${closeX_verification_Location}
    ${Upgrade_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Upgrade_path
    ${Upgrade_Location}    set variable       ${Upgrade_Location[0]} 
    Log    ${Upgrade_Location}
    ${FirstName_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.FirstName_path
    ${FirstName_Location}    set variable       ${FirstName_Location[0]} 
    Log    ${FirstName_Location}
    ${LastName_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.LastName_path
    ${LastName_Location}    set variable       ${LastName_Location[0]} 
    Log    ${LastName_Location}
    ${DOB_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.DOB_path
    ${DOB_Location}    set variable       ${DOB_Location[0]} 
    Log    ${DOB_Location}
    ${Gender_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Gender_path
    ${Gender_Location}    set variable       ${GenderLocation[0]} 
    Log    ${Gender_Location}
    ${Address_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Address_path
    ${Address_Location}    set variable       ${Address_Location[0]} 
    Log    ${Address_Location}
    ${Town_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Town_path
    ${Town_Location}    set variable       ${Town_Location[0]} 
    Log    ${Town_Location}
    ${Zip_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Zip_path
    ${Zip_Location}    set variable       ${Zip_Location[0]} 
    Log    ${Zip_Location}
    ${State_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.State_path
    ${State_Location}    set variable       ${State_Location[0]} 
    Log    ${State_Location}
    ${SSN_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.SSN_path
    ${SSN_Location}    set variable       ${SSN_Location[0]} 
    Log    ${SSN_Location}
    ${Country_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Country_path
    ${Country_Location}    set variable       ${Country_Location[0]} 
    Log    ${Country_Location}
    ${Mobile_no_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Mobileno_path
    ${Mobile_no_Location}    set variable       ${Mobile_no_Location[0]} 
    Log    ${Mobile_no_Location}
    ${Consent_TR_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Consent_TR_path
    ${Consent_TR_Location}    set variable       ${Consent_TR_Location[0]} 
    Log    ${Consent_TR_Location}
    ${TC_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.TC_path
    ${TC_Location}    set variable       ${TC_Location[0]} 
    Log    ${TC_Location}
    ${Reg_Upgrade_submit_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Reg_Upgrade_submit_path
    ${Reg_Upgrade_submit_Location}    set variable       ${Reg_Upgrade_submit_Location[0]}    
    Log    ${Reg_Upgrade_submit_Location}
    ${Loginbutton_location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Loginbutton_location_path
    ${Loginbutton_location}    set variable       ${Loginbutton_location[0]}    
    Log    ${Loginbutton_location}
    ${username_Location_L}    Get Value From Json    ${Registration_file}    $.Registration_path_details.username_Location_path
    ${username_Location_L}    set variable       ${username_Location_L[0]}    
    Log    ${username_Location_L}
    ${password_Location_L}    Get Value From Json    ${Registration_file}    $.Registration_path_details.password_Location_path
    ${password_Location_L}    set variable       ${password_Location_L[0]}    
    Log    ${password_Location_L}
    ${Signin_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Signin_Location_path
    ${Signin_Location}    set variable       ${Signin_Location[0]}    
    Log    ${Signin_Location}
    ${Cancel_verify_pop_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.Cancel_verify_pop_path
    ${Cancel_verify_pop_Location}    set variable       ${Cancel_verify_pop_Location[0]}    
    Log    ${Cancel_verify_pop_Location}
    
    ${playPreferences_Continue_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.playPreferences_Continue_path
    ${playPreferences_Continue_Location}    set variable       ${playPreferences_Continue_Location[0]}   
    Log    ${playPreferences_Continue_Location}
    ${upgradePP_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.upgradePP_path
    ${upgradePP_Location}    set variable       ${upgradePP_Location[0]}   
    Log    ${upgradePP_Location}
    ${OK_button_Location}    Get Value From Json    ${Registration_file}    $.Registration_path_details.OK_path
    ${OK_button_Location}    set variable       ${OK_button_Location[0]}   
    Log    ${OK_button_Location}
    
    

    Set Global Variable    ${Register_Location}
    Set Global Variable    ${Email_Location}
    Set Global Variable    ${Password_Location}
    Set Global Variable    ${Email_data}
    Set Global Variable    ${Password_data}
    Set Global Variable    ${secq_Location}
    Set Global Variable    ${seca_Location}
    Set Global Variable    ${Agree_conti_Location}
    Set Global Variable    ${closeX_verification_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${username_Location_L}
    Set Global Variable    ${password_Location_L}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${Upgrade_Location}
    Set Global Variable    ${Cancel_verify_pop_Location}
    Set Global Variable    ${playPreferences_Continue_Location}
    Set Global Variable    ${upgradePP_Location}

    Set Global Variable    ${FirstName_Location}
    Set Global Variable    ${LastName_Location}
    Set Global Variable    ${DOB_Location}
    Set Global Variable    ${Address_Location}
    Set Global Variable    ${Town_Location}
    Set Global Variable    ${Zip_Location}
    Set Global Variable    ${State_Location}
    Set Global Variable    ${SSN_Location}
    Set Global Variable    ${Country_Location}
    Set Global Variable    ${Mobile_no_Location}
    Set Global Variable    ${Consent_TR_Location}
    Set Global Variable    ${TC_Location}
    Set Global Variable    ${Reg_Upgrade_submit_Location}    
    Set Global Variable    ${Gender_Location}
    Set Global Variable    ${OK_button_Location}
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


        






        



