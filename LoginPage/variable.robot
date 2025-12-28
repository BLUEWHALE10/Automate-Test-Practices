*** Settings ***
Library    SeleniumLibrary


*** Variables ***
#----login Page
${url}                          https://automate-test.stpb-digital.com/login/
${browser}                      chrome
${locator_email}                id=email
${locator_password}             name=password
${locator_btnLogin}             id=btn-login
${locator_link}                 CSS=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a
${locator_err_msg_email}        xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_err_msg_password}     xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[2]/p
${locator_blind_btn}            xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/div/div/button
#----Search Filteds Page
${locator_Icon_user}            xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div
${locator_Logout_botton}        xpath=/html/body/div[4]/div[3]/ul/li