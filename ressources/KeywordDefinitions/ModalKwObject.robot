*** Settings ***
Documentation      Definition the keyword for modal generic Login/Signup
Library            SeleniumLibrary
Resource            ../Locators/LoginModal.resource


*** Keywords ***
Check_Modal_Page_Displayed
    [Documentation]   verify Title's and button confirm (like Login, Sing up) displayed
    [Arguments]       ${titleModal}     ${str_titleModal}   ${btn_confirm}

    Wait Until Element Is Visible       ${titleModal}
    Element Text Should Be              ${titleModal}      ${str_titleModal}
    Element Should Be Visible           ${btn_confirm}


Enter_User_Pswd_Modal_SP
    [Documentation]    user can enter his username and his password
    [Arguments]        ${input_usr}     ${username_str}   ${input_psw}     ${password_str}
    Input Text         ${input_usr}     ${username_str}
    Input Password     ${input_psw}     ${password_str}


Confirm_Modal_SP
    [Documentation]   user clicks button for confirming his action
    [Arguments]         ${btn_confirm}
    Click Button        ${btn_confirm}


Cancel_Modal_SP
    [Documentation]    user cancel his login
    [Arguments]         ${btn_cancel}
    Click Button        ${btn_cancel}


Close_Modal_SP
    [Arguments]         ${btn_close}
    Click Button        ${btn_close}