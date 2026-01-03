*** Settings ***
Library          SeleniumLibrary
Resource         ${CURDIR}/Keyword_Search_Page.robot
#esource         /../home/ethan-kenway/Automate Test Practices/LoginPage/LoginKeword.robot
Suite Setup      Set Selenium Speed    0.05s
Test Setup       Open Login Page    ${url_login}
Test Teardown    Close Browser
Suite Teardown   Close All Browsers

*** Test Cases ***
Test Validation Header And Menubar
    [Documentation]    ทดสอบการทำงานของ Header ของ link ต่างๆใน header และ menu
    [Tags]    Header
    Verify login Pass
    Wait Until Page Contains    Search Filters    5s
    Verify Header And Menuar

Test Validation Search page
    [Tags]    Search
    [Setup]
    [Template]            Verify Search Page      
    ${list_dropdown_2}    ${tables_data}    ${index_first}   ${locator_Btn_search}   ${locator_Btn_clear}    N    Y    Y   
    [Teardown]

Test Validation Row Per Page
    [Tags]    Row1
    [Setup]
    Verify Row Per Page & Btn Top
    [Teardown]


Test Validation Back Button
    [Tags]    BackButton
    Verify login Pass
    Verify Back Button


Test Validation add user pass
    [Tags]    add usr pass
    [Setup]
    [Template]    Verify Input Data

    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_1}    ${data_use_dropdown_1}    ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Pass          
    ${all_txt_data_2}    ${dict_password_2}    ${all_radio_btn_2}   ${list_check_box_2}    ${data_use_dropdown_1}    ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Pass          
    ${all_txt_data_1}    ${dict_password_f}    ${all_radio_btn_2}   ${list_check_box_2}    ${data_use_dropdown_1}     ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          

    [Teardown]


Test Validation Add User fail
    [Tags]    add usr fail
    [Setup]
    [Template]    Verify Input Data

    ${all_txt_data_f}    ${dict_password_2}    ${all_radio_btn_2}   ${list_check_box_2}    ${data_use_dropdown_1}     ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_f}   ${list_check_box_2}    ${data_use_dropdown_1}     ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_f}    ${data_use_dropdown_1}     ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_1}    ${data_use_dropdown_f1}    ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_1}    ${data_use_dropdown_f2}    ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_1}    ${data_use_dropdown_f3}    ${locator_Btn_search}    ${locator_Btn_clear}    ${list_dropdown_1}    Fail          
    
    [Teardown]

Test Validation Reset Add User
    [Tags]    rst btn
    [Setup]
    [Template]    Verify Reset Hyperlink

    ${all_txt_data_1}    ${dict_password_1}    ${all_radio_btn_1}   ${list_check_box_1}    ${data_use_dropdown_1}    ${field_add_hyperlink_rst}              
    

    [Teardown]

