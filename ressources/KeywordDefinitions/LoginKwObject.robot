*** Settings ***
Documentation      Definition the keyword for modal User's Login
Library            SeleniumLibrary
Resource            ../Locators/LoginModal.resource


*** Keywords ***
Check_Page_Login_Displayed
    [Documentation]   verify Title's displayed
    Wait Until Element Is Visible       ${titleModalLogin}
    Element Text Should Be              ${titleModalLogin}      ${str_titlePage}


Enter_User_Pswd_SP
    [Documentation]    user can enter his username and his password
    [Arguments]        ${username_str}=   ${password_str}=
    Input Text         ${txt_loginusername}   ${username_str}
    Input Text         ${txt_loginpassword}    ${password_str}


Confirm_Login_SP
    [Documentation]   user click button Login for confirming
    Click Button            ${btn_login}


Cancel_Login_SP
    [Documentation]    user cancel his login
    Click Button            ${btn_close}


Dialog_Error_Display
    Sleep    1s
    ${msg_error}=    Handle Alert    timeout=1s
    [Return]    ${msg_error}