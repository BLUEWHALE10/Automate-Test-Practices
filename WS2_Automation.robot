*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${url}                             https://automate-test.stpb-digital.com/register/
${brownser}                        chrome
${locator_hylink}                  xpath=//*[@id="reset"]
${locator_FirstName}               id=firstname
${locator_LastName}                id=lastname
${locator_Email}                   id=email
${locator_Password}                id=password
${locator_MobilePhone}             id=mobile-phone
${locator_RadioBtn}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]/div/label[1]/span[1]/input
${group_Name_RadioBtn}             validation-basic-radio
${locator_Checkbox_Test_SQL}       name=courses.SQL
${locator_Checkbox_Test_M}         name=courses.Test Manual
${locator_Checkbox_Test_A1}        name=courses.Automate Test
${locator_Checkbox_Test_A2}        name=courses.Automate Test2
${locator_Selector_Nationality}    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[8]/div
${locator_Selector_Role}           xpath=//*[@id="select-role"]
${locator_Selector_Plan}           xpath=//*[@id="select-plan"]
${locator_SignUp_Btn}              xpath=//*[@id="btn-sign-up"]

#------------------------- error msg --------------------------------------------
${locator_msg_error_fname}          xpath=//*[@id="error-firstname"]
${locator_msg_error_lname}          xpath=//*[@id="error-lastname"]
${locator_msg_error_email}          xpath=//*[@id="error-email"]
${locator_msg_error_password}       xpath=//*[@id="error-password"]
${locator_msg_error_phone}          xpath=//*[@id="error-mobile-phone"]
${locator_msg_error_gender}         xpath=//*[@id="validation-basic-gender"]
${locator_msg_error_chkbox}         xpath=//*[@id="validation-basic-courses"]
${locator_msg_error_select_Nation}  xpath=//*[@id="validation-basic-nationality"]
${locator_msg_error_select_Role}    xpath=//*[@id="validation-role"]
${locator_msg_error_select_Plan}    xpath=//*[@id="validation-plan"]


*** Keywords ***

Open Web Browser
    Open Browser                        ${url}    ${brownser}
#   Set Selenium Speed                  1

Verify Default Page
    Wait Until Location Contains        ${url}                             60s
    Wait Until Element Is Visible       ${locator_FirstName}        
    Wait Until Element Is Visible       ${locator_hylink}        
    Wait Until Element Is Visible       ${locator_LastName}        
    Wait Until Element Is Visible       ${locator_Email}        
    Wait Until Element Is Visible       ${locator_Password}        
    Wait Until Element Is Visible       ${locator_MobilePhone}        
    Page Should Contain Radio Button    ${group_Name_RadioBtn}             female          
    Page Should Contain Radio Button    ${group_Name_RadioBtn}             male
    Page Should Contain Checkbox        ${locator_Checkbox_Test_SQL}          
    Page Should Contain Checkbox        ${locator_Checkbox_Test_M}          
    Page Should Contain Checkbox        ${locator_Checkbox_Test_A1}          
    Page Should Contain Checkbox        ${locator_Checkbox_Test_A2}
    Page Should Contain Element         ${locator_Selector_Nationality}          
    Page Should Contain Element         ${locator_Selector_Role}          
    Page Should Contain Element         ${locator_Selector_Plan}
    Page Should Contain Element         ${locator_SignUp_Btn}

Verify Name Page
    Wait Until Location Contains        ${url}
    Wait Until Page Contains            Kru P' Beam


Verify First Name Positive Case
    Wait Until Element Is Visible       ${locator_FirstName}
    Input Text                          ${locator_FirstName}               กนกนวล
    Click Element                       ${locator_SignUp_Btn}
    Wait Until Element Is Not Visible   ${locator_msg_error_fname}


Verify First Name Negative Case
    Wait Until Element Is Visible       ${locator_FirstName}
#   Press Key                           ${locator_FirstName}               SPACEBAR
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_fname}    Get Text        ${locator_msg_error_fname}
    Should Be Equal As Strings          ${txt_err_fname}                  This field is required


Verify Last Name Positive Case
    Wait Until Element Is Visible       ${locator_LastName}
    Input Text                          ${locator_LastName}               อินขาน
    Click Element                       ${locator_SignUp_Btn}
    Wait Until Element Is Not Visible   ${locator_msg_error_lname}


Verify Last Name Negative Case
    Wait Until Element Is Visible       ${locator_LastName}
#    Press Key                          ${locator_LastName}               SPACEBAR
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_lname}    Get Text        ${locator_msg_error_lname}
    Should Be Equal As Strings          ${txt_err_lname}                  This field is required


Verify Email Positive Case
    Wait Until Element Is Visible       ${locator_Email}
    Input Text                          ${locator_Email}                  Beam1234@gmail.com
    Click Element                       ${locator_SignUp_Btn}
    Wait Until Element Is Not Visible   ${locator_msg_error_email}


Verify Email Negative Case
    Wait Until Element Is Visible       ${locator_Email}
    Press Key                           ${locator_Email}                  1234
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_email}    Get Text        ${locator_msg_error_email}
    Should Be Equal As Strings          ${txt_err_email}                  Invalid email address


Verify Email Empty Negative Case
    Wait Until Element Is Visible       ${locator_Email}
#   Press Key                           ${locator_Email}                  SPACEBAR
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_email}    Get Text        ${locator_msg_error_email}
    Should Be Equal As Strings          ${txt_err_email}                  This field is required


Verify Password Positive Case
    Wait Until Element Is Visible       ${locator_Password}
    Input Password                      ${locator_Password}               1234567890
    Click Element                       ${locator_SignUp_Btn}
    Wait Until Element Is Not Visible   ${locator_msg_error_password}


Verify Password Negative Case
    Wait Until Element Is Visible       ${locator_Password}
#   Press Key                           ${locator_Email}                  SPACEBAR
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_password}    Get Text     ${locator_msg_error_password}
    Should Be Equal As Strings          ${txt_err_password}               This field is required


Verify Mobile Phone Positive Case
    Wait Until Element Is Visible       ${locator_MobilePhone}
    Input Password                      ${locator_MobilePhone}               123456
    Click Element                       ${locator_SignUp_Btn}
    Wait Until Element Is Not Visible   ${locator_msg_error_phone}


Verify Mobile Phone Negative Case
    Wait Until Element Is Visible       ${locator_MobilePhone}
#   Press Key                           ${locator_Email}                  SPACEBAR
    Click Element                       ${locator_SignUp_Btn}
    ${txt_err_password}    Get Text     ${locator_msg_error_phone}
    Should Be Equal As Strings          ${txt_err_password}               This field is required   


Verify Radio Button Gender
    Page Should Contain Radio Button    ${group_Name_RadioBtn}
    Select Radio Button                 ${group_Name_RadioBtn}            female
    Select Radio Button                 ${group_Name_RadioBtn}            male

Verify Select Checkbox Course SQL
    Page Should Contain Checkbox        ${locator_Checkbox_Test_SQL}
    Select Checkbox                     ${locator_Checkbox_Test_SQL}
    Checkbox Should Be Selected         ${locator_Checkbox_Test_SQL} 
#    Unselect Checkbox                   ${locator_Checkbox_Test_SQL}

Verify Select Checkbox Course Manual
    Page Should Contain Checkbox        ${locator_Checkbox_Test_M}
    Select Checkbox                     ${locator_Checkbox_Test_M}
    Checkbox Should Be Selected         ${locator_Checkbox_Test_M} 
#    Unselect Checkbox                   ${locator_Checkbox_Test_M}


Verify Select Checkbox Course Automation1
    Page Should Contain Checkbox        ${locator_Checkbox_Test_A1}
    Select Checkbox                     ${locator_Checkbox_Test_A1}
    Checkbox Should Be Selected         ${locator_Checkbox_Test_A1} 
#    Unselect Checkbox                   ${locator_Checkbox_Test_A1}


Verify Select Checkbox Course Automation2
    Page Should Contain Checkbox        ${locator_Checkbox_Test_A2}
    Select Checkbox                     ${locator_Checkbox_Test_A2}
    Checkbox Should Be Selected         ${locator_Checkbox_Test_A2} 
#    Unselect Checkbox                   ${locator_Checkbox_Test_A2}


Verify Select List Nationality
    Wait Until Element Is Visible       ${locator_Selector_Nationality}
    Click Element                       ${locator_Selector_Nationality}
    
    Wait Until Element Is Visible       xpath=//*[@id="menu-"]/div[3]/ul/li[22]
    ${msg_list_nation_r}    Get Text    xpath=//*[@id="menu-"]/div[3]/ul/li[22]
    Click Element                       xpath=//*[@id="menu-"]/div[3]/ul/li[22]
    
    ${msg_list_nation}      Get Text    ${locator_Selector_Nationality}
    Should Be Equal As Strings          ${msg_list_nation}    ${msg_list_nation_r}


Verify Select List Role
    Wait Until Element Is Visible       ${locator_Selector_Role}
    Click Element                       ${locator_Selector_Role}
    Wait Until Element Is Visible       xpath=//*[@id="menu-"]/div[3]/ul/li[2]
    ${_msg_list_role_r}    Get Text     xpath=//*[@id="menu-"]/div[3]/ul/li[2]
    Click Element                       xpath=//*[@id="menu-"]/div[3]/ul/li[2]
    ${msg_list_role}       Get Text     ${locator_Selector_Role}
    Should Be Equal As Strings          ${msg_list_role}    ${msg_list_role_r}


Verify Select List Plan
    Wait Until Element Is Visible       ${locator_Selector_Plan}
    Click Element                       ${locator_Selector_Plan}
    Wait Until Element Is Visible       xpath=//*[@id="menu-"]/div[3]/ul/li[3]
    ${_msg_list_plan_r}    Get Text     xpath=//*[@id="menu-"]/div[3]/ul/li[3]
    Click Element                       xpath=//*[@id="menu-"]/div[3]/ul/li[3]
    ${msg_list_plan}       Get Text     ${locator_Selector_Plan}
    Should Be Equal As Strings          ${msg_list_plan}    ${_msg_list_plan_r}

Verify Successfull Sign Up
    Verify Default Page
    Input Text                          ${locator_FirstName}              กนกนวล
    Input Text                          ${locator_LastName}               อินขาน
    Input Text                          ${locator_Email}                  Beam1234@gmail.com
    Input Password                      ${locator_Password}               1234567890 
    Input Text                          ${locator_MobilePhone}            0981231234 
    Select Radio Button                 ${group_Name_RadioBtn}            male
    
    Verify Select Checkbox Course SQL
    Verify Select Checkbox Course Automation1

    Verify Select List Nationality
    Verify Select List Plan
    Verify Select List Role

    Click Element                       ${locator_SignUp_Btn}
    
    Wait Until Page Contains            Register Success                  60s
    Wait Until Element Is Visible       xpath=//*[@id="btn-ok"]           60s
    
Verify Required Field

    Verify Default Page

    Click Element                          ${locator_SignUp_Btn}

    ${txt_err_fName}          Get Text     ${locator_msg_error_fname}
    Should Be Equal As Strings             ${txt_err_fName}                   This field is required 
 
    ${txt_err_lName}          Get Text     ${locator_msg_error_lname} 
    Should Be Equal As Strings             ${txt_err_lName}                   This field is required 
 
    ${txt_err_email}          Get Text     ${locator_msg_error_email} 
    Should Be Equal As Strings             ${txt_err_email}                   This field is required 
 
    ${txt_err_password}       Get Text     ${locator_msg_error_email} 
    Should Be Equal As Strings             ${txt_err_email}                   This field is required

    ${txt_err_mbphone}        Get Text     ${locator_msg_error_phone}
    Should Be Equal As Strings             ${txt_err_mbphone}                 This field is required 

    ${txt_err_gender}         Get Text     ${locator_msg_error_gender}
    Should Be Equal As Strings             ${txt_err_gender}                  This field is required 

    ${txt_err_chkbox}         Get Text     ${locator_msg_error_chkbox}
    Should Be Equal As Strings             ${txt_err_gender}                  This field is required

    ${txt_err_select_N}       Get Text     ${locator_msg_error_select_Nation}
    Should Be Equal As Strings             ${txt_err_gender}                  This field is required

    ${txt_err_select_R}       Get Text     ${locator_msg_error_select_Plan}
    Should Be Equal As Strings             ${txt_err_select_R}                This field is required  

    ${txt_err_select_P}       Get Text     ${locator_msg_error_select_Plan}
    Should Be Equal As Strings             ${txt_err_select_P}                This field is required  

Verify Click OK When Sign Out Successfully
    Verify Successfull Sign Up
    Wait Until Element Is Visible       xpath=//*[@id="btn-ok"]
    Click Element                       xpath=//*[@id="btn-ok"]
    Wait Until Location Contains        https://automate-test.stpb-digital.com/login/
    
Verify Hyperlink Reset
    Verify Default Page
    Input Text                          ${locator_FirstName}              กนกนวล
    Input Text                          ${locator_LastName}               อินขาน
    Input Text                          ${locator_Email}                  Beam1234@gmail.com
    Input Password                      ${locator_Password}               1234567890 
    Input Text                          ${locator_MobilePhone}            0981231234 
    
    Verify Select Checkbox Course SQL
    Verify Select Checkbox Course Automation1

    Verify Select List Nationality
    Verify Select List Plan
    Verify Select List Role

    Click Element                       ${locator_hylink}

    ${fName_txt}      Get Text          ${locator_FirstName}
    Should Be Empty                     ${fName_txt}

    ${lName_txt}      Get Text          ${locator_LastName}
    Should Be Empty                     ${fName_txt}

    ${Email_txt}      Get Text          ${locator_Email}
    Should Be Empty                     ${Email_txt}

    ${Password_txt}   Get Text          ${locator_Password}
    Should Be Empty                     ${Password_txt}

    ${mobile_txt}     Get Text          ${locator_MobilePhone}
    Should Be Empty                     ${mobile_txt}

    Radio Button Should Not Be Selected    ${group_Name_RadioBtn}

    Checkbox Should Not Be Selected     ${locator_Checkbox_Test_SQL}
    Checkbox Should Not Be Selected     ${locator_Checkbox_Test_M}
    Checkbox Should Not Be Selected     ${locator_Checkbox_Test_A1}
    Checkbox Should Not Be Selected     ${locator_Checkbox_Test_A2}


    ${msg_epmty_nation}     Get Text    ${locator_Selector_Nationality}
    Should Be Empty                     ${msg_epmty_nation}             

    ${msg_epmty_plan}     Get Text      ${locator_Selector_Plan}
    Should Be Empty                     ${msg_epmty_nation}             

    ${msg_epmty_role}     Get Text      ${locator_Selector_Role}
    Should Be Empty                     ${msg_epmty_nation}             


*** Test Cases ***

Test Case 1 Default Page
    Open Web Browser
    Verify Default Page
    Close All Browsers

Test Case 2 Name Page
    Open Web Browser
    Verify Name Page
    Close All Browsers

Test Case 3 Verify First Name Positive Case
    Open Web Browser
    Verify First Name Positive Case
    Close All Browsers

Test Case 4 Verify First Name Negative Case
    Open Web Browser
    Verify First Name Negative Case
    Close All Browsers

Test Case 5 Verify Last Name Positive Case
    Open Web Browser
    Verify Last Name Positive Case
    Close All Browsers

Test Case 6 Verify Last Name Negative Case
    Open Web Browser
    Verify Last Name Negative Case
    Close All Browsers

Test Case 7 Verify Email Positive Case
    Open Web Browser
    Verify Email Positive Case
    Close All Browsers

Test Case 8 Verify Email Negative Case
    Open Web Browser
    Verify Email Negative Case
    Close All Browsers

Test Case 9 Verify Empty Email Negative Case
    Open Web Browser
    Verify Email Empty Negative Case
    Close All Browsers

Test Case 10 Verify Password Positive Case
    Open Web Browser
    Verify Password Positive Case
    Close All Browsers

Test Case 11 Verify Password Negative Case
    Open Web Browser
    Verify Password Negative Case
    Close All Browsers

Test Case 12 Verify Mobile Phone Positive Case
    Open Web Browser
    Verify Mobile Phone Positive Case
    Close All Browsers

Test Case 13 Verify Mobile Phone Negative Case
    Open Web Browser
    Verify Mobile Phone Negative Case
    Close All Browsers

Test Case 14 Verify Radio Button Positive Case
    Open Web Browser
    Verify Radio Button Gender
    Close All Browsers

Test Case 15 Verify Checkbox SQL
    Open Web Browser
    Verify Select Checkbox Course SQL
    Close All Browsers

Test Case 16 Verify Checkbox Manual
    Open Web Browser
    Verify Select Checkbox Course Manual
    Close All Browsers

Test Case 17 Verify Checkbox Automation1
    Open Web Browser
    Verify Select Checkbox Course Automation1
    Close All Browsers

Test Case 18 Verify Checkbox Automation2
    Open Web Browser
    Verify Select Checkbox Course Automation2
    Close All Browsers

Test Case 19 Verify Selecter Nationality
    Open Web Browser
    Verify Select List Nationality
    Close All Browsers

Test Case 20 Verify Selecter Role
    Open Web Browser
    Verify Select List Role
    Close All Browsers

Test Case 21 Verify Selecter Plan
    Open Web Browser
    Verify Select List Plan
    Close All Browsers

Test Case 22 Verify Successfull Sign Up
    Open Web Browser
    Verify Successfull Sign Up
    Close All Browsers

Test Case 23 Verify Required Field
    Open Web Browser
    Verify Required Field
    Close All Browsers

Test Case 24 Verify Click OK When Sign Out Successfully
    Open Web Browser
    Verify Click OK When Sign Out Successfully
    Close All Browsers

Test Case 25 Verify Hyperlink
    Open Web Browser
    Verify Hyperlink Reset
    Close All Browsers




















