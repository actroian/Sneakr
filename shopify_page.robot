*** Settings ***
Library    SeleniumLibrary
Resource    main.robot
*** Variables ***
#####UNIVERSAL WEBSITE LOCATORS#####
${CHECKOUT BUTTON}    //*[text()='Checkout']
#####------SHOPIFY LOCATORS------#####
${NEXT SHOPIFY PAGE BUTTON}    continue_button
#####INFO PAGE####
${SHIPPING EMAIL}    checkout_email
${EMAIL LIST CHECKBOX}    checkout_buyer_accepts_marketing
${SHIPPING FNAME}    checkout_shipping_address_first_name
${SHIPPING LNAME}    checkout_shipping_address_last_name
${SHIPPING ADDRESS}    checkout_shipping_address_address1
${SHIPPING CITY}    checkout[shipping_address][city]
${SHIPPING PROVINCE}    checkout_shipping_address_province
${SHIPPING POSTAL CODE}    checkout_shipping_address_zip
${SHIPPING PHONE NUMBER}    SHIPPING
###SHIPPING PAGE###
###PAYMENT PAGE###
${PAYMENT NUMBER}    number
${PAYMENT NAME}    name
${PAYMENT EXPIRY}    expiry
${PAYMENT CVV}    verification_value

*** Keywords ***
Enter Shipping Info
    #make timeout greater once you verify that the keyword works#
    Wait Until Element Is Visible    ${SHIPPING EMAIL}    timeout=60
    Input Text    ${SHIPPING EMAIL}    ${MY EMAIL}
    Input Text    ${SHIPPING FNAME}    ${MY FNAME}
    Input Text    ${SHIPPING LNAME}    ${MY LNAME}
    Input Text    ${SHIPPING ADDRESS}    ${MY ADDRESS}
    Input Text    ${SHIPPING CITY}    ${MY CITY}
    Input Text    ${SHIPPING PROVINCE}    ${MY PROVINCE}
    Press Key    ${SHIPPING PROVINCE}    \ue007
    Input Text    ${SHIPPING POSTAL CODE}    ${MY POSTAL CODE}
    Input Text    ${SHIPPING PHONE NUMBER}    ${MY PHONE NUMBER}
    Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    
Enter Payment Info and Buy
    Wait Until Element Is Visible    ${PAYMENT NUMBER}
    Input Text    ${PAYMENT NUMBER}    ${MY CC NUMBER}
    Input Text    ${PAYMENT NAME}    ${MY CC NAME}
    Input Text    ${PAYMENT EXPIRY}    ${MY CC EXPIRATION DATE}
    Input Text    ${PAYMENT CVV}    ${MY CC CVV}
    #Click Button    ${NEXT SHOPIFY PAGE BUTTON}
