*** Settings ***
Documentation    This program is a modular bot that can automatically purchase items online through shopify-based vendors
Library    Dialogs
Library    SeleniumLibrary    run_on_failure=Screenshot    screenshot_root_directory=EMBED
#Library    hashlib
Resource    shopify_page.robot
Resource    store_page.robot
Test Teardown   Close Browser

*** Variables ***
${BROWSER}    chrome
###SHIPPING INFO###
${MY EMAIL}    test@cogeco.ca
${MY FNAME}    Adam
${MY LNAME}    Troiani
${MY ADDRESS}    11 Avery Circle
${MY CITY}    Stoney Creek
${MY PROVINCE}    On
${MY POSTAL CODE}    L8E 6B8
${MY PHONE NUMBER}    2899412280
###STORE URLS --- ENTER BEFORE RUNNING PROGRAM###
${LIVESTOCK URL}    https://www.deadstock.ca/
${COMING SOON}    MORE WEBSITES COMING SOON
###GLOBAL VARIABLES###
${QUANTITY}    ${1}

*** Test Cases ***
Purchase item
    ${store}=    Get Selection From User    What website would you like to shop on?    ${LIVESTOCK URL}    ${COMING SOON}
    ${item}=    Get Value From User    What item would you like to buy (give the exact name as it would appear on the website)
    #${my cc number}=    Get Value From User    Enter your credit card number
    #${my cc name}=    Get Value From User    Enter your name as it appears on your credit card
    #${my cc expiration}=    Get Value From User    Enter your credit card expiration Date (MM/YY)
    #${my cc cvv}=    Get Value From User    Enter your CVV    hidden=True
    ${my cc number}=    Set Variable    1234123412341234
    ${my cc name}=    Set Variable    Adam
    ${my cc expiration}=    Set Variable    11/11
    ${my cc cvv}=    Set Variable    123
    Open Browser    browser=${BROWSER}    url=${store}
    Maximize Browser Window
    Add item to Cart and Checkout    ${item}
    Enter Shipping Info
    Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    Enter Payment Info    ${my cc number}    ${my cc name}    ${my cc expiration}    ${my cc cvv}
    ##Uncomment the line below when you actually want an item to be purchased##
    #Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    Wait Until Element Is Not Visible    ${NEXT SHOPIFY PAGE BUTTON}    error=PAYMENT DID NOT GO THROUGH