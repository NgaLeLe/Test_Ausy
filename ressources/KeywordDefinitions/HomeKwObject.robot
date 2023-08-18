*** Settings ***
Documentation      Definition the keyword for Home's Page : StoreProduct
Library            SeleniumLibrary
Resource           ../Locators/HomePage.resource
Resource           ./LoginKwObject.robot
Resource           ./SignUpKwObject.robot
Resource           ./CartKwObject.robot

*** Keywords ***
Check_Home_Page_Displayed
    Wait Until Element Is Visible    ${navLogo}
    Wait Until Element Contains      ${navLogo}     ${str_title_app}
    Wait Until Element Is Visible    ${menuCollapse}
    Element Should Be Visible        ${navLogin}
    Element Should Be Visible        ${navSignup}


Go_To_Cart_Page
    [Documentation]    Click menu Cart to go to page Cart
    Go_To_Menu_Item    ${navCart}
    Check_Page_Cart_Display


Go_To_Login_Page
    [Documentation]    Click menu Login to go to page Login
    Go_To_Menu_Item    ${navLogin}
    Check_Page_Login_Displayed


Go_To_SignUp_Page
    [Documentation]    Click menu "Sign up" to go to page Sign_up for a new user
    Go_To_Menu_Item    ${navSignup}
    Check_Page_SignUp_Displayed


Logout_Espace_User
    [Documentation]     user clicks Logout in menu
    ...         element Logout isn't displayed
    ...         element Login, Signup displayed

    Go_To_Menu_Item                  ${navLogout}
    Element Should Be Visible        ${navLogin}
    Element Should Be Visible        ${navSignup}
    Element Should Not Be Visible    ${navLogout}


Go_To_Menu_Item
    [Documentation]    Click menu item with para menuItem to go to page Item's detail
    [Arguments]     ${menuItem}

    Wait Until Element Is Visible   ${menuItem}
    Click Link                      ${menuItem}


