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

# Data login ========================================
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

${locator_select-role}      id=select-role
${locator_select-plan}      id=select-plan
${locator_select-status}    id=select-status


${locator_Btn_clear}        id=btn-clear
${locator_Btn_search}       id=btn-search

${locator_add_usr}          xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

#                           can't use! it's auto id.              
#${locator_row}             xpath=//*[@id=":r35:"]
${locator_row}              xpath=/html/body/div[1]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]/div
${locator_row_selected}     xpath=//*[@data-value="25"]
${locator_row_txt}          xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]

${locator_next_page}         xpath=//*[@aria-label="Go to next page"]
${locator_next_previous}     xpath=//*[@aria-label="Go to previous page"]
${locator_scroll_to_back}    xpath=//*[@aria-label="scroll back to top"]
${locator_confirm_top_page}  xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/div/div[1]
${locator_add_user_btn}      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

#Data Dropdown list ========================================
${selected_admin}                id=option-select-role-1
${selected_enterpirse}           id=option-select-plan-3
${selected_active}               id=option-select-status-2

${locator_data_grid}             xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div
${Role}                          /div[3]/div
${Plan}                          /div[4]/h6
${status}                        /div[5]/div/span
${data_grid_email}               /div[2]
                                       


@{tables_data}                   ${locator_data_grid}    ${Role}    ${Plan}    ${status}    ${data_grid_email}
${index_first}                   /div[1]

#combine data                          
&{list_dropdown_select-role_admin}        locator=${locator_select-role}        value=${selected_admin}
&{list_dropdown_select-plan_enterp}       locator=${locator_select-plan}        value=${selected_enterpirse}
&{list_dropdown_select-status_active}     locator=${locator_select-status}      value=${selected_active}         

#data role
@{list_dropdown_1}                        ${list_dropdown_select-role_admin}    ${list_dropdown_select-plan_enterp}    ${list_dropdown_select-status_active}
@{list_dropdown_2}                        ${list_dropdown_select-role_admin}    ${list_dropdown_select-plan_enterp}
@{list_dropdown_3}                        ${list_dropdown_select-role_admin}    ${list_dropdown_select-status_active}
  


# ADD USER PAGE ------------------------------------------------------------------------------------------------------------------
${field_add_back_btn}                  xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${field_add_firstname}                 id=firstname
${field_add_lastname}                  id=lastname
${field_add_email}                     id=email
${field_add_password}                  id=password
${field_add_mobile}                    id=mobile-phone
${field_add_gender}                    validation-basic-radio
${field_add_list_SQL}                  name=courses.SQL
${field_add_list_Test_Manual}          name=courses.Test Manual
${field_add_list_Auto1}                name=courses.Automate Test
${field_add_list_Auto2}                name=courses.Automate Test2
${field_add_dropdown_nationality}      id=nationality
${field_add_dropdown_role}             id=select-role
${field_add_dropdown_plan}             id=select-plan
${field_add_hyperlink_rst}             id=reset
${field_add_btn_sign-up}               xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
${field_add_btn_blind}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[4]/div/div/button
${field_add_btn_ok}                    id=btn-ok


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


#======================================== Data =======================================================

#*****************************************************************************************************

#Raw Text Data
&{dict_firstname_1}    locator=${field_add_firstname}    value=Piriya                       err_locator=${err_msg_firstname}
&{dict_lastname_1}     locator=${field_add_lastname}     value=Poonpol                      err_locator=${err_msg_lastname}
&{dict_email_1}        locator=${field_add_email}        value=Piri123@gmail.com            err_locator=${err_msg_email}
&{dict_mobile_1}       locator=${field_add_mobile}       value=0911231234                   err_locator=${err_msg_mobile}

&{dict_firstname_2}    locator=${field_add_firstname}    value=xxxxxxx                      err_locator=${err_msg_firstname}
&{dict_lastname_2}     locator=${field_add_lastname}     value=yyyyyyy                      err_locator=${err_msg_lastname}
&{dict_email_2}        locator=${field_add_email}        value=queens_omega@gmail.com       err_locator=${err_msg_email}
&{dict_mobile_2}       locator=${field_add_mobile}       value=0121231234                          err_locator=${err_msg_mobile}


#Combine Text data 
@{all_txt_data_1}    ${dict_firstname_1}    ${dict_lastname_1}    ${dict_email_1}    ${dict_mobile_1}           
@{all_txt_data_2}    ${dict_firstname_2}    ${dict_lastname_2}    ${dict_email_2}    ${dict_mobile_2}           

#*****************************************************************************************************


#*****************************************************************************************************

#radio button 1
&{dict_radio_gender_1}    group_name=${field_add_gender}    value=female    err_locator=${err_msg_gender}
#radio button 2
&{dict_radio_gender_2}    group_name=${field_add_gender}    value=male    err_locator=${err_msg_gender}
 
#combine radio button 1
@{all_radio_btn_1}       ${dict_radio_gender_1}
#combine radio button 2
@{all_radio_btn_2}       ${dict_radio_gender_2}

#*****************************************************************************************************



#*****************************************************************************************************
#Raw Selected Data
@{list_check_box_all}     ${field_add_list_SQL}    ${field_add_list_Test_Manual}    ${field_add_list_Auto1}    ${field_add_list_Auto2}      
#Make it in Dictionaly
&{dict_chk_1}             list=${list_check_box_all}         err_locator=${err_msg_checkbox}
&{dict_chk_2}             list=${list_check_box_all}[0:2]    err_locator=${err_msg_checkbox}
#Combine check box data
@{list_check_box_1}       &{dict_chk_1}
@{list_check_box_2}       &{dict_chk_2}
#*****************************************************************************************************



#*****************************************************************************************************
#Raw Selected Data 
${selected_add_national}       xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${selected_add_role}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${selected_add_plan}           xpath=//*[@id="menu-"]/div[3]/ul/li[3]


#Make it in Dictionaly
&{list_nationality}            locator=${field_add_dropdown_nationality}    value=${selected_add_national}    err_locator=${err_msg_nationality}    
&{list_role}                   locator=${field_add_dropdown_role}           value=${selected_add_role}        err_locator=${err_msg_role}             
&{list_plan}                   locator=${field_add_dropdown_plan}           value=${selected_add_plan}        err_locator=${err_msg_plan}           

#combine list                 
@{data_use_dropdown_1}         ${list_nationality}    ${list_role}    ${list_plan}
#*****************************************************************************************************