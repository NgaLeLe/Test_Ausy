*** Settings ***
Documentation      Definition the keyword for modal User's Login
Library            SeleniumLibrary
Resource            ../Locators/LoginModal.resource
Resource            ./ModalKwObject.robot


*** Keywords ***
Check_Page_Login_Displayed
    [Documentation]   verify Title's Login displayed
    Check_Modal_Page_Displayed          ${titleModalLogin}   ${str_titlePageLogin}   ${btn_login}


Enter_User_Pswd_SP
    [Documentation]    user can enter his username and his password
    [Arguments]        ${username_str}=   ${password_str}=
    Enter_User_Pswd_Modal_SP         ${txt_loginusername}     ${username_str}   ${txt_loginpassword}     ${password_str}


Confirm_Login_SP
    [Documentation]   user click button Login for confirming
    Confirm_Modal_SP        ${btn_login}
    Sleep    1s


Cancel_Login_SP
    [Documentation]    user cancel his login
    Cancel_Modal_SP         ${btn_close_down1}


