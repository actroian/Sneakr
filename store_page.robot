*** Settings ***
Library    SeleniumLibrary
Resource    main.robot

*** Variables ***
#follow the variable nomenclature below; only replacing the store name in each new set of locators
###DEADSTOCK.CA###
${LIVESTOCK SEARCH ICON}    //*[@class='icon-search']
${LIVESTOCK SEARCH BAR}    search_box
${LIVESTOCK SIZE 9-10.5}    //*[@for='ProductSelect-option-Size-9' or @for='ProductSelect-option-Size-9.5' or @for='ProductSelect-option-Size-10' or @for='ProductSelect-option-Size-10.5']
${LIVESTOCK ADD TO CART}    //*[text()='Add to Cart']
${LIVESTOCK FIRST SEARCH RESULT}    //*[@class='ais-Hits-item']
${LIVESTOCK CHECKOUT BUTTON}    //*[@class='btn cart__checkout']
${LIVESTOCK ACCEPT COOKIES}    //*[@class='cookie-consent__button btn no-hover']
*** Keywords ***
Add Item to Cart and Checkout
    [Arguments]    ${item}
    ${title}=    Get Title
    #${store}=    Evaluate    upper(${title}.split()[0])
    ${store}=    Set Variable    LIVESTOCK
    Click Element    ${${store} ACCEPT COOKIES}
    Wait Until Element Is Visible    ${${store} SEARCH ICON}    timeout=60
    Click Element    ${${store} SEARCH ICON}
    Input Text    ${${store} SEARCH BAR}    ${item}
    Press Key    ${${store} SEARCH BAR}    \ue007
    Wait Until Element Is Visible    ${LIVESTOCK FIRST SEARCH RESULT}    timeout=60
    Click Element    ${LIVESTOCK FIRST SEARCH RESULT}
    Wait Until Element Is Visible    ${${store} SIZE 9-10.5}    timeout=60    error=ERROR: SOLD OUT IN CHOSEN SIZE(S)
    Click Element    ${${store} SIZE 9-10.5}
    Click Button    ${${store} ADD TO CART}
    Wait Until Element Is Visible    ${${store} CHECKOUT BUTTON}    timeout=60
    Click Element    ${${store} CHECKOUT BUTTON}
    