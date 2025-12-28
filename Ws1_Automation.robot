*** Settings ***
Library     SeleniumLibrary


*** Variables ***
#----login Page
${url}                          https://automate-test.stpb-digital.com/login/
${browser}                      chrome
${locator_email}                id=email
${locator_password}             name=password
${locator_btnLogin}             id=btn-login
${locator_link}                 CSS=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a
${locator_err_msg_email}        xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_err_msg_password}     xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[2]/p
${locator_blind_btn}            xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[2]/div/div/button/svg

#----Search Filteds Page
${locator_Icon_user}            xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div
${locator_Logout_botton}        xpath=/html/body/div[4]/div[3]/ul/li


*** Keywords ***
Open Login Page
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains    Welcome to Kru P' Beam!

Verify Default Page
    Wait Until Page Contains    Welcome to Kru P' Beam!
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_btnLogin}
    Wait Until Element Is Visible    ${locator_link}

Verify Page Name
    Wait Until Page Contains    Welcome to Kru P' Beam!

Verify Field Email Positive Case
    Wait Until Element Is Visible        ${locator_email}
    Input Text                           ${locator_email}    Piriya123@gmail.com
    Wait Until Element Is Not Visible    ${locator_err_msg_email}

Verify Field Email Negative Case
    # -----Clear Text 1----
    # Input Text    ${locator_email}    CTRL+A    BACKSPACE

    # ----Clear Text 2----
    # Reload Page

    Wait Until Element Is Visible    ${locator_email}
    Press Keys                       ${locator_email}            CTRL+A    BACKSPACE
    Input Text                       ${locator_email}            Piriya123
    Click Element                    ${locator_password}
    ${error_text}    Get Text        ${locator_err_msg_email}
    Should Be Equal As Strings       ${error_text}               email must be a valid email

    # ----Data Test 2----
    Press Keys                       ${locator_email}            CTRL+A    BACKSPACE
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}            xyzab
    Click Element                    ${locator_password}
    ${error_msg_email}   Get Text    ${locator_err_msg_email}
    Should Be Equal As Strings       ${error_msg_email}          email must be a valid email

Verify Field Password Positive Case
    Wait Until Element Is Visible    ${locator_password}
    Input Password                   ${locator_password}         123456
    Mouse Down                       ${locator_email}
    Wait Until Element Is Not Visible    ${locator_err_msg_password}    5s

Verify Field Password Negative Case
    # ----Data Test 1----
    Wait Until Element Is Visible    ${locator_password}
    Press Keys                       ${locator_password}          CTRL+A   BACKSPACE
    Input Text                       ${locator_password}          1234
    Mouse Down                       ${locator_email}
    ${error_msg_password}  Get Text  ${locator_err_msg_password}
    Should Be Equal As Strings       ${error_msg_password}        password must be at least 5 characters

    # ----Data Test 2--
    Wait Until Element Is Visible    ${locator_password}
    Press Keys                       ${locator_password}          CTRL+A   BACKSPACE
    Input Text                       ${locator_password}          12
    Mouse Down                       ${locator_email}
    ${error_msg_password}  Get Text  ${locator_err_msg_password}
    Should Be Equal As Strings       ${error_msg_password}        password must be at least 5 characters

Verify Login Positive Case
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Press Keys                       ${locator_email}              CTRL+A    BACKSPACE
    Input Text                       ${locator_email}              user.test@krupbeam.com
    Press Keys                       ${locator_password}           CTRL+A    BACKSPACE
    Input Password                   ${locator_password}           jKNsrapwLNV7eBN
    Click Element                    ${locator_btnLogin}
    Wait Until Page Contains         Search Filters                60s
    #Click Element                    ${locator_Icon_user}
    #Click Element                    ${locator_Logout_botton}

Verify Login Negative Case
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Press Keys                       ${locator_email}              CTRL+A    BACKSPACE
    Input Text                       ${locator_email}              user.test1122@krupbeam.com
    Press Keys                       ${locator_password}           CTRL+A    BACKSPACE
    Input Password                   ${locator_password}           jKNsrapwLNV7eBN
    Click Element                    ${locator_btnLogin}
    ${error_msg_login_N}  Get Text   ${locator_err_msg_email}
    Should Be Equal As Strings       ${error_msg_login_N}          Email or Password is invalid

Verify Login Required Field
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Click Element                    ${locator_btnLogin}
    
    Wait Until Element Is Visible       ${locator_err_msg_email}
    ${err_txt_email_req}    Get Text    ${locator_err_msg_email}
    Should Be Equal As Strings          ${err_txt_email_req}              email is a required field
    
    Wait Until Element Is Visible          ${locator_err_msg_password}
    ${err_txt_password_req}    Get Text    ${locator_err_msg_password}
    Should Be Equal As Strings             ${err_txt_password_req}        password is a required field
    
Verify link Register
    Wait Until Element Is Visible    ${locator_link}
    Click Element                    ${locator_link}

    Wait Until location Contains         https://automate-test.stpb-digital.com/register/    60s
Verify Password Blind
    Wait Until Element Is Visible    ${locator_email}
    Input Password                   ${locator_password}              12345

    Click Element                    ${locator_blind_btn}
    ${txt_password}    Get Text      ${locator_password}
    Should Be Equal As Strings       ${txt_password}                  12345


*** Test Cases ***

TC Defaul Page
    Open Login Page
    Verify Default Page
    Close All Browsers

TC Page Name
    Open Login Page
    Verify Page Name
    Close All Browsers

TC Email P
    Open Login Page
    Verify Field Email Positive Case
    Close All Browsers

TC Email N
    Open Login Page
    Verify Field Email Negative Case
    Close All Browsers

TC Password P
    Open Login Page
    Verify Field Password Positive Case
    Close All Browsers

TC Password N
    Open Login Page
    Verify Field Password Negative Case
    Close All Browsers

TC Login P
    Open Login Page
    Verify Login Positive Case
    Close All Browsers

TC Login N
    Open Login Page
    Verify Login Positive Case
    Close All Browsers

TC Requried 
    Open Login Page
    Verify Login Required Field
    Close All Browsers

TC hyperlink
    Open Login Page
    Verify link Register
    Close All Browsers
