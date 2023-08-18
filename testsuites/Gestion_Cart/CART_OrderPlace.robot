*** Settings ***
Documentation   Tests cases for page Cart
Library         SeleniumLibrary
Resource        ../../ressources/Variables/RES_VariableGlobal.resource
Resource        ../../ressources/Variables/VAR_PlaceOrder.resource
Resource        ../../ressources/KeywordDefinitions/Common.robot
Resource        ../../ressources/KeywordDefinitions/HomeKwObject.robot
Resource        ../../ressources/KeywordDefinitions/OrderPlaceKwObject.robot
Resource        ../../ressources/KeywordFunctionnals/CartPageFunc.robot

Test Setup       Opening_PS_With_url     ${URL}      ${browser}

Test Teardown    Closing_Browser


*** Test Cases ***
CART_01_Annuler_PlaceOrder
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je peux aller au page Cart, suite, click button "Place Order"
    ...                 afin je peux annuler d'ajouter nouveau Purchase
    [Tags]    CART_01

    Go_To_Cart_Page
    Click_Place_Order
    Capture Page Screenshot    modal_Place_Order.png
    Cancel_PlaceOrder_SP


CART_02_PlaceOrder_Valide
    [Documentation]     En tant que l'utilisateur de l'application Product Store (SP),
    ...                 je vais au page Cart,
    ...                 je renseigne les infos de mon order et je le confirme
    ...                 l'app me donnera un message contenant mes infos saisies (name, credit_card) dans le popup

    [Tags]    CART_02

    Go_To_Cart_Page
    Click_Place_Order
    Enter_User_Card_Place_Order     ${info_card}
    ${mess_purchase}=    Confirm_Purchase_Place_Valid_SP
    Should Contain    ${mess_purchase}      ${info_card}[name]
    Should Contain    ${mess_purchase}      ${info_card}[card]
    Should Contain    ${mess_purchase}      ${str_amount}


CART_03_PlaceOrder_Input_Blank
     [Documentation]     En tant que l'utilisateur de l'application Product Store (SP), je vais au page Cart,
    ...                 je ne renseigne pas les infos et je le confirme
    ...                 l'app me donnera un message error "Please fill out Name and Creditcard."
    [Tags]    CART_03

    Go_To_Cart_Page
    Click_Place_Order
    ${mess_error}=    Confirm_Purchase_Place_Invalid_SP
    Should Be Equal    ${mess_error}    ${mess_place_invalid}
    Close_PlaceOrder_SP


