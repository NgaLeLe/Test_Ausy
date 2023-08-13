*** Settings ***
Documentation      Definition the keyword for modal Place Order
Library            SeleniumLibrary
Resource            ../Locators/PlaceOrderModal.resource
Resource            ./ModalKwObject.robot
Resource            ../Variables/VAR_PlaceOrder.resource

*** Variables ***
${mess}

*** Keywords ***
Check_Page_Place_Order_Displayed
    [Documentation]   verify Title's Login displayed
    Check_Modal_Page_Displayed          ${titleModalOrder}    ${str_titleModal}   ${btn_purchase}


Enter_User_Card_Place_Order
    [Documentation]    user can enter his name and the information's card
    ...                card's information declare by para <info_card>
    [Arguments]        ${info_card}

    Input Text         ${txt_name}      ${info_card}[name]
    Input Text         ${txt_country}   ${info_card}[country]
    Input Text         ${txt_city}      ${info_card}[city]
    Input Text         ${txt_card}      ${info_card}[card]
    Input Text         ${txt_month}     ${info_card}[month]
    Input Text         ${txt_year}      ${info_card}[year]


Confirm_Purchase_Place_SP
    [Documentation]   user click button Purchase for confirming his order

    Confirm_Modal_SP        ${btn_purchase}
    Sleep    1s

    TRY
        Element Should Be Enabled    ${str_confirm_purchase}
        Set Variable    ${mess}     Get_Message_Confirm_Purchase
    # ${ok}=      Run Keyword And Return Status    Element Should Be Visible
    # IF    '${ok}' == 'True'
    #    Set Variable    ${mess}     Get_Message_Confirm_Purchase
    # ELSE
    #    Set Variable    ${mess}     Dialog_Message_SP_Display
    # END
    EXCEPT
        Set Variable    ${mess}     Dialog_Message_SP_Display
    END
    Log    ${mess}


Cancel_PlaceOrder_SP
    [Documentation]    Close modal Place_Order and return page Cart
    Cancel_Modal_SP         ${btn_close_modal}
    Wait Until Element Is Not Visible   ${formulePlaceOrder}   1s


Close_PlaceOrder_SP
    Close_Modal_SP      ${btn_close_top2}


Get_Message_Confirm_Purchase
    Log    Purchase_OK
    Wait Until Element Is Visible   ${mess_confirm_purchase}
    ${mess}=    Get Text    ${mess_confirm_purchase}
    Click Button        ${btn_OK_popup_confirm}
    [Return]    ${mess}

