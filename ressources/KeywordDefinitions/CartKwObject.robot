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


