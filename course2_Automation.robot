*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}    https://automate-test.stpb-digital.com/register/
${browser}    chrome
${locator_select_index_date}    xpath=
${group_Name_RadioBtn_F}           validation-basic-radio

*** Keywords ***

Open Web Brownser 
    Open Browser          ${url}    ${browser}
    Set Selenium Speed    1   


Test List Facebook
    Open Browser                 https://www.facebook.com/    chrome
    Wait Until Page Contains     Facebook
    Click Element                xpath=//*[@data-testid="open-registration-form-button"]

#   <------------- Select List Index ------------- >
#   Select From List By Index    id=day    3

# Normally use! 
#   <------------- Select List Value ------------- >
    #Select From List By Value    xpath=//*[@id="day"]      7
    #Select From List By Value    xpath=//*[@id="month"]    3
    #Select From List By Value    xpath=//*[@id="year"]     2000
    

#   <------------- Select List Value ------------- > 
    Select From List By Label    xpath=//*[@id="day"]      7
    Select From List By Label    xpath=//*[@id="month"]    Mar
    Select From List By Label    xpath=//*[@id="year"]     2000

Test List DIV
#   <------------- Select Div List Value ---------- >
    Open Browser                     https://automate-test.stpb-digital.com/register/    chrome
    Click Element                    id=nationality
    Wait Until Element Is Visible    xpath=//*[@id="menu-"]/div[3]/ul/li[221]
    Click Element                    xpath=//*[@id="menu-"]/div[3]/ul/li[221]
    Close Browser

#   <------------- Select Radio Button ---------- >
Test Radio Button
#                                       must not have 'name='
    Page Should Contain Radio Button    validation-basic-radio
#    Select Radio Button                 validation-basic-radio    female
    Select Radio Button                 ${group_Name_RadioBtn_F}    feamle   
    
#   <------------- Select Checkbox ---------- >
Test Checkbox
    Page Should Contain Checkbox    name=courses.SQL
    Select Checkbox                 name=courses.SQL
    Sleep                           3
    Unselect Checkbox               name=courses.SQL
    Select Checkbox                 name=courses.Test Manual

*** Test Cases ***

TC
    Open Web Brownser
    Test Radio Button