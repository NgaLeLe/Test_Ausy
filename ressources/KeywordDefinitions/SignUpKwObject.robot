*** Settings ***
Documentation      Definition the keyword for modal User's Login
Library            SeleniumLibrary
Resource           ./Common.robot
Resource           ./ModalKwObject.robot
Resource           ../Locators/SignUpModal.resource
Resource           ../Variables/VAR_SignUp.resource


*** Keywords ***
Check_Page_SignUp_Displayed
    [Documentation]   verify Title's Signup displayed
    Check_Modal_Page_Displayed          ${titleModalSignIn}   ${str_titlePageSignUp}   ${btn_signup}


Enter_New_User_Pswd_SP
    [Documentation]    user can enter new username and password
    [Arguments]        ${username_str}=   ${password_str}=
    Enter_User_Pswd_Modal_SP         ${txt_sign_username}     ${username_str}   ${txt_sign_password}     ${password_str}


Confirm_SignUp_SP
    [Documentation]   user click button Sign up for confirming his inscription
    ...     mess dans popup
    Confirm_Modal_SP        ${btn_signup}
    Sleep    1s
    ${mess_confirm}=    Dialog_Message_SP_Display
    [Return]    ${mess_confirm}
    # Should Be Equal    ${mess_confirm}   ${msg_signup_succes}


Cancel_SignUp_SP
    [Documentation]    user cancel his signup's popup
    Cancel_Modal_SP         ${btn_close}


Close_SignUp_SP
    [Documentation]    user close his signup's popup by clicking on button [x] on top
    Cancel_Modal_SP         ${btn_close_top}