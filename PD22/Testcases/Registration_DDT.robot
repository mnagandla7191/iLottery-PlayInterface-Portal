*** Settings ***
Library    ../Libs/Common_Base_Repo.py
Library    SeleniumLibrary
Library  DataDriver    datafile_Portal.xlsx    sheet_name=Registration_Data_DDT
Test Template  Test case for Full Registration using direct registration url
*** Variables ***

${Sheet_Registration_Paths}    Registration_Paths
${Sheet_Registration_Data}    Registration_Data
${xlsx_filename}    datafile_Portal.xlsx
*** Test Cases ***
Full Registration for Base Line Player     ${New_Email}    ${Confirm_Email}    ${password}    ${Confirm_password}    ${question}    ${answer}    ${boards}    ${citizen}    ${language}    ${Firstname}    ${Lastname}    ${Gender}    ${dob_date}    ${Address}    ${Town}    ${Zipcode}    ${State}    ${SSN}    ${Country}    ${Mobile}
    [TAGS]    Registration DDT

*** Keywords ***
Test case for Full Registration using direct registration url
    [Arguments]    ${New_Email}    ${Confirm_Email}    ${password}    ${Confirm_password}    ${question}    ${answer}    ${boards}    ${citizen}    ${language}    ${Firstname}    ${Lastname}    ${Gender}    ${dob_date}    ${Address}    ${Town}    ${Zipcode}    ${State}    ${SSN}    ${Country}    ${Mobile}
#     Get Registarion data from excel
    Get Registarion paths from excel
    open browser    https://portal-q2.igtilotterycmdtest.com/content/interactive/igaming/en/registration.html    Chrome
    Maximize Browser Window
    Sleep    10s
    Click on Accept button    ${Accept_button_Full_loc}
    Enter new Email    ${New_Email_loc}    ${New_Email}
    Enter confirm Email    ${Confirm_Email_loc}    ${Confirm_Email}
    Enter new password    ${password_loc}    ${password}
    Enter Confirm password    ${Confirm_password_loc}    ${Confirm_password}
    Select citizenship    ${citizen_loc}    ${citizen}
    Select language    ${lang_loc}    ${language}
    Select Security Question    ${SecurityQ_loc}    ${question}
    Enter answer    ${answer_loc}    ${answer}
    Click on Next Button    ${Next_button_loc}
    Sleep    10s
    Enter Firstname    ${Firstname_loc}    ${Firstname}
    Enter Last name    ${Lastname_loc}    ${Lastname}
    Select Gender    ${Gender_loc}    ${Gender}
    Pick DOB from calender    ${dob_date_loc}    ${dob_date}
    Enter Address details    ${Address_loc}    ${Address}
    Enter Town    ${Town_loc}    ${Town}
    Enter Zip Code    ${ZipCode_loc}    ${ZipCode}
    Select State    ${State_loc}    ${State}
    Enter SSN Number    ${SSN_loc}    ${SSN}
    Select Country    ${Country_loc}    ${Country}
    Enter Mobile Number    ${Mobile_loc}    ${Mobile}
    # Select Consents ${Consents_loc}    ${Consents}
    Accept terms and conditions check box    ${TC_Check_loc}
    Click on Submit Button    ${Button_loc}
    

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