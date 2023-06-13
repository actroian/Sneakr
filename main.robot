*** Settings ***
Documentation    This program is a modular bot that can automatically purchase items online through shopify-based vendors
Library    Dialogs
Library    SeleniumLibrary
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
###GENERAL VARIABLES --- ENTER BEFORE RUNNING PROGRAM###
${STORE URL}    https://www.deadstock.ca/
${ITEM}    New Balance 550 Made In USA
${QUANTITY}
###PAYMENT INFO###
#!!!DO NOT PUT YOUR PERSONAL INFO IN ANY OF THESE VARIABLE NAMES!!!#
#!!THEY ARE SIMPLY PLACEHOLDERS FOR A TERMINAL INPUT FOR SECURITY!!#
${MY CC NUMBER}    1234123412341234
${MY CC NAME}    Adam Troiani
${MY CC EXPIRATION DATE}    04/29
${MY CC CVV}    123

*** Test Cases ***
Purchase Item
    #${MY CC NUMBER}=    Get Value From User    Enter your credit card number
    #${MY CC NAME}=    Get Value From User    Enter your name as it appears on your credit card
    #${MY CC EXPIRATION DATE}=    Get Value From User    Enter your credit card expiration Date (MM/YY)
    #${MY CC CVV}=    Get Value From User    Enter your CVV    hidden=True
    Open Browser    browser=${BROWSER}    url=${STORE URL}
    Maximize Browser Window
    Add Item to Cart and Checkout
    Enter Shipping Info
    Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    Enter Payment Info
    #Click Button    ${NEXT SHOPIFY PAGE BUTTON}