*** Settings ***
Library    SeleniumLibrary
Library    AxeLibrary
Resource    ../Resources/Common.robot
Library    DataDriver    ../../datafile_Portal_latest.xlsx    sheet_name=accessibility_sheet
Test Teardown     Test Clean Up for accessibility
Test Template  Accessibility test
*** Variables ***
# ${browser_type}    chrome
# ${url}    https://kyssit2.igtilotterycmdtest.com/en-us/home.html
# ${Email}    maruthib2@yopmail.com
# ${password}    Welcome@123
${row}    0
${col}    0
*** Test Cases ***
Accessibility test for ${pagename}     ${browser_type}    ${url}    ${username}    ${password}
    [TAGS]    Accessibility DDT

        
*** Keywords ***
Accessibility test
    [Arguments]    ${pagename}    ${browser_type}    ${url}    ${username}    ${password}
    open browser    ${url}    ${browser_type}
    Maximize Browser Window
    # Click Element   //div[@id='accountBarDesktop']/*//button
    # Wait Until Element Is Visible   //*[@id="loginModal-username"]    
    # Click Element  //*[@id="loginModal-username"]
    # Input Text    //*[@id="loginModal-username"]    ${username}
    # Click Element    //input[@id='loginModal-password']
    # Input Text    //input[@id='loginModal-password']    ${password}
    # Click Element    //button[@name='loginSubmit' or @id='loginButton']
    sleep    20 seconds
    
# execute accessibility tests
    &{results}=    Run Accessibility Tests    Logged_in_homepage.json
    Log   Violations Count: ${results.violations}
    Log   Inapplicable Count: ${results.inapplicable}
    Log   Incomplete Count: ${results.incomplete}
    Log   Passes Count: ${results.passes}

    # log violation result to log.html
    ${Result_violations}=    Log Readable Accessibility Result    violations
    
    # Log Readable Accessibility Result    inapplicable
    
    # log incomplete result to log.html
    ${Result_incomplete}=    Log Readable Accessibility Result    incomplete
    
    # Log Readable Accessibility Result    Passes

    # Log    ${Result_violations}[0]    html=true
    # Log    ${Result_incomplete}[0]    html=true
    [Teardown]    Close All Browsers