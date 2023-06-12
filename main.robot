*** Settings ***
Documentation    This program is a modular bot that can automatically purchase items online through shopify-based vendors
Library    Dialogs
Library    SeleniumLibrary
#Library    hashlib
Resource    shopify_page.robot
Resource    store_page.robot

*** Variables ***
${browser}    chrome
###SHIPPING INFO###
${MY EMAIL}    adam.troiani@icloud.com
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
${MY CC NUMBER}
${MY CC NAME}
${MY CC EXPIRATION DATE}
${MY CC CVV}

*** Test Cases ***
Purchase Item
    ${MY CC NUMBER}=    Get Selection From User    Enter your credit card number
    ${MY CC NAME}=    Get Selection From User    Enter your name as it appears on your credit card
    ${MY CC EXPIRATION DATE}=    Get Selection From User    Enter your credit card expiration Date (MM/YY)
    ${MY CC CVV}=    Get Selection From User    Enter your CVV
    Add Item to Cart
    Click Button    ${CHECKOUT BUTTON}
    Enter Shipping Info
    Click Button    ${NEXT SHOPIFY PAGE BUTTON}
    Enter Payment Info and Buy