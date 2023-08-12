*** Settings ***
Documentation      Definition the keyword functionnal for Page Home
Library            SeleniumLibrary
Resource           ../KeywordDefinitions/Common.robot
Resource           ../KeywordDefinitions/HomeKwObject.robot
Resource           ../KeywordDefinitions/LoginKwObject.robot

*** Keywords ***
Login_SP_Valid
    [Documentation]     Open modal Login and user can login by his profile
    [Arguments]    ${username}  ${password}
    Go_To_Login_Page
    Enter_User_Pswd_SP    ${username}  ${password}
    Confirm_Login_SP


Login_SP_Invalid
    [Arguments]    ${usr}=  ${pswd}=
    Go_To_Login_Page
    Enter_User_Pswd_SP   ${usr}  ${pswd}
    Confirm_Login_SP
    ${mess}=  Dialog_Message_SP_Display
    [Return]    ${mess}


Verify_Espace_By_User
    [Documentation]     When user logged in, verify his username is displayed in the navbar and
    ...                 his espace is opend (has button Logout in navbar)
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${navNameUser}
    ${messWelcome}=     Catenate    Welcome    ${username}
    Element Should Contain      ${navNameUser}      ${messWelcome}
    Element Should Be Visible    ${navLogout}
    Element Should Not Be Visible    ${navSignup}
    Element Should Not Be Visible    ${navLogin}


Close_Login_SP
    Go_To_Login_Page
    Sleep    1s
    Cancel_Login_SP
    Wait Until Element Is Not Visible   ${modalLoginId}
    Log    Page Login is closed


SignUp_SP_New_User
    [Documentation]     Open modal "Sign up" and user can enter new username and new password
    [Arguments]    ${username}  ${password}
    Go_To_SignUp_Page
    Enter_New_User_Pswd_SP    ${username}  ${password}
    ${mess}=    Confirm_SignUp_SP
    [Return]    ${mess}


Logout_SP
    [Documentation]    user click menu item Logout
    ${logout}=      Element Should Be Visible    ${navLogout}
    Log    ${logout}
    Logout_Espace_User