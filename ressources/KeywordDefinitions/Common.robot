*** Settings ***
Documentation      Definition the common keyword in this application
Library            SeleniumLibrary
Resource           ./HomeKwObject.robot


*** Keywords ***
Opening_PS_With_Url
    [Documentation]    Open browser with URL valid
    [Arguments]    ${URL}   ${browser}

    Open Browser    ${URL}   ${browser}
    Check_Home_Page_Displayed
    Maximize Browser Window


Opening_Browser
    [Documentation]    Open browser
    [Arguments]    ${browser}
    Open Browser  about:blank  browser=${browser}
    Maximize Browser Window

Go_To_URL
    [Arguments]    ${URL}
    Go To    ${URL}


Closing_Browser
    Close All Browsers