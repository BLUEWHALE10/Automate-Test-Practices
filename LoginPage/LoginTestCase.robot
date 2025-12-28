*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/LoginKeword.robot
#Suite Setup       Set Selenium Speed    1
Test Setup        Open Login Page        ${url}
Test Teardown     Close All Browsers

*** Test Cases ***
Default Login Page
    Open Login Page                  ${url}
    Wait Until Page Contains         Welcome to Kru P' Beam!
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_btnLogin}
    Wait Until Element Is Visible    ${locator_link}
    
Verify Input Login Pass
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    Verify login Pass


Verify Input Login Fail
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    Verify Login Fail    test@krupbeam.com    999999    Email or Password is invalid


Verify Input Email Pass
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    [Template]    Verify Input Email Pass
    [Setup]
    user.test@krupbeam.com                
    [Teardown]


Verify Input Password Pass
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    [Template]    Verify Password Pass
    [Setup]
    jKNsrapwLNV7eBN         
    jKNsrapwLNV7eBN        
    [Teardown]


Verify Input Email Fail
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    [Template]         Verify Input Email Fail
    [Setup]
    abcxy              email must be a valid email
    sdqwer             email must be a valid email
    afghff             email must be a valid email
    googlqwe           email must be a valid email
    [Teardown]


Verify Input Password Fail
    [Documentation]    ใช้สำหรับการกรอกข้อมูล
    [Template]         Verify Input Password Fail
    [Setup]
    abcx              password must be at least 5 characters
    sdqw              password must be at least 5 characters
    afgh              password must be at least 5 characters
    goog              password must be at least 5 characters
    [Teardown]


Verify Test Requirement Field
    [Documentation]    ใช้ตรวจสอบการกรอก Required Field
    Verify Requirment

Verify Button Show Password
    [Documentation]    ใช้สำหรับการตรวจสอบ Button Show Password
    [Tags]    ShowPassword
    [Setup]
    [Template]    Verify Show Password    
    1234
    abcd
    efgh
    [Teardown]

Verify Link Create Register
    [Documentation]    ใช้สำหรับการตรวจอสอบการกรอกข้อมูล Register
    Verify link Register