*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://automate-test.stpb-digital.com
${browser}    Chrome

*** Test Cases ***
Test Open Webbrowser
    Open Browser                             ${URL}            ${browser}
    Wait Until Element Is Visible            id=email          5s
    Input Text                               id=email          User@gmail.com
    Input Password                           name=password     12345
    Press Key                                id=email          CRTL+A BACKSPACE