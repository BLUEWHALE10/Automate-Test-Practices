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
${locator_shwpass_Btn}             id=icon-toggle-show-password
${locator_next_page}               https://automate-test.stpb-digital.com/login/
${locator_sign_in_btn}             xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a

#------------------------- Data Selected From Select list ------------------------
${select_Nationality}              xpath=//*[@id="menu-"]/div[3]/ul/li[189]
${select_Role}                     xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${select_PlaN}                     xpath=//*[@id="menu-"]/div[3]/ul/li[3]


#------------------------- error msg --------------------------------------------
${txt_required_filed}               This field is required
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

#----------------------- Init Data ---------------------------------------------

# --- 1. Text Fields (เขียนแบบ Static Dictionary) ---
# รูปแบบ: &{ชื่อตัวแปร}    Key=Value    Key=Value
&{dict_first_name}      locator=${locator_FirstName}     value=Piriya              err_locator=${locator_msg_error_fname}
&{dict_last_name}       locator=${locator_LastName}      value=Poonpol             err_locator=${locator_msg_error_lname}
&{dict_email}           locator=${locator_Email}         value=Piriya@gmail.com    err_locator=${locator_msg_error_email}    
&{dict_mobile_phone}    locator=${locator_MobilePhone}   value=0981231234          err_locator=${locator_msg_error_phone}

# รวม Text Field ทั้งหมดเข้า List เดียว
@{data_txt}             ${dict_first_name}    ${dict_last_name}    ${dict_email}    ${dict_mobile_phone}

# --- 2. Radio Buttons ---
&{dict_radio_gender}    group_name=${group_Name_RadioBtn}    value=female    err_locator=${locator_msg_error_gender}

# รวม Radio เข้า List
@{list_radio_btn}       ${dict_radio_gender}

# --- 3. Checkboxes ---
# สังเกต: ไม่ต้องใช้ Create List แค่เคาะวรรค
@{list_chkbox}          ${locator_Checkbox_Test_SQL}    ${locator_Checkbox_Test_M}    ${locator_Checkbox_Test_A1}    ${locator_Checkbox_Test_A2}

# --- 4. Dropdowns (แยก 3 List ตามที่คุณทำมา) ---
&{dict_dropdown_Nationality}    locator=${locator_Selector_Nationality}    value=${select_Nationality}    err_locator=${locator_msg_error_select_Nation}   
&{dict_dropdown_Plan}           locator=${locator_Selector_Plan}           value=${select_PlaN}           err_locator=${locator_msg_error_select_Plan}   
&{dict_dropdown_Role}           locator=${locator_Selector_Role}           value=${select_Role}           err_locator=${locator_msg_error_select_Role}   

# รวม drop down ทั้งหมดเข้า List เดียว
@{list_dropdown}        ${dict_dropdown_Nationality}    ${dict_dropdown_Plan}    ${dict_dropdown_Role}
