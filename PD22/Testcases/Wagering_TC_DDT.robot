
*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../Libs/Common_Base_Repo.py
Library    ../Libs/Home_Page.py
Library    ../Libs/Wagering_Pages.py
Library    ../Libs/My_Activity_Pages.py
Resource    ../Resources/Common.robot
Library           DataDriver
# Resource    ../Resources/Login_Keywords.robot
# Resource    ../Resources/Wagering_Keywords.robot
Resource    ../Resources/My_Activity_Keywords.robot
# Library    ../libs/Common_Base_Repository.py
Test Teardown    Test Clean Up
# Suite Setup   BeforeSuite
# Suite Teardown  AfterSuite
*** Variables ***
${browser_type}    Chrome
${url}    https://kyssit2.igtilotterycmdtest.com/en-us/home.html
${Email}    maruthi155@igt.com    
${password}    Welcome1
# ${delay}    50 seconds
${Sheet_Name}    Wagering
${xls_filename}    datafile_Portal_latest.xlsx
${environment}    Environment_details
${flag}
${customer_key}    QA
${i}    3
*** Test Cases ***
testcase for Wagering with Quickpick
    [TAGS]    Wagering
    Get test data from json file    ${i}
    Click on Login button    ${Loginbutton_location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box to accept terma and conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}
    Click on Sign in Button    ${Signin_Location}
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    # ${totalLoyalty}=     Get Total Loyalty
    # Log    LoyaltyBalance=${totalLoyalty}
    Click on Draw Games    ${Draw_Games_location}
    Select Game from the List    ${Game_Name}    ${bet_type}    ${draw_name}

    Do Quick Pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}
    # Do Manual pick by selecting No of Boards     ${No_Boards}    ${Game_Name}
    Click on Buy Now button    ${Buynow_location}
    Click on Certify checkbox   ${Ceritify_purchase_location}
    Click on Confirm Purchase button    ${Confirm_purchase_location}
    Click on Show details on confirmation page    ${Show_details_location}
    ${wager_details}    Get Wager details from confirmation page    ${Game_Name}    ${customer_key}
    log    ${wager_details}
    ${CurrentBalance}=     Get Total Balance
    Log    totalBalance=${CurrentBalance}
    # ${CurrentLoyalty}=     Get Total Loyalty
    # Log    totalLoyalty=${CurrentLoyalty}
    ${amountAfterPurchase}=     Evaluate    ${totalBalance} - ${wager_details}[-2]
    Log         ${amountAfterPurchase}
    Should Be Equal As Strings     ${Game_Name}    ${wager_details}[1]
    Should Be Equal As Numbers     ${CurrentBalance}    ${amountAfterPurchase}
    
    # My Activity - Game History
    Click Player Menu
    Click on My Activity    ${My_Activity_location}
    ${Game_History_Details}    Get Game History Details
    Log    ${Game_History_Details}
    Should Be Equal As Strings     ${Game_Name}    ${Game_History_Details}[0]
    Should Be Equal As Numbers     ${wager_details}[-2]    ${Game_History_Details}[1]
    
    # My Activity - Game History Summary
    ${Game_History_Summary_Details}    Get Game History Summary Details
    Log    ${Game_History_Summary_Details}
    Lists Should Be Equal    ${wager_details}[0]    ${Game_History_Summary_Details}[0]
    # Should Be Equal As Numbers     ${wager_details}[2]    ${Game_History_Summary_Details}[3]
    
    # My Activity - Financial History
    Click on Financial History    ${Financial_History_location}
    ${Financial_History_Details}    Get Financial History Details
    Log    ${Financial_History_Details}
    Should Be Equal As Numbers     ${wager_details}[-2]    ${Financial_History_Details}[0]
    Should Be Equal As Strings    Draw Game Purchase    ${Financial_History_Details}[1]
    
    # My Activity - Financial History Summary Details
    ${Financial_History_Summary_Details}    Get Financial History Summary Details
    Log    ${Financial_History_Summary_Details}
    Should Be Equal As Strings    [CONFIRMED] Play Lottery debit confirmation    ${Financial_History_Summary_Details}
    Sleep    5 seconds
    Close Browser
     
    
testcase for Wagering with Manual Pick
    Get test data from json file    ${i}
    Click on Login button    ${Loginbutton_location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box to accept terma and conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}
    Click on Sign in Button    ${Signin_Location}
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    # ${totalLoyalty}=     Get Total Loyalty
    # Log    LoyaltyBalance=${totalLoyalty}
    Click on Draw Games    ${Draw Games_location}
    Select Game from the List    ${Game_Name}    ${bet_type}     ${draw_name}
    # Do Quick Pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}
    Do Manual pick by selecting No of Boards     ${No_Boards}    ${Game_Name}
    Click on Buy Now button    ${Buynow_location}
    Click on Certify checkbox   ${Ceritify_purchase_location}
    Click on Confirm Purchase button    ${Confirm_purchase_location}
    Click on Show details on confirmation page    ${Show_details_location}
    ${wager_details}    Get Wager details from confirmation page    ${Game_Name}    ${customer_key}
    log    ${wager_details}
    ${CurrentBalance}=     Get Total Balance
    Log    totalBalance=${CurrentBalance}
    # ${CurrentLoyalty}=     Get Total Loyalty
    # Log    totalLoyalty=${CurrentLoyalty}
    ${amountAfterPurchase}=     Evaluate    ${totalBalance} - ${wager_details}[-2]
    Log         ${amountAfterPurchase}
    Should Be Equal As Strings     ${Game_Name}    ${wager_details}[1]
    Should Be Equal As Numbers     ${CurrentBalance}    ${amountAfterPurchase}
    
    # My Activity - Game History
    Click Player Menu
    Click on My Activity    ${My_Activity_location}
    ${Game_History_Details}    Get Game History Details
    Log    ${Game_History_Details}
    Should Be Equal As Strings     ${Game_Name}    ${Game_History_Details}[0]
    Should Be Equal As Numbers     ${wager_details}[-2]    ${Game_History_Details}[1]
    
    # My Activity - Game History Summary
    ${Game_History_Summary_Details}    Get Game History Summary Details
    Log    ${Game_History_Summary_Details}
    Lists Should Be Equal    ${wager_details}[0]    ${Game_History_Summary_Details}[0]
    # Should Be Equal As Numbers     ${wager_details}[2]    ${Game_History_Summary_Details}[3]
    
    # My Activity - Financial History
    Click on Financial History    ${Financial_History_location} 
    ${Financial_History_Details}    Get Financial History Details
    Log    ${Financial_History_Details}
    Should Be Equal As Numbers     ${wager_details}[-2]    ${Financial_History_Details}[0]
    Should Be Equal As Strings    Draw Game Purchase    ${Financial_History_Details}[1]
    
    # My Activity - Financial History Summary Details
    ${Financial_History_Summary_Details}    Get Financial History Summary Details
    Log    ${Financial_History_Summary_Details}
    Should Be Equal As Strings    [CONFIRMED] Play Lottery debit confirmation    ${Financial_History_Summary_Details}
Test case to get the length
    Get count of games from json file
    

***Keywords***
Get count of games from json file
    ${Wager_details_file}    Load JSON From file    Wager_details.json
    ${Games_List} =  Get Value From Json     ${Wager_details_file}     $..Game_Name
    ${Games_count}  Get Length  ${Games_List}
    Log    ${Games_count}
    FOR    ${counter}    IN RANGE    ${Games_count}
        Log    ${Games_List}[${counter}]
        
    END

    
Get test data from json file
    [Arguments]    ${i}
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

    ${Wager_details_file}    Load JSON From file    Wager_details.json
    Log To Console    ${Wager_details_file}
    ${Game_name}    Get Value From Json    ${Wager_details_file}    $.wager_details[${i}].Game_Name
    ${Game_name}    set variable       ${Game_name[0]} 
    Log    ${Game_name}
    ${No_Boards}    Get Value From Json    ${Wager_details_file}    $.wager_details[${i}].No_Boards
    ${No_Boards}    set variable       ${No_Boards[0]} 
    Log    ${No_Boards}
    ${bet_type}    Get Value From Json    ${Wager_details_file}    $.wager_details[${i}].bet_type
    ${bet_type}    set variable       ${bet_type[0]} 
    Log    ${bet_type}
    ${draw_name}    Get Value From Json    ${Wager_details_file}    $.wager_details[${i}].draw_name
    ${draw_name}    set variable       ${draw_name[0]} 
    Log    ${draw_name}

    ${Draw_Games_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Draw_Games_path
    ${Draw_Games_location}    set variable       ${Draw_Games_location[0]} 
    Log    ${Draw_Games_location}

    ${Buynow_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Buynow_path
    ${Buynow_location}    set variable       ${Buynow_location[0]} 
    Log    ${Buynow_location}

    ${draw_names_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.draw_names_path
    ${draw_names_location}    set variable       ${draw_names_location[0]} 
    Log    ${draw_names_location}

    ${bet_type_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.bet_type_path
    ${bet_type_location}    set variable       ${bet_type_location[0]} 
    Log    ${bet_type_location}

    ${Confirm_purchase_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Confirm_purchase_path
    ${Confirm_purchase_location}    set variable       ${Confirm_purchase_location[0]} 
    Log    ${Confirm_purchase_location}

    ${Show_details_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Show_details_path
    ${Show_details_location}    set variable       ${Show_details_location[0]} 
    Log    ${Show_details_location}

    ${Ceritify_purchase_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Ceritify_purchase_path
    ${Ceritify_purchase_location}    set variable       ${Ceritify_purchase_location[0]} 
    Log    ${Ceritify_purchase_location}

    ${My_Activity_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.My_Activity_path
    ${My_Activity_location}    set variable       ${My_Activity_location[0]} 
    Log    ${My_Activity_location}

    ${Financial_History_location}    Get Value From Json    ${Wager_details_file}    $.wager_Page_paths.Financial_History_path
    ${Financial_History_location}    set variable       ${Financial_History_location[0]} 
    Log    ${Financial_History_location}


    Set Global Variable    ${user_name}
    Set Global Variable    ${Password}
    Set Global Variable    ${Check_box_status}
    Set Global Variable    ${Game_name}
    Set Global Variable    ${No_Boards}
    Set Global Variable    ${bet_type}
    Set Global Variable    ${draw_name}

    Set Global Variable    ${username_Location}
    Set Global Variable    ${password_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${Draw_Games_location}
    Set Global Variable    ${Show_details_location}
    Set Global Variable    ${Ceritify_purchase_location}
    Set Global Variable    ${Confirm_purchase_location}
    Set Global Variable    ${draw_names_location}
    Set Global Variable    ${Buynow_location}
    Set Global Variable    ${bet_type_location}
    Set Global Variable    ${My_Activity_location}
    Set Global Variable    ${Financial_History_location}
    



    