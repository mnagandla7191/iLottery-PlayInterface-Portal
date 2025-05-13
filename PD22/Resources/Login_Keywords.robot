*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}
${url}
${Email}
${password}
${delay}    30
${Login_Button__xpath}    //button[text()='Login ']
${username_xpath}    //*[@id="loginModal-username"]    
${password_xpath}    //input[@id='loginModal-password']
${Sign_In_Button_xpath}    //button[@name='loginSubmit' or @id='loginButton']
${Menu_xpath}    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
${Logo_xpath}    //a[@class="nav-logo"]
${Cancel_consents_xpath}    //button[@id='newConsentAvailableModalCancel']
# ${balance_xpath}     //span[@class='account-nav__players-balance']/span[@class='account-nav__label']
# ${rpoints_xpath}    //span[@class='account-nav__players-points']/span[@class='account-nav__label']
${logout_button}    //*[text()=' Logout']
${balance}
${reward_points}
*** Keywords ***
Click on Login button
    wait until page contains element    ${Login_Button__xpath}    ${delay}
    sleep   3 seconds
    Click Element   ${Login_Button__xpath}
    
Enter User Name and Password
    [Arguments]    ${Email}    ${password}
     wait until page contains element    ${username_xpath}    ${delay}
     sleep   2 seconds 
    Click Element  ${username_xpath}
    Input Text    ${username_xpath}    ${Email}
    Click Element    ${password_xpath}
    Input Text    ${password_xpath}    ${password}
    sleep   3 seconds
Click Sign in Button
    Click Element    ${Sign_In_Button_xpath}
    sleep   5 seconds
    ${Result}=     Run Keyword And Return Status   wait until page contains element    ${Cancel_consents_xpath}    ${delay} 
    sleep   10 seconds   
    # Run Keyword If    ${Result}    Click Element    ${Cancel_consents_xpath}
    wait until page contains element    ${Menu_xpath}       ${delay}
    sleep   3 seconds
    # Click Element   ${Logo_xpath}
    # wait until page contains element       ${Menu_xpath}    ${delay}
    # sleep   2 seconds
Click on Sign in for First time
    wait until page contains element     ${Sign_In_Button_xpath}       ${delay}
    sleep   2 seconds
    Click Element    ${Sign_In_Button_xpath}
    Sleep    15 seconds
        
# Get current balance and reward points of a player
    # ${balance}    get text    ${balance_xpath}
    # ${reward_points}    get text    ${rpoints_xpath}

     # [return]    ${balance}    ${reward_points}  
    
Logout from portal page
    sleep    2 seconds
    Click Element    ${Menu_xpath}
    sleep    2 seconds
    Wait Until Element Is Visible   ${logout_button}    ${delay}
    Click Element    ${logout_button}
    sleep    2 seconds
      
    
   