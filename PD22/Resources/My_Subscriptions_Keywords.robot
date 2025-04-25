*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${my_subscriptions}    //a[text()='My Subscriptions'] | //a[contains(text(),'My Subscriptions')]
${new_subscriptions}    //a[text()='Create New Subscription'] | //a[contains(text(),'Create New Subscription')]
${Activte_subscription_button}    //button[@id='subscribeButton']
${cirtify_xpath}    //input[@name='certify']
${save_subscription}    //a[@id='saving']
${Confirm_subscription}    //div[@class='modal-footer']/button[text()='Confirm']
${delay}    30 seconds

   
*** Keywords ***
Click on My Subscriptions link
     Wait Until Element Is Visible    ${my_subscriptions}      ${delay}
     Click Element   ${my_subscriptions}

Click on Create New Subscription button
    Wait Until Element Is Visible   ${new_subscriptions}      ${delay}
    Click Element   ${new_subscriptions}

Click on Activate Subscription button
    Wait Until Element Is Visible   ${Activte_subscription_button}      ${delay}
    Click Element   ${Activte_subscription_button}

Select check box to Certify age and boundaries of the player
    sleep    3 seconds
    ${Result}=     Run Keyword And Return Status    Element Should Be Visible    ${cirtify_xpath}
    Run Keyword If    ${Result}   Click Element   ${cirtify_xpath}

Click on Save or Activate Subscription
    
    Wait Until Element Is Visible   ${save_subscription}      ${delay}
    Click Element   ${save_subscription}
Click Confirm button
    Wait Until Element Is Visible   ${Confirm_subscription}      ${delay}
    Click Element   ${confirm_subscription}

    


    




