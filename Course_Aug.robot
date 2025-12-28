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

#positioning Arguments
Verify Err msg
    [Arguments]    ${locator}    ${txt}
    Wait Until Element Is Visible    ${locator}    4
    ${t}    Get Text    ${locator}
    Should Be Equal As Strings    ${t}    ${txt}    

#Name Arguemnts
Open Website
    [Arguments]     ${url_web}    ${browser_web}=gc
    Open Browser    ${url}        ${browser}
    Wait Until Page Contains    Welcome to Kru P' Beam!

#Var arguments
Showdata
    [Arguments]    @{list}
    FOR    ${txt}    IN    @{list}
        Log To Console    ${txt}
    END

#Kwarg (Keyword Arguments)

Show Data2
    [Arguments]       &{data}
    Log To Console    ${data}[Fname]
    Log To Console    ${data}[Lname]
    Log To Console    ${data}[Email]


*** Test Cases ***
#Verify requires
#    Open Website      ${url}
#    Click Element     ${locator_btnLogin}
#    Verify Err msg    ${locator_email}    email is a required field
#    Close Browser
    
#Test Vararg
#    Showdata    cat1    dog1    cat2    dog2    cat3    dog3

Test Kwarg
    Show Data2    Fname = AAA    Lname=BBB    Email=EEEE
