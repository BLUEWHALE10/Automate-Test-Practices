*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${url}                       https://automate-test.stpb-digital.com/user/list/
${browser}                   chrome

# Login Page ------------------------------------------------------------------------------------------------------------------
${Field_Email}               id=email
${Field_Password}            name=password
${err_locator_Email}         xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${err_locator_password}      xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${Field_Btn_login}           id=btn-login

# Data login 
&{data_login_pass}           email=user.test@krupbeam.com    password=jKNsrapwLNV7eBN    


# Search Page ------------------------------------------------------------------------------------------------------------------
${link_icon}                xpath=//*[@id="__next"]/div[1]/div[1]/div/div[1]/a/h6
${locator_Noti}             xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_read_noti}        xpath=/html/body/div[3]/div[3]/ul/li[2]/button
#                           "img" can't click. Then we need to use xpath for link_icon.
${locator_icon_usr}         xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div

#                           use 'Selector' instead 'css' cause it expand and shrink maybe system can't find xpath.
${locator_logout}           css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li
#                           "svg" can't click. Then we need to use xpath for link_icon.
${locator_menu}             css=#__next > div.layout-wrapper.css-uinsfl > div.MuiDrawer-root.MuiDrawer-docked.layout-vertical-nav.css-1yvzy6r > div > div.MuiBox-root.css-ohwg9z > div > ul > li.MuiListItem-root.MuiListItem-gutters.nav-link.css-6zyuwx > a > div.MuiListItemIcon-root.css-35txlm > svg
${locator_select-status}    id=select-status

${locator_Btn_clear}        id=btn-clear
${locator_Btn_search}       id=btn-search

${locator_add_usr}          xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

#                           can't use! it's auto id.              
#${locator_row}             xpath=//*[@id=":r35:"]
${locator_row}              xpath=/html/body/div[1]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]/div
${locator_row_selected}       xpath=//*[@data-value="25"]

${locator_next_page}        xpath=//*[@aria-label="Go to next page"]
${locator_next_previous}    xpath=//*[@aria-label="Go to previous page"]
${locator_scroll_to_back}   xpath=//*[@aria-label="scroll back to top"]

${locator_add_user_btn}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

# Data Dropdown list
&{data_selected_dropdown}   select-rol=id=option-select-role-1    select-plan=id=option-select-plan-1    select-status=id=option-select-status-0

# ADD USER PAGE ------------------------------------------------------------------------------------------------------------------
${field_add_back_btn}                  xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${field_add_firstname}                 id=firstname
${field_addlastname}                   id=lastname
${field_add_email}                     id=email
${field_add_password}                  id=password
${field_add_mobile}                    id=mobile
${field_add_gender}                    name=validation-basic-radio
${field_add_list_SQL}                  name=courses.SQL
${field_add_list_Test_Manual}          name=courses.Test Manual
${field_add_list_Auto1}                name=courses.Automate Test
${field_add_list_Auto2}                name=courses.Automate Test2
${field_add_dropdown_nationality}      id=nationality
${field_add_dropdown_role}             id=select-role
${field_add_dropdown_plan}             id=select-plan
${field_add_hyperlink_rst}             id=reset
${field_add_btn_sign-up}               id=btn-sign-up
${field_add_btn_blind}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[4]/div/div/button


${selected_national}                   xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${selected_role}                       xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${selected_plan}                       xpath=//*[@id="menu-"]/div[3]/ul/li[2]


#Required Field Error Msg
${err_msg_firstname}                   id=error-firstname
${err_msg_lastname}                    id=error-lastname
${err_msg_email}                       id=error-email
${err_msg_password}                    id=error-password
${err_msg_mobile}                      id=error-mobile-phone
${err_msg_gender}                      id=validation-basic-gender
${err_msg_checkbox}                    id=validation-basic-courses
${err_msg_nationality}                 id=validation-basic-nationality
${err_msg_role}                        id=validation-role
${err_msg_plan}                        id=validation-plan
