*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    String
Library    ../Libs/Common_Base_Repo.py
*** Variables ***
${browser}
${url}
${Email}
${password}
${delay}    20
${Login_Button__xpath}    //button[1] | //button[text()='Login ']
${username_xpath}    //*[@id="loginModal-username"]  
${password_xpath}    //input[@id='loginModal-password']
${Sign_In_Button_xpath}    //button[@name='loginSubmit' or @id='loginButton']
${Menu_xpath}    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
${Logo_xpath}    //a[@class="nav-logo"]
${Cancel_consents_xpath}    //button[@id='newConsentAvailableModalCancel']
${environment}    Environment_details
${xls_filename}    datafile_Portal.xlsx
${myaccount_dropdown}    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
${Sheet_Name}    Wagering
*** Keywords ***

Test Clean Up
    # [Arguments]    ${browser}    ${url}    ${Email}    ${password}
    Run Keyword If Test Failed    Capture Page Screenshot
    # Run Keyword If Test Failed    Reopen Browser to continue    ${browser}    ${url}    ${Email}    ${password}
    
AfterSuite
    Close Browser
    
     
BeforeSuite
    # [Arguments]    ${browser}    ${url}
 
    # ${res}=    import_data_from_xlsx    ${environment}    ${xls_filename}
    # ${url}    set variable       ${res[0][0]}
    # ${browser}    set variable       ${res[0][1]}
    Get environment details from Json file
    Get Login details from json file
    open browser    ${url}    ${browser}
    Maximize Browser Window
    Click on Login button    ${Loginbutton_location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box to accept terma and conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}   

BeforeSuite for Registration
    # [Arguments]    ${browser}    ${url}
 
    # ${res}=    import_data_from_xlsx    ${environment}    ${xls_filename}
    # ${url}    set variable       ${res[0][0]}
    # ${browser}    set variable       ${res[0][1]}
    Get environment details from Json file
    Get Login details from json file
    open browser    ${url}    ${browser}
    Maximize Browser Window
  
    
Get Login details from json file
    ${Login_file}    Load JSON From file    Login_data.json

    Log To Console    ${Login_file}
    ${user_name}    Get Value From Json    ${Login_file}    Login_data.username
    ${user_name}    set variable       ${user_name[0]} 
    Log    ${user_name}
    ${password}    Get Value From Json    ${Login_file}    Login_data.password
    ${password}    set variable       ${password[0]}
    Log    ${password}
    ${username_Location}    Get Value From Json    ${Login_file}    $.Login_path.username_path
    ${username_Location}    set variable       ${username_Location[0]} 
    Log    ${username_Location}
    ${password_Location}    Get Value From Json    ${Login_file}    $.Login_path.password_path
    Log    ${password_Location}
    ${password_Location}    set variable       ${password_Location[0]}

    ${Loginbutton_location}    Get Value From Json    ${Login_file}    $.Login_path.Loginbutton_path
    Log    ${Loginbutton_location}
    ${Loginbutton_location}    set variable       ${Loginbutton_location[0]}

    ${Signin_Location}    Get Value From Json    ${Login_file}    $.Login_path.Signin_path
    Log    ${Signin_Location}
    ${Signin_Location}    set variable       ${Signin_Location[0]}
    ${Agree_TC_Check_box_status_Loc}    Get Value From Json    ${Login_file}    $.Login_path.Agree_TC_Check_box_status_path
    Log    ${Agree_TC_Check_box_status_Loc}
    ${Check_box_status}    set variable       ${Agree_TC_Check_box_status_Loc[0]}
    Set Global Variable    ${user_name}
    Set Global Variable    ${Password}
    Set Global Variable    ${username_Location}
    Set Global Variable    ${password_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${Check_box_status}

Get environment details from Json file
    ${file}    Load JSON From file    Environment_details.json
    ${browser}    Get Value From Json    ${file}    Environment_details.browser
    ${browser}    set variable       ${browser[0]} 
    Log    ${browser}
    ${url}    Get Value From Json    ${file}    Environment_details.portal_url
    ${url}    set variable       ${url[0]}
    Log    ${url}
    Set Global Variable    ${browser}
    Set Global Variable    ${url}



Reopen Browser to continue
    [Arguments]    ${browser}    ${url}    ${Email}    ${password}
    Close Browser
    ${res}=    readxl_new    ${environment}    ${xls_filename}
    ${url}    set variable       ${res[0][0]}
    ${browser_type}    set variable       ${res[0][1]}
    open browser    ${url}    ${browser_type}
    Maximize Browser Window
    Click Element   ${Login_Button__xpath}
     ${Result}=     Run Keyword And Return Status   Element Should Be Visible    ${Cancel_consents_xpath}
    Run Keyword If    ${Result}    Click Element    ${Cancel_consents_xpath}
    Wait Until Element Is Visible    ${Menu_xpath}       ${delay}
    Click Element   ${Logo_xpath}
    Wait Until Element Is Visible       ${Menu_xpath}    ${delay}
    
Click Player Menu
    Wait Until Element Is Visible    ${myaccount_dropdown}      ${delay}
    Click Element   ${myaccount_dropdown}
    
    
    
    
Get Total Balance
    Sleep                                    5
    Wait Until Element Is Visible    //div[@id="accountBarDesktop"]//*/a[1]/span/span[3]    ${delay}
    ${totalAmount}=	                         Get Text	          //div[@id="accountBarDesktop"]//*/a[1]/span/span[3]
    ${totalAmount}=                          Remove String	      ${totalAmount}   ,    ,    $
    ${totalAmount}=                          Convert To Number    ${totalAmount}
    Log                                      Total Amount, ${totalAmount}
    Return From Keyword                      ${totalAmount}

Get Total Loyalty
    Sleep                                    5
    ${totalLoyalty}=                         Get Text	          //div[@id="accountBarDesktop"]//*/a[2]/span/span[3]
    ${totalLoyalty}=                         Remove String	      ${totalLoyalty}   ,    ,
    Log                                      Total Loyalty, ${totalLoyalty}
    Return From Keyword                      ${totalLoyalty}
    
Get Purchase Amount
    Sleep                                    5
    ${transactionsLink}=                     Set Variable        //*[@id="wagerconfirm"]/p[4]/a[1]
    Click Element                            ${transactionsLink}  
    Sleep                                    5
    ${transactionAmount}=                    Get Text            //*[@class="txHistory-results"]/tr[1]/td[@title="Amount"]
    ${transactionAmount}=                    Remove String	     ${transactionAmount}   ,    ,    $
    Log                                      Transaction Amount, ${transactionAmount}
    Return From Keyword                      ${transactionAmount}
    
Logout from application
    Wait Until Element Is Visible    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a    ${delay}
    Click Element    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
    sleep    5 seconds
    Wait Until Element Is Visible   //*[text()=' Logout']    ${delay}
    Click Element    //*[text()=' Logout']
    sleep    10 seconds


Test Clean Up for accessibility
    Run Keyword If Test Failed    Capture Page Screenshot
    

    
    
    