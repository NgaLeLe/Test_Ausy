*** Settings ***
Documentation   Tests cases for page SignIn
Library         SeleniumLibrary
Resource        ../../ressources/Variables/RES_VariableGlobal.resource
Resource        ../../ressources/Variables/VAR_SignUp.resource
Resource        ../../ressources/KeywordDefinitions/Common.robot
Resource        ../../ressources/KeywordFunctionnals/HomePageFunc.robot

Test Setup       Opening_PS_With_url     ${URL}      ${browser}
Test Teardown    Closing_Browser

*** Test Cases ***
AUTH_SIGN_01_New_User_Valid
    [Documentation]     En tant que un nouveau utilisateur de l'application Product Store (SP),
    ...                 je peux aller page "Sign_Up" pour m'inscrire par <username> et <password> qui sont accepté par SP
    ...                 afin je peux accéder mon espace personnel

    [Tags]    AUTH SIGN_01
    SignUp_SP_New_User_Valid    ${n_user_valid}     ${n_pwd_valid}
    Login_SP_Valid              ${n_user_valid}     ${n_pwd_valid}
    Verify_Espace_By_User       ${n_user_valid}
    Logout_Espace_User


AUTH_SIGN_02_New_Use
    [Documentation]     En tant que un nouveau utilisateur de l'application Product Store (SP),
    ...                 je peux aller au page "Sign_Up" pour m'inscrire par <username> et <password> existes
    ...                 l'application va me donner un message d'erreur "This user already exist."

    [Tags]    AUTH SIGN_02
    SignUp_SP_New_User_Valid    ${n_user_valid}     ${n_pwd_valid}
    ${mess_error}=      Dialog_Message_SP_Display
    Should Be Equal     ${mess_error}   ${msg_user_exist}
    Close_SignUp_SP

