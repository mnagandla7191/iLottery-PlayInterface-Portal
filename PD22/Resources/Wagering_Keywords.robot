*** Settings ***
Library    SeleniumLibrary
Library    ../Libs/Wagering_Pages.py

*** Variables ***

${myaccount_dropdown}    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
${player_list_xpath}    //div[@class='dropdown pull-left open']
${Draw_games_xpath}    //a[text()='Draw Games'] | //a/span[contains(text(),'Draw Games')]
${Buy_Now_xpath}    //button[text()='Buy Now'] | //button[contains(text(),'Buy Now')]
${delay}    50 seconds
${end_tag}    ']
${game_xpath}    //li/a[@class='nav-tile game-tile-jackpot game-tile-jackpot-
${bet_type_xpath}    //select[@id='betType']
${draw_time_xpath}    //select[@id='drawNames']
${cirtify_xpath}    //input[@name='certify']
${purchase_button_xpath}    //a[text()='Confirm Purchase'] | //a[text()='Purchase']
${show_details_xpath}    //a[@data-pd='cartItemDetailsBtn']
*** Keywords ***
Click on Draw Games
    ${Result}=     Run Keyword And Return Status    Element Should Be Visible    ${player_list_xpath}
    Run Keyword If    ${Result}   Click Element    ${myaccount_dropdown}
    sleep    3 seconds
    Wait Until Element Is Visible    ${Draw_games_xpath}
    Click Element    ${Draw_games_xpath}
    
Select Game from the List
    [Arguments]   ${Game_Name}    ${bet_type}     ${draw_name}
    ${gname}    convert game name single string     ${Game_Name}    
    Click Element    ${game_xpath}${gname}${end_tag}
    sleep    2 seconds
    Run Keyword If    '${Game_Name}' == 'Pick 3' or '${Game_Name}' == 'Pick 4'     select bet type    ${bet_type}     ${draw_name}
    Run Keyword If    '${Game_Name}' == 'All or Nothing'  Select Draw Names    ${draw_name} 
    
select bet type
    [Arguments]    ${bet_type}    ${draw_name}
    sleep    5 seconds
    Wait Until Element Is Visible    ${bet_type_xpath}    ${delay}
    Click Element   ${bet_type_xpath}
    sleep    3 seconds
    Click Element   ${bet_type_xpath}/option[@value='${bet_type}${end_tag}
    sleep    3 seconds
    Click Element   ${draw_time_xpath}
    sleep    3 seconds
    Click Element   ${draw_time_xpath}/option[@value='${draw_name}${end_tag}
    
Select Draw Names
    [Arguments]    ${draw_name}
    sleep    2 seconds
    Click Element   ${draw_time_xpath}
    sleep    2 seconds
    Click Element   ${draw_time_xpath}/option[@value='${draw_name}${end_tag}
    
Click Buy Now button 
    Wait Until Element Is Visible   ${Buy_Now_xpath}    ${delay}
    Click Element    ${Buy_Now_xpath}
    
Select the check box in Certify Popup
    sleep    3 seconds
    ${Result}=     Run Keyword And Return Status    Element Should Be Visible    ${cirtify_xpath}
    Run Keyword If    ${Result}   Click Element   ${cirtify_xpath}

Click on Confirm Purchase button
     Wait Until Element Is Visible    ${purchase_button_xpath}    ${delay}
    Click Element     ${purchase_button_xpath}
    
Click on Show details on confirmation page
    sleep    20 seconds    
    Wait Until Element Is Visible    ${show_details_xpath}    ${delay}
    Click Element    ${show_details_xpath}
    
    