*** Settings ***
Library    SeleniumLibrary
Library    AxeLibrary
Library    Collections
Library  String
Resource    ../Resources/Common.robot
Library    ../Libs/Common_Base_Repo.py
Test Teardown     Test Clean Up for accessibility
*** Variables ***
${Sheet_name}    accessibility_sheet    
# Product_Dev
${xlsx_filename}    datafile_Portal_latest.xlsx
${browser_type}
${url}
${Email} 
${password}

*** Test Cases ***
Accessibility test
    
# execute accessibility tests
    
    ${accessibility_data}=    Get Data from Excel
    ${len} =   Get Length   ${accessibility_data}
    Log    ${len}
    
    FOR    ${counter}    IN RANGE    ${len}
        ${Page_Name}    set variable    ${accessibility_data[${counter}][0]} 
        Log    ${Page_Name}   
        Accessibility Test for the ${Page_Name} page    ${counter}    ${accessibility_data}      
     
    END

test case2

    Open Browser    https://mail.google.com/mail/u/0/#category/social    chrome
    Click Element  //*[@id="identifierId"]
    Input Text    //*[@id="identifierId"]   mnagandla@gmail.com
    Sleep    2 seconds
    Click Element    //*[@id="identifierNext"]/div/button/span





*** Keywords ***
Get Data from Excel
    ${accessibility_data}=    import data from xlsx    ${Sheet_name}    ${xlsx_filename}
    Log    ${accessibility_data}
    [return]  ${accessibility_data}
Write results in excel
    [Arguments]    ${Violations_Count}    ${Inapplicable_Count}    ${Incomplete_Count}    ${Passes_Count}    ${counter}
    export data from xlsx    ${Sheet_name}    ${xlsx_filename}    ${Violations_Count}    ${Inapplicable_Count}    ${Incomplete_Count}    ${Passes_Count}    ${counter}

Accessibility test
    [Arguments]    ${pagename}    ${browser_type}    ${url}        ${login_reg}    ${username}    ${password}
    open browser    ${url}    ${browser_type}
    Maximize Browser Window
    Run Keyword If    '${login_reg}' == 'Yes'    Login with valid credentials    ${url}    ${username}    ${password}

    sleep    20 seconds
    
# execute accessibility tests
    &{results}=    Run Accessibility Tests    Logged_in_homepage.json
    # Log   Violations Count: ${results.violations}
    # Log   Inapplicable Count: ${results.inapplicable}
    # Log   Incomplete Count: ${results.incomplete}
    # Log   Passes Count: ${results.passes}
    ${Violations_Count}    set variable    ${results.violations}
    ${Inapplicable_Count}    set variable    ${results.inapplicable}
    ${Incomplete_Count}    set variable    ${results.incomplete}
    ${Passes_Count}    set variable    ${results.passes}
    # log violation result to log.html
    ${Result_violations}=    Log Readable Accessibility Result    violations
    
    # Log Readable Accessibility Result    inapplicable
    
    # log incomplete result to log.html
    ${Result_incomplete}=    Log Readable Accessibility Result    incomplete
    
    # Log Readable Accessibility Result    Passes

    # Log    ${Result_violations}[0]    html=true
    # Log    ${Result_incomplete}[0]    html=true
    [Teardown]    Close All Browsers
    RETURN  ${Violations_Count}    ${Inapplicable_Count}    ${Incomplete_Count}    ${Passes_Count}

Login with valid credentials
    [Arguments]    ${url}    ${username}    ${password}
    ${login_popup_hide}=     Get Element Attribute    //div[@class='portal-container']    aria-hidden
    Log    ${login_popup_hide}
    Run Keyword If    '${login_popup_hide}' == 'false' or '${login_popup_hide}' == 'None'    Click Element   //div[@id='accountBarDesktop']/*//button
    Wait Until Element Is Visible   //*[@id="loginModal-username"] 
    Input Text    //*[@id="loginModal-username"]    ${username}
    Click Element    //input[@id='loginModal-password']
    Input Text    //input[@id='loginModal-password']    ${password}
    Click Element    //button[@name='loginSubmit' or @id='loginButton']
    sleep    20 seconds
    Go To    ${url}

Accessibility Test for the ${Page_Name}
    [Arguments]    ${counter}    ${accessibility_data}
    
    Log   ${counter} 
    Log    ${accessibility_data[${counter}]}
    ${Violations_Count}    ${Inapplicable_Count}    ${Incomplete_Count}    ${Passes_Count}    Accessibility test    ${accessibility_data[${counter}][0]}    ${accessibility_data[${counter}][1]}    ${accessibility_data[${counter}][2]}    ${accessibility_data[${counter}][3]}    ${accessibility_data[${counter}][4]}    ${accessibility_data[${counter}][5]}
    Write results in excel    ${Violations_Count}    ${Incomplete_Count}    ${Inapplicable_Count}    ${Passes_Count}    ${counter}
        
    



