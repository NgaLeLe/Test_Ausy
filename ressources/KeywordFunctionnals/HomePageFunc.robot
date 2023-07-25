*** Settings ***
Documentation      Definition the keyword functionnal for Page Home
Library            SeleniumLibrary
Resource           ../KeywordDefinitions/HomeKwObject.robot
Resource           ../KeywordDefinitions/LoginKwObject.robot

*** Keywords ***
Login_SP_Valid
    [Documentation]     Open modal Login and user can logis by his profile
    [Arguments]    ${username}  ${password}
    Go_To_Login_Page
    Enter_User_Pswd_SP    ${username}  ${password}
    Confirm_Login_SP


Login_SP_Invalid
    [Arguments]    ${usr}=  ${pswd}=
    Go_To_Login_Page
    Enter_User_Pswd_SP   ${usr}  ${pswd}
    Confirm_Login_SP
    ${mess}=  Dialog_Error_Display
    [Return]    ${mess}


Verify_Espace_By_User
    [Documentation]     When user logged in, verify his username is displayed and
    ...                 his espace is opend
    [Arguments]    ${username}
    Log         Espace of ${username}


Close_Login_SP
    Go_To_Login_Page
    Sleep    2s
    Cancel_Login_SP
    Wait Until Element Is Not Visible   ${modalLoginId}
    Log    Page Login is closed
