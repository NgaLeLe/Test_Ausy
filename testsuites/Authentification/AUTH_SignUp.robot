*** Settings ***
Documentation   Tests cases for page SignIn
Library         SeleniumLibrary
Resource        ../../ressources/Variables/RES_VariableGlobal.resource
Resource        ../../ressources/Variables/VAR_SignUp.resource
Resource        ../../ressources/Variables/VAR_Login.resource
Resource        ../../ressources/KeywordDefinitions/Common.robot
Resource        ../../ressources/KeywordFunctionnals/HomePageFunc.robot

Test Setup       Opening_PS_With_url     ${URL}      ${browser}
Test Teardown    Closing_Browser

*** Variables ***
${id}       0

*** Test Cases ***
AUTH_SIGN_01_New_User_Valid
    [Documentation]     En tant que un nouveau utilisateur de l'application Product Store (SP),
    ...                 je peux aller page "Sign_Up" pour m'inscrire par <username> et <password> qui sont accepté par SP
    ...                 afin je peux accéder mon espace personnel

    [Tags]    AUTH SIGN_01
    ${mess_app}=        SignUp_SP_New_User    ${n_user_valid}     ${n_pwd_valid}
    Should Be Equal       ${mess_app}       ${msg_signup_succes}
    Login_SP_Valid              ${n_user_valid}     ${n_pwd_valid}
    Verify_Espace_By_User       ${n_user_valid}
    Logout_Espace_User


AUTH_SIGN_02_New_User_Exist
    [Documentation]     En tant que un nouveau utilisateur de l'application Product Store (SP),
    ...                 je peux aller au page "Sign_Up" pour m'inscrire par <username> et/ou <password> existes
    ...                 l'application va me donner un message d'erreur "This user already exist."

    [Tags]    AUTH SIGN_02
    ${mess_error}=      SignUp_SP_New_User       ${n_user_valid}     ${n_pwd_valid}
    Should Be Equal          ${mess_error}   ${msg_user_exist}
    Close_SignUp_SP


AUTH_SIGN_03_Invalid_InputBlank
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je peux aller au page "Sign_Up" pour m'inscrire,
    ...                 si je ne renseigne pas username ni password ou aucun les deux
    ...                 l'application va me donner un message d'erreur
    ...                 "Please fill out Username and Password"

    [Tags]    AUTH  SIGN_03

    FOR  ${user_item}     IN   @{list_casdt}
        ${id}=   Evaluate    ${id} + 1
        Log    ${user_item}
        ${message_error}=       SignUp_SP_New_User   ${user_item}[usr]    ${user_item}[pswd]
        Should Be Equal    ${message_error}     ${msg_input_blank}
        Capture Page Screenshot    modal_signup_no_input_${id}.png
        Cancel_SignUp_SP
    END
