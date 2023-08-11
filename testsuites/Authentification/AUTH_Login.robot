*** Settings ***
Documentation   Tests cases for page Login
Library         SeleniumLibrary
Resource        ../../ressources/Variables/RES_VariableGlobal.resource
Resource        ../../ressources/Variables/VAR_Login.resource
Resource        ../../ressources/KeywordDefinitions/Common.robot
Resource        ../../ressources/KeywordFunctionnals/HomePageFunc.robot

Test Setup       Opening_PS_With_url     ${URL}      ${browser}
Test Teardown    Closing_Browser

*** Variables ***
${id}           0

*** Test Cases ***
AUTH_LOG_01_Login_User_Valid
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je peux me connecter par <username> et <password> valide fournis par l'administrateur du SP
    ...                 afin je peux accéder mon espace personnel

    [Tags]    AUTH  LOG_01
    Login_SP_Valid                  ${username}     ${password}
    Verify_Espace_By_User           ${username}
    Logout_Espace_User


AUTH_LOG_02_Login_User_Invalid
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je peux me connecter par <username> et <password> invalide
    ...                 l'application va me donner un message d'erreur
    ...                 "Wrong password"

    [Tags]    AUTH  LOG_02
    ${message_error}=       Login_SP_Invalid       ${user_invalid}     ${pswd_invalid}
    Log    ${message_error}
    Should Be Equal    ${message_error}     ${msg_user_invalid}


AUTH_LOG_03_Invalid_Not_Input
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je ne renseigne pas username ni password, ou reseigne qu'un des 2 champs
    ...                 l'application va me donner un message d'erreur
    ...                 "Please fill out Username and Password"
    [Tags]    AUTH  LOG_03
    FOR  ${user_item}     IN   @{list_casdt}
        ${id}=   Evaluate    ${id} + 1
        Log    ${user_item}
        ${message_error}=       Login_SP_Invalid   ${user_item}[usr]    ${user_item}[pswd]
        Log    ${message_error}
        Should Be Equal    ${message_error}     ${msg_input_blank}
        Capture Page Screenshot    modal_login_no_input_${id}.png
        Cancel_Login_SP
    END


AUTH_LOG_04_Login_Close
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je peux aller au page Login, et j'annule de me connecter
    ...                 afin page Login ferme et je retour au page Home

    [Tags]    AUTH  LOG_04
    Close_Login_SP