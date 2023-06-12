*** Settings ***
Library    SeleniumLibrary
Resource    main.robot

*** Variables ***
#follow the variable nomenclature below; only replacing the store name in each new set of locators
###DEADSTOCK.CA###
${LIVESTOCK SEARCH ICON}    //*[@class='icon-search']
${LIVESTOCK SEARCH BAR}    search_box
${LIVESTOCK SIZE 9}    //*[@for='ProductSelect-option-Size-9']
${LIVESTOCK ADD TO CART}    AddToCart
${LIVESTOCK FIRST SEARCH RESULT}    //*[@class='ais-Hits-item']
*** Keywords ***
Add Item to Cart
    ${title}=    Get Title
    ${store}=    Evaluate    upper(${title}.split()[0])
    Wait Until Element Is Visible    ${${STORE} SEARCH ICON}    timeout=60
    Input Text    ${${STORE} SEARCH BAR}    ${ITEM}
    Press Key    ${${STORE} SEARCH BAR}    \ue007
    Wait Until Element Is Visible    ${LIVESTOCK FIRST SEARCH RESULT}    timeout=60
    Click Element    ${LIVESTOCK FIRST SEARCH RESULT}
    Wait Until Element Is Visible    ${${STORE} SIZE 9}    timeout=60
    Click Element    ${${STORE} SIZE 9}
    Click Button    ${${STORE} ADD TO CART}
    