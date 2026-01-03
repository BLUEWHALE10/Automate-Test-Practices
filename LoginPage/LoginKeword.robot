*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
Open Login Page
    [Documentation]    ใช้สำหรับเปิดเว็บไซต์
    [Arguments]        ${url_web}    ${browser_web}=gc
    Open Browser       ${url_web}    ${browser_web}
    Maximize Browser Window

Verify login Pass
    [Documentation]                  ใช้สำหรับ login ผ่าน
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text                       ${locator_email}                  user.test@krupbeam.com
    Input Password                   ${locator_password}               jKNsrapwLNV7eBN
    Click Element                    ${locator_btnLogin}    
    Wait Until Page Contains         Search Filters                    60s

Verify Login Fail
    [Documentation]                  ใช้สำหรับ login ไม่ผ่าน
    [Arguments]                      ${email}                          ${password}    ${err_text}
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Input Text                       ${locator_email}                  ${email}  
    Input Password                   ${locator_password}               ${password}
    Click Element                    ${locator_btnLogin}    
    Verify error message             ${locator_err_msg_email}          ${err_text}
    
Verify error message
    [Documentation]                      ใช้สำหรับตรวจสอบข้อความที่แจ้งเตือนว่าถูกต้องหรือไม่
    [Arguments]                          ${locator_err_msg}            ${txt_err_TC_docs}
    Wait Until Element Is Visible        ${locator_err_msg}
    ${txt_err_actual}        Get Text    ${locator_err_msg}
    Should Be Equal As Strings           ${txt_err_actual}             ${txt_err_TC_docs}

Verify Input Email Pass
    [Documentation]                      ใช้สำหรับตรวจสอบการกรอก Email ถูกต้อง
    [Arguments]                          ${input_email}
    Open Login Page                      ${url_login}             
    Wait Until Element Is Visible        ${locator_email}
    Input Text                           ${locator_email}              ${input_email}
    Mouse Down                           ${locator_btnLogin}
    Wait Until Element Is Not Visible    ${locator_err_msg_email}
    
Verify Password Pass
    [Documentation]                      ใช้สำหรับตรวจสอบการกรอก password ถูกต้อง
    [Arguments]                          ${input_password}              
#    Open Login Page                      ${url}             
    Wait Until Element Is Visible        ${locator_password}
    Input Text                           ${locator_password}           ${input_password}
    Mouse Down                           ${locator_btnLogin}
    Wait Until Element Is Not Visible    ${locator_err_msg_password}
#    Close Browser
    Reload Page

Verify Input Email Fail
    [Documentation]                      ใช้สำหรับตรวจสอบการกรอก Email ไม่กถูกต้อง
    [Arguments]                          ${input_email}                   ${txt_email_err}             
    Open Login Page                      ${url_login}             
    Wait Until Element Is Visible        ${locator_email}
    Input Text                           ${locator_email}                 ${input_email}
    Mouse Down                           ${locator_btnLogin}
    Wait Until Element Is Visible        ${locator_err_msg_email}
    Verify error message                 ${locator_err_msg_email}         ${txt_email_err}   
    Close Browser

Verify Input Password Fail
    [Documentation]                      ใช้สำหรับตรวจสอบการกรอก password ไม่ถูกต้อง
    [Arguments]                          ${input_password}                ${txt_email_err}     
    Open Login Page                      ${url_login}             
    Wait Until Element Is Visible        ${locator_password}
    Input Text                           ${locator_password}              ${input_password}
    Mouse Down                           ${locator_btnLogin}
    Wait Until Element Is Visible        ${locator_err_msg_password}
    Verify error message                 ${locator_err_msg_password}      ${txt_email_err}     
    Close Browser


Verify Requirment
    [Documentation]                  ใช้สำหรับตรวจสอบข้อความที่จำเป็นต้องกรอก
    Verify Input Email Fail          ${EMPTY}                             email is a required field
    Close Browser
    Open Login Page                  ${url_login}
    Verify Input Password Fail       ${EMPTY}                             password is a required field
    

Verify Show Password
    [Documentation]                  ใช้สำหรับตรวจสอบการมองเห็นของ password
    [Arguments]                      ${password}
    Open Login Page                  ${url_login}
    Wait Until Element Is Visible    ${locator_password}
    Input Password                   ${locator_password}                  ${password}
    Click Element                    ${locator_blind_btn}    
    ${get_txt}    Get Value          ${locator_password}    
#    Log               ${get1}
    Should Be Equal As Strings       ${get_txt}                              ${password}
    Close Browser

Verify link Register
    [Documentation]                  ใช้สำหรับตรวจสอบการกด Hyperlink
    Wait Until Element Is Visible    ${locator_link}
    Click Element                    ${locator_link}
    Wait Until location Contains     https://automate-test.stpb-digital.com/register/    60s