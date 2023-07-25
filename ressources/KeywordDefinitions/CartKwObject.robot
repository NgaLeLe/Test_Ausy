*** Settings ***
Documentation      Definition the keyword for Cart's Page
Library            SeleniumLibrary
Resource           ../Locators/CartPage.resource

*** Keywords ***
Check_Page_Cart_Display
    [Documentation]     Verify element's page is displayed
    Wait Until Element Is Visible       ${headerPage}
    Element Should Contain              ${headerPage}    ${str_headerPage}
    Wait Until Element Is Visible       ${btn_PlaceOrder}
    Element Text Should Be              ${btn_PlaceOrder}    ${str_btn_PlaceOrder}
    Log     "Page Cart is displayed"


Click_Button_PlaceOrder
    [Documentation]    Click button PlaceOrder in Cart's Page
    ...                Modal Place_order is displayed

    Wait Until Element Is Visible       ${btn_PlaceOrder}
    Click Element                       ${btn_PlaceOrder}
    Wait Until Element Is Visible       ${formulePlaceOrder}
    Log     Modal Place Order display


Close_Modal_Add_Cart
    [Documentation]    Close modal Place_Order and return page Cart
    Click Element                       ${btn_Close_modal}
    Wait Until Element Is Not Visible   ${formulePlaceOrder}   3s
