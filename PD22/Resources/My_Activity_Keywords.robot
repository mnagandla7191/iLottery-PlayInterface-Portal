*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${my_activity}    //a[text()='My Activity'] | //a[contains(text(),'Transactions')]
${delay}    30 seconds
${Change_Password_Tab}    //a[@id='change_password']
${Save_Changes_Button}    //div[@id='changepassword']/*//input[@name='submit']
${Current_Password_xpath}     //input[@id='currentpassword']
${New_Password_xpath}    //input[@id='newpassword']
${Confirm_Password_xpath}    //input[@id='confirmpassword']
${financial_link_xpath}    //a[@id='financial-activityLink']
${game-history_link_xpath}    //a[@id='game-historyLink']
   
*** Keywords ***
Click on My Activity link
     Wait Until Element Is Visible    ${my_activity}      ${delay}
     Click Element   ${my_activity}
     Wait Until Element Is Visible    ${game-history_link_xpath}      ${delay}
     Click Element   ${game-history_link_xpath}
     
Click on Financial History Tab
     Wait Until Element Is Visible    ${financial_link_xpath}      ${delay}
     Click Element   ${financial_link_xpath}

    

    
        
    
    