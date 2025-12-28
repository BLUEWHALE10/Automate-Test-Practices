*** Settings ***
Library          SeleniumLibrary
Resource         ${CURDIR}/Variable_Register.robot

*** Keywords ***
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
Open Register Page
    [Arguments]                         ${url}    ${brownser}=gc
    Open Browser                        ${url}    ${brownser}
    Wait Until Page Contains            Kru P' Beam
    Verify Default Page
Get Data
    [Documentation]                  Use 'Get Value' for tag input And other tag use 'Get Value' 
    [Arguments]                      ${locator}
    # 1. ดึงตัว Element ออกมาก่อน
    ${element}=    Get WebElement    ${locator}
    
    # 2. ดูชื่อ Tag ของมัน (เช่น input, div, span)
    ${tag}=        Set Variable      ${element.tag_name}
    Log            Found tag: ${tag}
    
    # 3. สร้างเงื่อนไข: ถ้าเป็น input ให้ดึง Value, ถ้าไม่ใช่ (เช่น div) ให้ดึง Text
    ${result}=     Run Keyword If    '${tag}' == 'input'    Get Value    ${locator}
    ...            ELSE              Get Text     ${locator}
    
    RETURN    ${result}


Verify Text Field Positive Case
    [Arguments]                         ${locator_field}    ${text}    ${err_locator}    ${button}
    Open Register Page                  ${url}
    Wait Until Element Is Visible       ${locator_field}
    Input Text                          ${locator_field}    ${text}
    Click Element                       ${button}
    Wait Until Element Is Not Visible   ${err_locator}
    Close Browser

Verify Text Field Negative Case
    [Arguments]                         ${locator_field}    ${text}    ${err_locator}    ${err_txt}    ${button}  
    Open Register Page                  ${url}
    Wait Until Element Is Visible       ${locator_field}
    Input Text                          ${locator_field}    ${text}
    Click Element                       ${button}
    Wait Until Element Is Visible       ${err_locator}

    ${txt_err_fname}    Get Data        ${locator_msg_error_fname}
    Should Be Equal As Strings          ${txt_err_fname}                  This field is required
    Close Browser

Verify Password Field Positive Case
    [Arguments]                         ${locator_field}    ${text}    ${err_locator}    ${button}
    Open Register Page                  ${url}    
    Wait Until Element Is Visible       ${locator_field}
    Input Text                          ${locator_field}    ${text}
    Click Element                       ${button}
    Wait Until Element Is Not Visible   ${err_locator}    
    Close Browser
Verify Password Field Negative Case
    [Arguments]                         ${locator_field}    ${text}    ${err_locator}    ${err_txt}    ${button}
    Open Register Page                  ${url}
    Wait Until Element Is Visible       ${locator_field}
    Input Password                      ${locator_field}    ${text}
    Click Element                       ${button}
    Wait Until Element Is Visible       ${err_locator}

    ${txt_err_fname}    Get Data        ${locator_msg_error_fname}
    Should Be Equal As Strings          ${txt_err_fname}                  ${err_txt}
    Close Browser
Verify Radio Button
    [Arguments]    ${group_name}    ${value}    ${status}          ${err_locator}    ${err_msg}    ${button_chk}
    
    Page Should Contain Radio Button             ${group_name}
    
    IF    '${status}' == 'pass'
        Select Radio Button                      ${group_name}         ${value}
        Click Element                            ${button_chk}
        Wait Until Element Is Not Visible        ${err_locator}
    ELSE 
        Click Element                            ${button_chk}
        Wait Until Element Contains              ${err_locator}    ${err_msg}
    END



    

Verify check box
    [Arguments]    ${locator_chk_box}    ${status}    ${err_locator}    ${err_msg}    ${button_chk}
    
    IF    '${status}' == 'pass'

        Page Should Contain Checkbox        ${locator_chk_box}
        Select Checkbox                     ${locator_chk_box}
        Page Should Contain Checkbox        ${locator_chk_box}
        Checkbox Should Be Selected         ${locator_chk_box}
    ELSE
        Click Element                       ${button_chk}
        Wait Until Element Contains         ${err_locator}    ${err_msg}
    END

Verify Dropdown List
    [Arguments]                         ${list_locator_select_list}    ${status}       ${value}    ${err_msg}    ${locator_err}    ${button}
    
    IF    '${status}' == 'pass'
        
        Wait Until Element Is Visible       ${list_locator_select_list}
        Click Element                       ${list_locator_select_list}
        
        Wait Until Element Is Visible       ${value}
        ${msg_list_nation_r}    Get Data    ${value}
        
        Scroll Element Into View            ${value}
        Click Element                       ${value}
            
        Wait Until Element Is Not Visible   ${locator_err}
    
    ELSE

         Click Element                      ${button}    
         Element Should Contain             ${locator_err}    ${err_msg}
    
    END

Verify Required Field
    [Setup]

    Verify Text Field Negative Case        ${locator_FirstName}                  ${EMPTY}                       ${locator_msg_error_fname}       This field is required               ${locator_SignUp_Btn}
    Verify Text Field Negative Case        ${locator_LastName}                   ${EMPTY}                       ${locator_msg_error_lname}       This field is required               ${locator_SignUp_Btn}                
    Verify Text Field Negative Case        ${locator_Email}                      ${EMPTY}                       ${locator_msg_error_email}       This field is required               ${locator_SignUp_Btn}                
    Verify Text Field Negative Case        ${locator_Email}                      ${EMPTY}                       ${locator_msg_error_email}       This field is required               ${locator_SignUp_Btn}                
    Verify Password Field Negative Case    ${locator_Password}                   ${EMPTY}                       ${locator_msg_error_password}    This field is required               ${locator_SignUp_Btn}                
    Verify Text Field Negative Case        ${locator_MobilePhone}                ${EMPTY}                       ${locator_msg_error_phone}       This field is required               ${locator_SignUp_Btn}                
    
    Open Register Page                     ${url}
    Verify Radio Button                    ${group_Name_RadioBtn}                ${EMPTY}        fail           ${locator_msg_error_gender}      This field is required               ${locator_SignUp_Btn}
    Close Browser    
    
    Open Register Page                     ${url}
    Verify check box                       ${EMPTY}                              fail                           ${locator_msg_error_chkbox}      This field is required               ${locator_SignUp_Btn}
    Close Browser    
    
    Open Register Page                     ${url}
    Verify Dropdown List                   ${locator_msg_error_select_Nation}    fail                           ${EMPTY}                         This field is required               ${locator_msg_error_select_Nation}    ${locator_SignUp_Btn}
    Verify Dropdown List                   ${locator_msg_error_select_Plan}      fail                           ${EMPTY}                         This field is required               ${locator_msg_error_select_Plan}      ${locator_SignUp_Btn}
    Verify Dropdown List                   ${locator_msg_error_select_Role}      fail                           ${EMPTY}                         This field is required               ${locator_msg_error_select_Role}      ${locator_SignUp_Btn}
    Close Browser    
    
    [Teardown]
Verify Show Password Button
    [Arguments]    ${locator_button_show_password}    ${locator_password}    ${val_ref_password}
    Wait Until Element Is Visible          ${locator_button_show_password}
    Input Password                         ${locator_password}         ${val_ref_password}
    Click Element                          ${locator_button_show_password}
    ${txt}    Get Data                     ${locator_password}
    Should Be Equal As Strings             ${txt}                      ${val_ref_password}

Veryfy Link Sign In
    Wait Until Element Is Visible    ${locator_sign_in_btn}
    Click Element                    ${locator_sign_in_btn}
    Wait Until Page Contains         Kru P' Beam
Verify Hyperlink Reset
    Verify Default Page
    [Arguments]    ${locator_Hyperlink_reset_Btn} 
    ...            ${dictionary_text_data}    
    ...            ${locator_password}          ${password_val_test}        ${list_locator_err_pass}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}             ${locator_err_checkbox}                 
    ...            ${list_dropdown}
    
    #Fill all input txt

    FOR    ${each_data_txt}    IN    @{dictionary_text_data}
        
        Input Text                           ${each_data_txt.locator}    ${each_data_txt.value}
        Wait Until Element Is Not Visible    ${each_data_txt.err_locator}
    END
    
    #Fill input password
    Input Password                           ${locator_password}    ${password_val_test}
    Wait Until Element Is Not Visible        ${list_locator_err_pass}


    #Select Radio Btn
    FOR    ${each_radio}    IN      @{list_group_radio_button}
         
           Select Radio Button                      ${each_radio.group_name}         ${each_radio.value}            
           Wait Until Element Is Not Visible        ${each_radio.err_locator}
        
    END

    #Select check box
    FOR    ${each_locator_chkbox}   IN      @{list_checkbox}

            Page Should Contain Element                  ${each_locator_chkbox}
            Select Checkbox                              ${each_locator_chkbox}
            Checkbox Should Be Selected                  ${each_locator_chkbox}
            Wait Until Element Is Not Visible            ${locator_err_checkbox} 

    END 

    #Select DropDown
    FOR    ${each_dropdown}    IN    @{list_dropdown}
        
        Wait Until Element Is Visible       ${each_dropdown.locator}
        Click Element                       ${each_dropdown.locator}
        
        
        Wait Until Element Is Visible       ${each_dropdown.value}
        ${msg_list_nation_r}    Get Data    ${each_dropdown.value}
        
        Scroll Element Into View            ${each_dropdown.value}
        Click Element                       ${each_dropdown.value}
            
        Wait Until Element Is Not Visible    ${each_dropdown.err_locator}

    END    

    #-------------------------------------------- Activate Reset Button -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    Click Element    ${locator_Hyperlink_reset_Btn}
    Sleep            0.5 second

    #-------------------------------------------- Checking Process -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    #Check Txt should empty

    FOR    ${each_locator_txt}  IN      @{dictionary_text_data}
            
            ${txt}    Get Data            ${each_locator_txt.locator} 
            Should Be Equal As Strings    ${EMPTY}    ${txt}    
    END

    #Check password should empty

        ${txt}    Get Data            ${locator_password} 
        Should Be Equal As Strings    ${EMPTY}    ${txt}    

    #Check Radio btn should empty
    FOR    ${each_radio}    IN      @{list_group_radio_button}
        
        Radio Button Should Not Be Selected    ${each_radio.group_name}
           
    END

    #Check Drop down should empty
    FOR    ${each_dropdown}    IN      @{list_dropdown}
        
           ${txt}    Get Data    ${each_dropdown.locator}
           Should Be Empty       ${txt}
    END 
    
Verify Sign In Sucessful
    Verify Default Page
    [Arguments]    ${locator_Register_Button}   ${locator_next_page}
    ...            ${dictionary_text_data}    
    ...            ${locator_password}          ${password_val_test}        ${list_locator_err_pass}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}             ${locator_err_checkbox}                 
    ...            ${list_dropdown}             
    
    #Fill all input txt

    FOR    ${each_data_txt}    IN    @{dictionary_text_data}
        
        Input Text                           ${each_data_txt.locator}    ${each_data_txt.value}
        Wait Until Element Is Not Visible    ${each_data_txt.err_locator}
    END
    
    #Fill input password
    Input Password                           ${locator_password}    ${password_val_test}
    Wait Until Element Is Not Visible        ${list_locator_err_pass}

    #Select Radio Btn
    FOR    ${each_radio}    IN       @{list_group_radio_button}
         
           Select Radio Button                      ${each_radio.group_name}         ${each_radio.value}            
           Wait Until Element Is Not Visible        ${each_radio.err_locator}
        
    END

    #Select check box
    FOR    ${each_locator_chkbox}   IN      @{list_checkbox}

            Page Should Contain Element                  ${each_locator_chkbox}
            Select Checkbox                              ${each_locator_chkbox}
            Checkbox Should Be Selected                  ${each_locator_chkbox}
            Wait Until Element Is Not Visible            ${locator_err_checkbox} 

    END 

    #Select DropDown
    FOR    ${each_dropdown}    IN    @{list_dropdown}
        
        Wait Until Element Is Visible       ${each_dropdown.locator}
        Click Element                       ${each_dropdown.locator}
        
        
        Wait Until Element Is Visible       ${each_dropdown.value}
        ${msg_list_nation_r}    Get Data    ${each_dropdown.value}
        
        Scroll Element Into View            ${each_dropdown.value}
        Click Element                       ${each_dropdown.value}
            
        Wait Until Element Is Not Visible   ${each_dropdown.err_locator}

    END

    Wait Until Element Is Visible           ${locator_Register_Button}
    Click Element                           ${locator_Register_Button}
    Wait Until Page Contains                Register Success



