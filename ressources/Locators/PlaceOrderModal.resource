*** Variables ***
${formulePlaceOrder}    id:orderModal
${titleModalOrder}      id:orderModalLabel
${str_titleModal}       Place order

${txt_name}             id:name
${txt_country}          id:country
${txt_city}             id:city
${txt_card}             id:card
${txt_month}            id:month
${txt_year}             id:year

${btn_close_modal}      xpath://*[@id="orderModal"]/div/div/div[3]/button[contains(.,'Close')]
${btn_purchase}         xpath://*[@id="orderModal"]/div/div/div[3]/button[contains(.,'Purchase')]
${btn_close_top2}       xpath://*[@id="orderModal"]/div/div/div[@class="modal-header"]/button


${mess_confirm_purchase}    xpath://*/p[@class="lead text-muted "]
${btn_OK_popup_confirm}     xpath://*/div[@class="sa-button-container"]/div/button
