*** Settings ***
Documentation      Definition the keyword for Home's Page : StoreProduct
Library            SeleniumLibrary
Resource           ../Locators/HomePage.resource
Resource           ./LoginKwObject.robot


*** Keywords ***
Check_Home_Page_Displayed
    Wait Until Element Is Visible    ${navLogo}
    Wait Until Element Contains      ${navLogo}     ${str_title_app}
    Wait Until Element Is Visible    ${menuCollapse}


Go_To_Cart_Page
    [Documentation]    Click menu Cart to go to page Cart
    Go_To_Menu_Item    ${navCart}


Go_To_Login_Page
    [Documentation]    Click menu Cart to go to page Login
    Go_To_Menu_Item    ${navLogin}
    Check_Page_Login_Displayed


Go_To_Menu_Item
    [Documentation]    Click menu item with para menuItem to go to page Item's detail

    [Arguments]     ${menuItem}
    Wait Until Element Is Visible   ${menuItem}
    Click Link                      ${menuItem}


