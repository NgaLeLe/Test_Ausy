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
    [Documentation]    Open browser without URL
    [Arguments]    ${browser}

    Open Browser  about:blank  browser=${browser}
    Maximize Browser Window

Go_To_URL
    [Documentation]    go to URL valid
    [Arguments]    ${browser}
    [Arguments]    ${URL}

    Go To    ${URL}


Closing_Browser
    Close All Browsers


Dialog_Message_SP_Display
    [Documentation]    get message's error in diolog when user clicks in the button "OK"
    TRY
        Fail    Alert not found in 1 second.
    EXCEPT
        Sleep    1s
        ${msg_error}=    Handle Alert    timeout=1s
    END
    Log     ${msg_error}
    [Return]    ${msg_error}