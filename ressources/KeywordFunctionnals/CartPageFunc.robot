*** Settings ***
Documentation      Definition the keyword for Cart's Page
Library            SeleniumLibrary
Resource           ../Locators/CartPage.resource
Resource           ../Locators/PlaceOrderModal.resource

*** Keywords ***
Click_Place_Order
    [Documentation]    Click button PlaceOrder in Cart's Page
    ...                Modal Place_order is displayed

    Click Button                        ${btn_PlaceOrder}
    Wait Until Element Is Visible       ${titleModalOrder}
    Element Should Contain              ${titleModalOrder}      ${str_titleModal}
