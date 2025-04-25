*** Settings ***
Library    SeleniumLibrary
Library    ../Libs/Registration_Pages.py
*** Variables ***
${delay}    50

*** Keywords ***

    
Navigate to igt Control page
    [Arguments]     ${igtcontrol_url}
     Go to    ${igtcontrol_url}
     
Control Navigate to igt Cloud Portal page
    [Arguments]     ${igtcloud_url}
     Go to    ${igtcloud_url}
    
    
Control Enter User Name and Password in Control page
    [Arguments]    ${Userid_Control}    ${password_Control}
    Sleep    15 seconds
    wait until page contains element   //input[@name='username']    ${delay}
    Click Element   //input[@name='username']
    Input Text    //input[@name="username"]    ${Userid_Control}
    Click Element   //input[@name='password']
    Input Text    //input[@name="password"]    ${password_Control}
    
Control Click Login Button
    wait until page contains element   //button/span[text()='Login']    ${delay}
    Click Element    //button/span[text()='Login']
    
Control Navigate to Search player page
    wait until page contains element   //ul/*//a[@id='menuItem_2']    ${delay}
    Sleep    10 seconds
    Click Element    //ul/*//a[@id='menuItem_2']
    
Control Navigate to Players icon
    wait until page contains element   //ul/*//a[@id='menuItem_2']    ${delay}
    Sleep    2 seconds
    mouse over    //ul/*//a[@id='menuItem_2']
    Sleep    2 seconds
    
Control Navigate to Players
    wait until page contains element   //div[text()='Search Players']    ${delay}
    Sleep    10 seconds
    Click Element    //div[text()='Search Players']
    
Control Click on Create Player
    wait until page contains element   //span[text()='Create Player']    ${delay}
    Click Element    //span[text()='Create Player']
    
    
Control Enter E-mail and Click Search Button
    [Arguments]    ${e_mail}
    Sleep    15 seconds
    Log    ${e_mail}   
    wait until page contains element   //input[@name='EMAIL']    ${delay}
    Click Element    //input[@name='EMAIL']
    Sleep    2 seconds
    Input Text     //input[@name='EMAIL']    ${e_mail}      
    Click Element    //button/span[text()='search']
    Sleep    10 seconds
    
Control Click View Button
    wait until page contains element   //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained tableActionButton MuiButton-containedPrimary MuiButton-containedSizeSmall MuiButton-sizeSmall MuiButton-disableElevation']    ${delay}
    Click Element    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained tableActionButton MuiButton-containedPrimary MuiButton-containedSizeSmall MuiButton-sizeSmall MuiButton-disableElevation']
  
    
Control Click on Communication
    wait until page contains element   //div[text()='Communications']    ${delay}
    Sleep    2 seconds
    Click Element    //div[text()='Communications']
    
Control Click on Communication History
    wait until page contains element   //a[text()='Communication History']    ${delay}
    Sleep    2 seconds
    Click Element    //a[text()='Communication History']

Control Click on Responsible Gaming
    wait until page contains element   //div[text()='Responsible Gaming']    ${delay}
    Sleep    2 seconds
    Click Element    //div[text()='Responsible Gaming']
    
Control Click on Financial Limits
    wait until page contains element   //a[text()='Financial Limits']    ${delay}
    Sleep    2 seconds
    Click Element    //a[text()='Financial Limits']
    # //div[text()='Daily deposit']/ancestor::tr/td[5]/*/div[3]/button
    
Control Click Edit button on Daily depostis
    wait until page contains element   //div[text()='Daily deposit']    ${delay}
    Sleep    2 seconds
    Click Element    //div[text()='Daily deposit']/ancestor::tr/td[5]/*/div[3]/button
    
# Change Deposit Value
        # [Arguments]    ${New_Deposit_Value}
    # Sleep    2 seconds
    # # Click Element    //div[text()='Daily deposit']/ancestor::tr/td[2]
    # Double Click Element  //div[text()='Daily deposit']/ancestor::tr/td[2]/*//input
    # # press keys  //div[text()='Daily deposit']/ancestor::tr/td[2]/*//input  DELETE
    # Sleep    2 seconds
    # # press keys    xpath://div[text()='Daily deposit']/ancestor::tr/td[2]/*//input  BACKSPACE
    # Clear Element Text    //div[text()='Daily deposit']/ancestor::tr/td[2]/*//input
    # Input Text     //div[text()='Daily deposit']/ancestor::tr/td[2]/*//input    ${New_Deposit_Value}  
Control Click Save Button in deposit Limits
    Sleep    2 seconds
    Click Element    //div[text()='Daily deposit']/ancestor::tr/td[5]/*/div[1]/button
       
    
        

Control Click on Player Info
    wait until page contains element   //div[text()='Player Info']    ${delay}
    Sleep    2 seconds
    Click Element    //div[text()='Player Info']

Control Click on Player Details
    wait until page contains element   //a[text()='Player Details']    ${delay}
    Sleep    2 seconds
    Click Element    //a[text()='Player Details']
    Sleep    5 seconds
    

    
Control Click View button on ContactVerification Email
    wait until page contains element       //div[text()='ContactVerificationMail']/parent::td    ${delay}
    Click Element    //button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained tableActionButton MuiButton-containedPrimary MuiButton-containedSizeSmall MuiButton-sizeSmall MuiButton-disableElevation']
Control Click on Email verification code mail
    wait until page contains element       //div[text()='New Email Address Verification']/parent::td    ${delay}
    Click Element    //div[text()='New Email Address Verification']/parent::td/parent::tr/td[6]//button
    # Click Element    //*[@id="nav-tabpanel-1"]/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/table/tbody/tr[2]/td[6]/div/div/button
Click on Email verification link
    wait until page contains element       //p/a[contains(text(),'verifyregisteredemail')]    ${delay}
    Click Element    //p/a[contains(text(),'verifyregisteredemail')]
    Sleep    5 seconds
    

Login facebook account
     [Arguments]    ${user_name}    ${password}
     wait until page contains element       //button[@name='login']    ${delay}
     Click Element   //input[@id='email']
     Input Text    //input[@id="email"]    ${user_name}
     Click Element   //input[@id='pass']
     Input Text    //input[@id="pass"]    ${password}
     Click Element    //button[@name='login']
     wait until page contains element    //span[text()='Maruthi Nagandla']    ${delay}
     Sleep    5 seconds
     
Navigate to Groups
    Click Element   //span[text()='Groups']
    wait until page contains element    //span[text()='Create New Group']    ${delay}
Create a group
    Sleep    5 seconds
    Click Element  //span[text()='Create New Group']
    wait until page contains element    //span[text()='Group name']/following-sibling::input    ${delay}
    Input Text    //span[text()='Group name']/following-sibling::input    sample
    
     
    
    
    
     
     
    
    
