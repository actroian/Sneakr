*** Settings ***
Library    SeleniumLibrary
Resource    main.robot
*** Variables ***
#####UNIVERSAL WEBSITE LOCATORS#####
#####------SHOPIFY LOCATORS------#####
${NEXT SHOPIFY PAGE BUTTON}    continue_button
${CLOSE SHOP PAY BUTTON}    //button[@class='vZKJ8']
#####INFO PAGE####
${SHIPPING EMAIL}    checkout_email
${EMAIL LIST CHECKBOX}    checkout_buyer_accepts_marketing
${SHIPPING FNAME}    checkout_shipping_address_first_name
${SHIPPING LNAME}    checkout_shipping_address_last_name
${SHIPPING ADDRESS}    checkout_shipping_address_address1
${SHIPPING CITY}    checkout[shipping_address][city]
${SHIPPING PROVINCE}    checkout_shipping_address_province
${SHIPPING POSTAL CODE}    checkout_shipping_address_zip
${SHIPPING PHONE NUMBER}    checkout_shipping_address_phone
###SHIPPING PAGE###
###PAYMENT PAGE###
${PAYMENT NUMBER}    //*[@data-card-field-placeholder='Card number']
${PAYMENT NAME}    //*[@data-card-field-placeholder='Name on card']
${PAYMENT EXPIRY}    //*[@data-card-field-placeholder='Expiration date (MM / YY)']
${PAYMENT CVV}    //*[@data-card-field-placeholder='Security code']

*** Keywords ***
Enter Shipping Info
    #make timeout greater once you verify that the keyword works#
    Wait Until Element Is Visible    ${SHIPPING EMAIL}    timeout=60
    Input Text    ${SHIPPING EMAIL}    ${MY EMAIL}
    Run Keyword And Ignore Error   Wait Until Element Is Visible    ${CLOSE SHOP PAY BUTTON}
    Run Keyword And Ignore Error    Click Button    ${CLOSE SHOP PAY BUTTON}
    Input Text    ${SHIPPING FNAME}    ${MY FNAME}
    Input Text    ${SHIPPING LNAME}    ${MY LNAME}
    Input Text    ${SHIPPING ADDRESS}    ${MY ADDRESS}
    Set Selenium Speed    0.5
    Input Text    ${SHIPPING CITY}    ${MY CITY}
    #Click Element    ${SHIPPING PROVINCE}
    Press Keys    ${SHIPPING PROVINCE}    ${MY PROVINCE}
    Press Key    ${SHIPPING PROVINCE}    \ue007
    Input Text    ${SHIPPING POSTAL CODE}    ${MY POSTAL CODE}
    Input Text    ${SHIPPING PHONE NUMBER}    ${MY PHONE NUMBER}
    Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    
Enter Payment Info
    Wait Until Element Is Visible    ${PAYMENT NUMBER}
    #Click Element    ${PAYMENT NUMBER}
    Press Keys    ${PAYMENT NUMBER}    ${MY CC NUMBER}
    Press Keys    ${PAYMENT NAME}    ${MY CC NAME}
    Press Keys    ${PAYMENT EXPIRY}    ${MY CC EXPIRATION DATE}
    Press Keys    ${PAYMENT CVV}    ${MY CC CVV}
