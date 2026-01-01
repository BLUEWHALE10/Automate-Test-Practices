*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/Variable_Search_Page.robot

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

