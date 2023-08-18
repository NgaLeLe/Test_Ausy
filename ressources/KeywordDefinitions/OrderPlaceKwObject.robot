*** Settings ***
Documentation      Definition the keyword for modal Place Order
Library            SeleniumLibrary
Resource            ../Locators/PlaceOrderModal.resource
Resource            ./ModalKwObject.robot
Resource            ../Variables/VAR_PlaceOrder.resource
Resource            ./Common.robot

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
    ${name}=           Get Element Attribute       ${txt_name}   attribute=value
    Should Be Equal    ${name}    ${info_card}[name]
    Input Text         ${txt_country}   ${info_card}[country]
    Input Text         ${txt_city}      ${info_card}[city]
    Input Text         ${txt_card}      ${info_card}[card]
    Input Text         ${txt_month}     ${info_card}[month]
    Input Text         ${txt_year}      ${info_card}[year]


Confirm_Purchase_Place_Valid_SP
    [Documentation]   user click button Purchase for confirming his order valid
    Confirm_Modal_SP        ${btn_purchase}
    Sleep    1s
    ${ok}=      Run Keyword And Return Status    Page Should Contain    ${str_confirm_purchase}
    IF    ${ok}
        ${mess}=     Get_Message_Confirm_Purchase
    END
    [Return]        ${mess}


Confirm_Purchase_Place_Invalid_SP
    [Documentation]   user click button Purchase in the case's invalid
    ...               return alert's message

    Confirm_Modal_SP        ${btn_purchase}
    Sleep    1s
    ${mess}=    Dialog_Message_SP_Display
    [Return]        ${mess}


Cancel_PlaceOrder_SP
    [Documentation]    Close modal Place_Order and return page Cart
    Cancel_Modal_SP         ${btn_close_modal}
    Wait Until Element Is Not Visible   ${formulePlaceOrder}   1s


Close_PlaceOrder_SP
    [Documentation]   user click button [X] on the top of modal PlaceOrder
    Close_Modal_SP      ${btn_close_top3}


Get_Message_Confirm_Purchase
    Log    Purchase_OK
    Wait Until Element Is Visible   ${mess_confirm_purchase}
    ${mess}=    Get Text    ${mess_confirm_purchase}
    Log    ${mess}
    Click Button        ${btn_OK_popup_confirm}
    [Return]    ${mess}

