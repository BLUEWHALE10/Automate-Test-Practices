*** Settings ***
Library          SeleniumLibrary
Resource         ${CURDIR}/Keyword_Search_Page.robot
Resource         /../home/ethan-kenway/Automate Test Practices/LoginPage/LoginKeword.robot
Suite Setup      Set Selenium Speed    0.05s
Test Setup       Open Login Page    ${url}
Test Teardown    Close Browser
Suite Teardown   Close All Browsers

*** Test Cases ***
Test Validation Header And Menubar
    [Documentation]    ทดสอบการทำงานของ Header ของ link ต่างๆใน header และ menu
    [Tags]    Header
    Verify login Pass
    Wait Until Page Contains    Search Filters    5s
    Verify Header And Menuar
