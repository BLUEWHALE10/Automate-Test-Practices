*** Settings ***

Library    SeleniumLibrary
Resource   ${CURDIR}/Variable_Register.robot
Resource   ${CURDIR}/Keyword_Register.robot

Test Setup       Open Register Page    ${url}
Test Teardown    Close All Browsers
*** Test Cases ***

Test Case 1 : Verify Default Page
    Verify Default Page

Test Case 2 : Verify First Name Field Positive Case
    [Setup]
    
    Verify Text Field Positive Case        ${dict_first_name.locator}    ${dict_first_name.value}    ${dict_first_name.err_locator}    ${locator_SignUp_Btn}
    
    [Teardown]
Test Case 3 : Verify First Name Field Negative Case
    
    [Setup]
    
    Verify Text Field Negative Case        ${dict_first_name.locator}    ${EMPTY}                    ${dict_first_name.err_locator}    ${txt_required_filed}     ${locator_SignUp_Btn}
    
    [Teardown]

Test Case 4 : Verify Last Name Field Positive Case
    [Setup]
    
    Verify Text Field Positive Case        ${dict_last_name.locator}    ${dict_last_name.value}      ${dict_last_name.err_locator}    ${locator_SignUp_Btn}
    
    [Teardown]
Test Case 5 : Verify Last Name Field Negative Case
    
    [Setup]
    
    Verify Text Field Negative Case        ${dict_last_name.locator}    ${EMPTY}                      ${dict_last_name.err_locator}    ${txt_required_filed}     ${locator_SignUp_Btn}
    
    [Teardown]

Test Case 6 : Verify Email Name Field Positive Case
    [Setup]
    
    Verify Text Field Positive Case        ${dict_email.locator}    ${dict_email.value}               ${dict_email.err_locator}    ${locator_SignUp_Btn}
    
    [Teardown]
Test Case 7 : Verify Email Field Negative Case
    
    [Setup]
    
    Verify Text Field Negative Case        ${dict_email.locator}    ${EMPTY}                          ${dict_email.err_locator}    ${txt_required_filed}     ${locator_SignUp_Btn}
    
    [Teardown]

Test Case 8 : Verify Mobile Field Positive Case
    [Setup]
    
    Verify Text Field Positive Case        ${dict_mobile_phone.locator}    ${dict_mobile_phone.value}       ${dict_mobile_phone.err_locator}    ${locator_SignUp_Btn}
    
    [Teardown]

Test Case 9 : Verify Mobile Field Negative Case
    
    [Setup]
    
    Verify Text Field Negative Case        ${dict_mobile_phone.locator}    ${EMPTY}                          ${dict_mobile_phone.err_locator}    ${txt_required_filed}     ${locator_SignUp_Btn}
    
    [Teardown]

Test Case 10 : Verify Password Field Positive Case
    [Setup]

    Verify Password Field Positive Case    ${locator_Password}    abcdex    ${locator_msg_error_password}    ${locator_SignUp_Btn}

    [Teardown]

Test Case 11 : Verify Password Field Negative Case
    [Setup]

    Verify Password Field Negative Case    ${locator_Password}    ${EMPTY}    ${locator_msg_error_password}    ${txt_required_filed}    ${locator_SignUp_Btn}

    [Teardown]

Test Case 12 : Verify Radio Buttton Pass
    [Tags]    radiopass
    Verify Radio Button    ${dict_radio_gender.group_name}    ${dict_radio_gender.value}    pass    ${dict_radio_gender.err_locator}    ${txt_required_filed}    ${locator_SignUp_Btn}

Test Case 13 : Verify Radio Buttton Fail
    [Tags]    radiofail
    Verify Radio Button    ${dict_radio_gender.group_name}    ${dict_radio_gender.value}    fail    ${dict_radio_gender.err_locator}    ${txt_required_filed}    ${locator_SignUp_Btn}

Test Case 15 : Verify Check box Pass
    [Tags]    checkboxpass
    [Template]    Verify check box
     ${locator_Checkbox_Test_SQL}    pass    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_M}      pass    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_A1}     pass    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_A2}     pass    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}

Test Case 16 : Verify Check Box Fail
    [Tags]    checkboxfail
    [Template]    Verify check box
     ${locator_Checkbox_Test_SQL}    fail    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_M}      fail    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_A1}     fail    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}
     ${locator_Checkbox_Test_A2}     fail    ${locator_msg_error_chkbox}    ${txt_required_filed}    ${locator_SignUp_Btn}

Test Case 17 : Verify Dropdown Pass
    [Tags]    dropdownpass
    [Template]    Verify Dropdown List
    ${dict_dropdown_Nationality.locator}    pass   ${dict_dropdown_Nationality.value}    ${txt_required_filed}    ${dict_dropdown_Nationality.err_locator}    ${locator_SignUp_Btn}
    ${dict_dropdown_Plan.locator}           pass   ${dict_dropdown_Plan.value}           ${txt_required_filed}    ${dict_dropdown_Plan.err_locator}           ${locator_SignUp_Btn}
    ${dict_dropdown_Role.locator}           pass   ${dict_dropdown_Role.value}           ${txt_required_filed}    ${dict_dropdown_Role.err_locator}           ${locator_SignUp_Btn}

Test Case 18 : Verify Dropdown Fail
    [Tags]    dropdownpass
    [Template]    Verify Dropdown List
    ${dict_dropdown_Nationality.locator}    fail  ${dict_dropdown_Nationality.value}    ${txt_required_filed}    ${dict_dropdown_Nationality.err_locator}    ${locator_SignUp_Btn}
    ${dict_dropdown_Plan.locator}           fail  ${dict_dropdown_Plan.value}           ${txt_required_filed}    ${dict_dropdown_Plan.err_locator}           ${locator_SignUp_Btn}
    ${dict_dropdown_Role.locator}           fail  ${dict_dropdown_Role.value}           ${txt_required_filed}    ${dict_dropdown_Role.err_locator}           ${locator_SignUp_Btn}

Test Case 19 : Required Field
    Verify Required Field

Test Case 20 : Link Sign In
    Veryfy Link Sign In

Test Case 21 : Verify Hyperlink Reset

    Verify Hyperlink Reset    ${locator_hylink} 
    ...                       ${data_txt}    
    ...                       ${locator_Password}       abczy1234                     ${locator_msg_error_password}
    ...                       ${list_radio_btn}
    ...                       ${list_chkbox}            ${locator_msg_error_chkbox}    
    ...                       ${list_dropdown}

Test Case 22 : Sign In Successful
    [Tags]    signin
    Verify Sign In Sucessful  ${locator_SignUp_Btn}     ${locator_next_page} 
    ...                       ${data_txt}    
    ...                       ${locator_Password}       abczy1234                     ${locator_msg_error_password}
    ...                       ${list_radio_btn}
    ...                       ${list_chkbox}            ${locator_msg_error_chkbox}    
    ...                       ${list_dropdown}

Test Case 23 : Show Password
    [Tags]    spwpass
    Verify Show Password Button    ${locator_shwpass_Btn}    ${locator_Password}    xyzab1234