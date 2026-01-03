*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/Variable_Search_Page.robot
Resource   /../home/ethan-kenway/Automate Test Practices/LoginPage/LoginKeword.robot

*** Keywords ***
Verify Header And Menuar
    [Documentation]    ใช้สำหรับการตรวจสอบ Header และ Menu bar ว่าปรากฏหรือไม่

    Page Should Contain Element    ${link_icon}
    Page Should Contain Element    ${locator_Noti}
    Page Should Contain Element    ${locator_icon_usr}
    Page Should Contain Element    ${locator_menu}
    
    Click Element                  ${link_icon}
    Wait Until Location Contains   https://automate-test.stpb-digital.com/user/list/


    Click Element                  ${locator_Noti}
    Wait Until Page Contains       Notifications    5s
    Click Element                  ${locator_read_noti}

    Click Element                 ${locator_menu}
    Wait Until Location Contains   https://automate-test.stpb-digital.com/user/list/


    Click Element                  ${locator_icon_usr}
    Wait Until Page Contains       User Test        5s

    Click Element                  ${locator_logout}
    Wait Until Location Contains   https://automate-test.stpb-digital.com/login/

Verify Search Page
    [Arguments]    ${all_list_select_dropdown}    ${locator_data_grid}    ${index_row_table}    ${search_btn}    ${clear_btn}    ${isClear}    ${isClose}    ${isOpen}

    #------------------------------- Setup -------------------------------
    IF    '${isOpen}' == 'Y'
        
    
    Open Login Page    ${url}
    Verify login Pass
    Wait Until Page Contains    Search Filters    5s

    END

    #------------------------------- Select dropdown search -------------------------------
        
        IF    $all_list_select_dropdown
            FOR    ${each_dropdown}    IN    @{all_list_select_dropdown}
            
                Wait Until Element Is Visible    ${each_dropdown.locator}
                Click Element                    ${each_dropdown.locator}
                Scroll Element Into View         ${each_dropdown.value}
                Click Element                    ${each_dropdown.value}
        
            END
        END

        IF    '${isClear}' == 'Y'
    
            Click Element                    ${clear_btn}
            Wait Until Page Contains         No rows    
        
        ELSE
            
            Click Element                    ${search_btn}

            IF    $all_list_select_dropdown

                ${index}=     Set Variable    1
                #verify data
                FOR    ${each_dropdown}    IN    @{all_list_select_dropdown}
                    
                    Wait Until Element Is Visible    ${locator_data_grid}[0]${index_row_table}${locator_data_grid}[${index}]
                    ${txt1}    Get Text              ${locator_data_grid}[0]${index_row_table}${locator_data_grid}[${index}]
                    ${txt2}    Get Text              ${each_dropdown.locator}
                    Should Be Equal As Strings       ${txt1}          ${txt2}
                    ${index}=    Evaluate    ${index} + 1
                END
            END
        END

    IF    '${isClose}' == 'Y'
        
        Close Browser

    END

    
Verify Row Per Page & Btn Top
    [Documentation]    ใช้สำหรับตรวจสอบการแบ่งหน้าของข้อมูล
    Verify Search Page                     ${EMPTY}    ${tables_data}    ${index_first}    ${locator_Btn_search}    ${locator_Btn_clear}    N    N    Y
    
    Click Element                          ${locator_row}
    Wait Until Element Is Visible          ${locator_row_selected}
    Scroll Element Into View               ${locator_row_selected}

    Click Element                          ${locator_row_selected}
    Scroll Element Into View               ${locator_row_txt}
    Wait Until Element Contains            ${locator_row_txt}            1–25 of 53

    Click Element                          ${locator_next_page}     
    Scroll Element Into View               ${locator_row_txt}
    Wait Until Element Contains            ${locator_row_txt}            26–50 of 53
         
    Click Element                          ${locator_next_previous}     
    Scroll Element Into View               ${locator_row_txt}
    Wait Until Element Contains            ${locator_row_txt}            1–25 of 53

    Click Element                          ${locator_scroll_to_back}
    Sleep                                  1s
    
    ${scroll_position}=    Execute Javascript    return window.scrollY;
    # ถ้าไม่เท่ากับ 0 ให้ Test Failed ทันที
    Should Be Equal As Integers    ${scroll_position}    0    msg=หน้าจอยังไม่ได้เลื่อนไปบนสุด!

Verify Back Button
    
    Wait Until Element Is Visible    ${locator_add_user_btn}
    Click Element                    ${locator_add_user_btn}
    Wait Until Location Contains     https://automate-test.stpb-digital.com/user/form/
    Click Element                    ${field_add_back_btn}
    Wait Until Location Contains     https://automate-test.stpb-digital.com/user/list/


Verify Default Page
    Wait Until Element Is Visible       ${field_add_firstname}        
    Wait Until Element Is Visible       ${field_add_lastname}        
    Wait Until Element Is Visible       ${field_add_email}        
    Wait Until Element Is Visible       ${field_add_mobile}        
    Wait Until Element Is Visible       ${field_add_hyperlink_rst}                          
    Page Should Contain Radio Button    ${field_add_gender}                female          
    Page Should Contain Radio Button    ${field_add_gender}                male
    Page Should Contain Checkbox        ${field_add_list_Test_Manual}          
    Page Should Contain Checkbox        ${field_add_list_SQL}          
    Page Should Contain Checkbox        ${field_add_list_Auto1}          
    Page Should Contain Checkbox        ${field_add_list_Auto2}
    Page Should Contain Element         ${field_add_dropdown_nationality}          
    Page Should Contain Element         ${field_add_dropdown_plan}          
    Page Should Contain Element         ${field_add_dropdown_role}
    Wait Until Element Is Visible       ${field_add_btn_sign-up}

Fill all data
    [Arguments]
    ...            ${dictionary_text_data}   
    ...            ${dictionary_password_data}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}               
    ...            ${list_dropdown}             
    
    #Fill all input txt
    IF    $dictionary_text_data
        FOR    ${each_data_txt}    IN    @{dictionary_text_data}
            
            Input Text                           ${each_data_txt.locator}    ${each_data_txt.value}
            Wait Until Element Is Not Visible    ${each_data_txt.err_locator}
        
        END
    END
    
    #Fill input password
    IF    $dictionary_password_data
        
        Input Password                           ${dictionary_password_data.locator}    ${dictionary_password_data.value}
        Wait Until Element Is Not Visible        ${dictionary_password_data.err_locator}
    
    END

    #Select Radio Btn
    IF    $list_group_radio_button
        
        FOR    ${each_radio}    IN       @{list_group_radio_button}
        
             IF  $each_radio.value    
                 
               Select Radio Button                      ${each_radio.group_name}         ${each_radio.value}            
               Wait Until Element Is Not Visible        ${each_radio.err_locator}
            
             END
        END
    END

    #Select check box
    IF    $list_checkbox


        FOR    ${each_locator_chkbox}   IN      @{list_checkbox}
            
            IF    $each_locator_chkbox.list
                FOR    ${each_chkbox}    IN       @{each_locator_chkbox.list}
                
                    
                    Page Should Contain Element                  ${each_chkbox}
                    Select Checkbox                              ${each_chkbox}
                    Checkbox Should Be Selected                  ${each_chkbox}
                    Wait Until Element Is Not Visible            ${each_locator_chkbox.err_locator} 
    
                END
            END
        END 
    END

    #Select DropDown
    IF    $list_dropdown
        FOR    ${each_dropdown}    IN    @{list_dropdown}
            IF    $each_dropdown.value
                
            
                Wait Until Element Is Visible       ${each_dropdown.locator}
                Click Element                       ${each_dropdown.locator}
                
                
                Wait Until Element Is Visible       ${each_dropdown.value}
                ${msg_list_nation_r}    Get Text    ${each_dropdown.value}
                
                Scroll Element Into View            ${each_dropdown.value}
                Click Element                       ${each_dropdown.value}
                    
                Wait Until Element Is Not Visible   ${each_dropdown.err_locator}
            END   
        END
    END

Verify Input Data 
    [Arguments]
    ...            ${dictionary_text_data}    
    ...            ${dictionary_password_data}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}                 
    ...            ${list_dropdown}
    ...            ${search_button}    ${clear_button}    
    ...            ${list_dropdown_search_page}
    ...            ${IsPass}   

#--------------------------------- Import from other file ----------------------------------
    Open Login Page                  ${url_login}
    Verify login Pass
    Wait Until Element Is Visible    ${locator_add_user_btn}
    Click Element                    ${locator_add_user_btn}
    Wait Until Location Contains     https://automate-test.stpb-digital.com/user/form/    
    Verify Default Page

#--------------------------------------------------------------------------------------------
    Fill all data  ${dictionary_text_data}    
    ...            ${dictionary_password_data} 
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}                 
    ...            ${list_dropdown}

    
    Click Button    ${field_add_btn_sign-up}
    
    IF    '${IsPass}' == 'Pass'
        
        Wait Until Page Contains            Register Success
        Wait Until Element Is Visible       ${field_add_btn_ok}
        Click Element                       ${field_add_btn_ok}
        Wait Until Location Contains        https://automate-test.stpb-digital.com/user/list/
        ${index_last}=     Set Variable     /div[last()]
        Verify Search Page                  ${list_dropdown_search_page}    ${tables_data}    ${index_last}   ${search_button}    ${clear_button}    N    N    N                              
        

        ${txt1}    Get Text              ${tables_data}[0]${index_last}${tables_data}[4]
        Should Be Equal As Strings       ${txt1}    ${dictionary_text_data[2].value}
        Close Browser

    ELSE
        
        Verify Requirement              ${dictionary_text_data}    
    ...                                 ${dictionary_password_data}  
    ...                                 ${list_group_radio_button}
    ...                                 ${list_checkbox}                 
    ...                                 ${list_dropdown}   
        Close Browser

    END
    

Verify Requirement

    [Arguments]    ${dictionary_text_data}    
    ...            ${dictionary_password_data}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}                 
    ...            ${list_dropdown}    


    IF    $dictionary_text_data
        FOR    ${each_data_txt}    IN    @{dictionary_text_data}
            IF    '${each_data_txt.err_status}' == 'fail'
                
                ${err_msg}    Get Text               ${each_data_txt.err_locator}
                Should Be Equal As Strings           ${err_msg}    ${each_data_txt.err_msg}
            
            END
        END
    END
    
    #Fill input password
    IF    $dictionary_password_data
        IF    '${dictionary_password_data.err_status}' == 'fail'
            
            ${err_msg}    Get Text               ${dictionary_password_data.err_locator}
            Should Be Equal As Strings           ${err_msg}    ${dictionary_password_data.err_msg}
    
        END
    END

    #Select Radio Btn
    IF    $list_group_radio_button
        
        FOR    ${each_radio}    IN       @{list_group_radio_button}
            IF    '${each_radio.err_status}' == 'fail'
            
                ${err_msg}    Get Text               ${each_radio.err_locator}
                Should Be Equal As Strings           ${err_msg}    ${each_radio.err_msg}
             
            END
        END
    END

    #Select check box
    IF    $list_checkbox

        FOR    ${each_locator_chkbox}   IN      @{list_checkbox}
            IF    '${each_locator_chkbox.err_status}' == 'fail'
                
               
                ${err_msg}    Get Text               ${each_locator_chkbox.err_locator}
                Should Be Equal As Strings           ${err_msg}    ${each_locator_chkbox.err_msg}
        
            END
        END 
    END


    #Select DropDown
    IF    $list_dropdown
        FOR    ${each_dropdown}    IN    @{list_dropdown}
            IF    '${each_dropdown.err_status}' == 'fail'
                
            
                ${err_msg}    Get Text                  ${each_dropdown.err_locator}
                Should Be Equal As Strings              ${err_msg}    ${each_dropdown.err_msg}
        
            END
        END
    END

Verify Reset Hyperlink 
    [Arguments]
    ...            ${dictionary_text_data}    
    ...            ${dictionary_password_data}
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}                 
    ...            ${list_dropdown}
    ...            ${Reset_button}    
   

#--------------------------------- Import from other file ----------------------------------
    Open Login Page                  ${url_login}
    Verify login Pass
    Wait Until Element Is Visible    ${locator_add_user_btn}
    Click Element                    ${locator_add_user_btn}
    Wait Until Location Contains     https://automate-test.stpb-digital.com/user/form/    
    Verify Default Page

#--------------------------------------------------------------------------------------------
    Fill all data  ${dictionary_text_data}    
    ...            ${dictionary_password_data} 
    ...            ${list_group_radio_button}
    ...            ${list_checkbox}                 
    ...            ${list_dropdown}
    
    
    Execute Javascript    window.scrollTo(document.body.scrollHeight, 0);
    Wait Until Element Is Visible    ${Reset_button}    
    Click Element                    ${Reset_button}

    IF    $dictionary_text_data
        FOR    ${each_data_txt}    IN    @{dictionary_text_data}
            IF    '${each_data_txt.err_status}' == 'fail'
                
                ${msg}    Get Text               ${each_data_txt.locator}
                Should Be Equal As Strings       ${msg}    ${EMPTY}
            
            END
        END
    END
    
    #Fill input password
    IF    $dictionary_password_data

            
        ${msg}    Get Text               ${dictionary_password_data.locator}
        Should Be Equal As Strings       ${msg}    ${EMPTY}
    

    END

    #Select Radio Btn
    IF    $list_group_radio_button
        
        FOR    ${each_radio}    IN       @{list_group_radio_button}
            
            Radio Button Should Not Be Selected    ${each_radio.group_name}
             
        END
    END

    #Select check box
    IF    $list_checkbox

        FOR    ${each_locator_chkbox}   IN      @{list_checkbox}
            FOR    ${each_chkbox}    IN    @{each_locator_chkbox.list}
            
                Checkbox Should Not Be Selected    ${each_chkbox}    
                
            END
            
        
        END 
    END


    #Select DropDown
    IF    $list_dropdown
        FOR    ${each_dropdown}    IN    @{list_dropdown}
                
            ${msg}    Get Text                  ${each_dropdown.locator}
            Should Be Equal As Strings          ${msg}    ${EMPTY}
    
        END
    END

    Close Browser