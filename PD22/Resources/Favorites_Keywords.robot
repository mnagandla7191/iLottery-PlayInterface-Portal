*** Settings ***
Library    SeleniumLibrary
Library    ../Libs/Wagering_Pages.py
Library    ../Libs/Favorites_Pages.py
Library    String

*** Variables ***
${browser_type}    chrome
${url}    https://demo.igtilottery.com/
${Email}    autoplayer0402@igt.com
${password}    Welcome2
${delay}    20 seconds
${No_Boards}    1
${Game_Name}    Mega Millions
${group_name}    Perf_Group
${flag}    1
${myaccount_dropdown}    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
${Favorite_xpath}    //a[text()='Favorite iLottery Games']
${Add_Favorite_Button_xpath}    //*[@id="auto_addFavorite"]
${Game_List_xpath}        //ul[@class="favorites-gameList game-tile__list list-unstyled clearfix"]
${addNewGroup_xpath}    //button[@id='addNewGroupHelper']
${addNewGroup_input_xpath}    //*[@name="addNewGroupName"]
${addNewGroup_Button_xpath}    //form[@id='formGroup']/*//button[text()='Add new group']
${Next_Button_xpath}    //button[text()='Next']
${Add_tickets_page_xpath}    //div[@class='flow-step-header active']/h3[text()='Add tickets']
${Add_to_Group_xpath}    //button[text()='Add to Group']
*** Keywords ***
Click on Favorite iLottery link
    Wait Until Element Is Visible   ${Favorite_xpath}    ${delay}
    Click Element    ${Favorite_xpath}
    

Click on Add Favorite Button
    Wait Until Element Is Visible   ${Add_Favorite_Button_xpath}    ${delay}
    Click Element   ${Add_Favorite_Button_xpath}
    
Select Game from Favorite games list
    [Arguments]   ${Game_Name}
    sleep    3 seconds
    Wait Until Element Is Visible    ${Game_List_xpath}    ${delay}
    Run Keyword If    '${Game_Name}' == 'Pick 3' or '${Game_Name}' == 'Pick 4' or '${Game_Name}' == 'All or Nothing'    Click Pick game from Favorites game list    ${Game_Name}
    # ...    ELSE IF    '${Game_Name}' == 'All or Nothing'    get wager numbers in iOS    ${Game_Name_CP}    
    ...    ELSE    Click Element    //a[@data-gamedisplayname='${Game_Name}']   
    

    
    
    
Click on Add New Group
    Wait Until Element Is Visible    ${addNewGroup_xpath}    ${delay}
     
    Click Element    ${addNewGroup_xpath}
Enter Group Name and Add New Group
    [Arguments]   ${group_name}  
    Wait Until Element Is Visible    ${addNewGroup_input_xpath}
    Input Text    ${addNewGroup_input_xpath}    ${group_name}
    Click Element    ${addNewGroup_Button_xpath}
Click Next Button
    
    Click Element    ${Next_Button_xpath}
    Wait Until Element Is Visible        ${Add_tickets_page_xpath}    ${delay}    

Click on Add Group Button  
    Click Element    ${Add_to_Group_xpath}
    

    
Create wager using Favourites
    [TAGS]    Case6
    Wait Until Element Is Visible      //input[@value='${group_name}']/parent::div//parent::div/following-sibling::div/div[2]/div[3]    ${delay}
    sleep    5 seconds 
    Click Element     //input[@value='${group_name}']/parent::div//parent::div/following-sibling::div/div[2]/div[3]
    Wait Until Element Is Visible    //button[text()='Play Now ']
    Click Element    //button[text()='Play Now ']
    Wait Until Element Is Visible    //button[text()='Buy Now']
    Click Element    //button[text()='Buy Now']
    sleep    5 seconds
    Wait Until Element Is Visible    //input[@name='certify']    ${delay}
    Click Element    //input[@name='certify']
    
    Click Element     //a[text()='Confirm Purchase']
    Wait Until Element Is Visible    //a[@data-pd='cartItemDetailsBtn']    ${delay}
    Click Element    //a[@data-pd='cartItemDetailsBtn']
    sleep    2 seconds  
    # Click Element    //*[@id="accountBarDesktop"]/*//a
    

Edit Favourites
    [TAGS]    Case6
    # open browser    ${url}    ${browser_type}
    # Maximize Browser Window
    # Click Element   //button[1]
    # Wait Until Element Is Visible   //*[@id="loginModal-username"]    
    # Click Element  //*[@id="loginModal-username"]
    # Input Text    //*[@id="loginModal-username"]    ${Email}
    # Click Element    //input[@id='loginModal-password']
    # Input Text    //input[@id='loginModal-password']    ${password}
    # Click Element    //button[@name='loginSubmit' or @id='loginButton']
    # sleep     10 seconds
    Wait Until Element Is Visible   ${myaccount_dropdown}    ${delay}
    ${Result}=     Run Keyword And Return Status    Element Should Be Visible    //div[@class='dropdown pull-left']
    Run Keyword If    ${Result}   Click Element    ${myaccount_dropdown}
    sleep    5 seconds
    Click Element    //a[text()='Favorite iLottery Games']
    sleep    2 seconds
    Wait Until Element Is Visible     //input[@value='${group_name}']/parent::div//parent::div/following-sibling::div/div[2]/div[3]    ${delay}
    sleep    5 seconds 
    Click Element     //input[@value='${group_name}']/parent::div//parent::div/following-sibling::div/div[2]/div[3]
    sleep    2 seconds
    Click Element    //button[@class='btn btn-link btn-sm']
    sleep    2 seconds
    Click Element    //a[text()=' Edit']
    sleep    3 seconds
    ${Game_Name_lower}    convert game name single string    ${Game_Name}
    sleep    3 seconds
    Click Element    //*[@id="favorites-${Game_Name_lower}"]//button[@class='btn btn-box btn-box-primary pd-btn-clear']
    sleep    3 seconds
    Click element    //*[@id="favorites-${Game_Name_lower}"]//button[@data-pd='quickpickbutton_0_${Game_Name_lower}']
    sleep    5 seconds
    Click Element    //button[text()='Add to Group']
    sleep    2 seconds
    # Wait Until Element Is Visible   //*[text()=' Logout']    ${delay}
    # Click Element    //*[text()=' Logout']
    # Close Browser 
    

Delete Favourite group
   
    # open browser    ${url}    ${browser_type}
    # Maximize Browser Window
    # Click Element   //button[1]
    # Wait Until Element Is Visible   //*[@id="loginModal-username"]    
    # Click Element  //*[@id="loginModal-username"]
    # Input Text    //*[@id="loginModal-username"]    ${Email}
    # Click Element    //input[@id='loginModal-password']
    # Input Text    //input[@id='loginModal-password']    ${password}
    # Click Element    //button[@name='loginSubmit' or @id='loginButton']
    # sleep     10 seconds
    Wait Until Element Is Visible   ${myaccount_dropdown}    ${delay}
    ${Result}=     Run Keyword And Return Status    Element Should Be Visible    //div[@class='dropdown pull-left']
    Run Keyword If    ${Result}   Click Element    ${myaccount_dropdown}
    sleep    5 seconds
    Click Element    //a[text()='Favorite iLottery Games']
    sleep    2 seconds
    Click Element    //input[@value='${group_name}']/parent::div//parent::div/following-sibling::div/div[2]/div[2]
    sleep    2 seconds
    Click Element    //a[text()='DELETE GROUP']
    sleep    2 seconds
    # Click Element    //*[@id="accountBarDesktop"]/*//a | //div[@class='account-nav__players-info ng-scope']/*//a
    # sleep    5 seconds
    # Wait Until Element Is Visible   //*[text()=' Logout']    ${delay}
    # Click Element    //*[text()=' Logout']
    # Close Browser
    
           
    
    
    

    

    
           
    
    
    
