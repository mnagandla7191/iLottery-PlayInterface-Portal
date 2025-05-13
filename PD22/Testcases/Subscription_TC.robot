
*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../Libs/Common_Base_Repo.py
Library    ../Libs/Wagering_Pages.py
Library    ../Libs/My_Activity_Pages.py
Library    ../Libs/My_Subscription_Pages.py
Resource    ../Resources/Common.robot
Resource    ../Resources/My_Activity_Keywords.robot
Test Teardown    Test Clean Up
Suite Setup   BeforeSuite
# Suite Teardown  AfterSuite
*** Variables ***
${browser_type}    Chrome
${customer_key}    QA
${i}    4
${flag}    1
${sub_flag}    1
${fav_flag}    0

*** Test Cases ***
testcase for Subscription from Supscription page
    [TAGS]    Subscription
    Get test data from json file    ${i}
    Click on Login button    ${Loginbutton_location}
    enter User Name    ${username_Location}    ${user_name}
    enter Password    ${password_Location}    ${Password}
    Select check box to accept terma and conditions    ${Check_box_status}
    Click on Sign in Button    ${Signin_Location}   
    ${totalBalance}=     Get Total Balance
    Log    totalBalance=${totalBalance}
    # ${totalLoyalty}=     Get Total Loyalty
    # Log    LoyaltyBalance=${totalLoyalty}
    Click on Player Menu    ${menu_location} 
    Click on My Subscriptions link    ${my_subscription_location}
    Click on Create New Subscription button    ${create_subsription_location}
    Select Game from the list    ${Game_Name}    ${bet_type}    ${draw_name}    ${flag}
    Do Quick Pick by Selecting No of Boards    ${No_Boards}    ${Game_Name}    ${fav_flag}    ${sub_flag}
    Select value from No of Draws    ${No_Draws_location}    ${No_draws}
    Click on Activate Subscription button    ${Activate_subscription_location}
    Click on Certify check box   ${Ceritify_purchase_location}
    Click on Save or Activate Subscription    ${save_subscription_location}
    Click Confirm button for duplicate subscriptions
    

    Sleep    5 seconds
    Close Browser

***Keywords***    
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

    ${Subscription_details_file}    Load JSON From file    Subscription_details.json
    Log To Console    ${Subscription_details_file}

    ${Game_name}    Get Value From Json    ${Subscription_details_file}    $.Subscription_details[${i}].Game_Name
    ${Game_name}    set variable       ${Game_name[0]} 
    Log    ${Game_name}
    ${No_Boards}    Get Value From Json    ${Subscription_details_file}    $.Subscription_details[${i}].No_Boards
    ${No_Boards}    set variable       ${No_Boards[0]} 
    Log    ${No_Boards}
    ${bet_type}    Get Value From Json    ${Subscription_details_file}    $.Subscription_details[${i}].bet_type
    ${bet_type}    set variable       ${bet_type[0]} 
    Log    ${bet_type}
    ${draw_name}    Get Value From Json    ${Subscription_details_file}    $.Subscription_details[${i}].draw_name
    ${draw_name}    set variable       ${draw_name[0]} 
    Log    ${draw_name}

    ${No_Draws}    Get Value From Json    ${Subscription_details_file}    $.Subscription_details[${i}].No_draws
    ${No_Draws}    set variable       ${No_Draws[0]} 
    Log    ${No_Draws}

    ${No_Draws_location}   Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.No_Draws_location_path
    ${No_Draws_location}    set variable       ${No_Draws_location[0]} 
    Log    ${No_Draws_location}

    ${menu_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.player_menu_path
    ${menu_location}    set variable       ${menu_location[0]} 
    Log    ${menu_location}

    ${my_subscription_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.my_subscription_path
    ${my_subscription_location}    set variable       ${my_subscription_location[0]} 
    Log    ${my_subscription_location}

    ${create_subsription_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.create_subsription_path
    ${create_subsription_location}    set variable       ${create_subsription_location[0]} 
    Log    ${create_subsription_location}
    ${draw_names_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.draw_names_path
    ${draw_names_location}    set variable       ${draw_names_location[0]} 
    Log    ${draw_names_location}

    ${Activate_subscription_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.activate_subscription_path
    ${Activate_subscription_location}    set variable       ${Activate_subscription_location[0]} 
    Log    ${Activate_subscription_location}

    ${Ceritify_purchase_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.Ceritify_purchase_path
    ${Ceritify_purchase_location}    set variable       ${Ceritify_purchase_location[0]} 
    Log    ${Ceritify_purchase_location}

    ${save_subscription_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.save_subscription_path
    ${save_subscription_location}    set variable       ${save_subscription_location[0]} 
    Log    ${save_subscription_location}

    # ${Financial_History_location}    Get Value From Json    ${Subscription_details_file}    $.Subscription_Page_paths.confirm_subscription_path
    # ${Financial_History_location}    set variable       ${Financial_History_location[0]} 
    # Log    ${Financial_History_location}


    Set Global Variable    ${user_name}
    Set Global Variable    ${Password}
    Set Global Variable    ${Check_box_status}
    Set Global Variable    ${Game_name}
    Set Global Variable    ${No_Boards}
    Set Global Variable    ${bet_type}
    Set Global Variable    ${draw_name}
    Set Global Variable    ${No_Draws}
    Set Global Variable    ${No_Draws_location}
    Set Global Variable    ${username_Location}
    Set Global Variable    ${password_Location}
    Set Global Variable    ${Loginbutton_location}
    Set Global Variable    ${Signin_Location}
    Set Global Variable    ${menu_location}
    Set Global Variable    ${Activate_subscription_location}
    Set Global Variable    ${Ceritify_purchase_location}
    # Set Global Variable    ${Confirm_purchase_location}
    Set Global Variable    ${draw_names_location}
    Set Global Variable    ${create_subsription_location}
    Set Global Variable    ${my_subscription_location}
    Set Global Variable    ${save_subscription_location}
    # Set Global Variable    ${Financial_History_location}
    



    





