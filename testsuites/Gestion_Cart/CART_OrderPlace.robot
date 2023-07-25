*** Settings ***
Documentation   Tests cases for page Cart
Library         SeleniumLibrary
Resource        ../../ressources/Variables/RES_VariableGlobal.resource
Resource        ../../ressources/KeywordDefinitions/Common.robot
Resource        ../../ressources/KeywordDefinitions/HomeKwObject.robot
Resource        ../../ressources/KeywordDefinitions/CartKwObject.robot


*** Test Cases ***
Add_Place_Order_To_Cart
    [Documentation]
    Opening_PS_With_url     ${URL}      ${browser}
    Go_To_Cart_Page
    Check_Page_Cart_Display
    Click_Button_PlaceOrder
    Capture Page Screenshot    modal_Place_Order.png
    Close_Modal_Add_Cart
    Closing_Browser
