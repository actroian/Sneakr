*** Settings ***
Library    SeleniumLibrary    run_on_failure=Screenshot    screenshot_root_directory=EMBED
Library    String
Resource    main.robot

*** Variables ***
#follow the variable nomenclature below; only replacing the store name in each new set of locators
###DEADSTOCK.CA###
${LIVESTOCK SEARCH ICON}    //*[@class='icon-search']
${LIVESTOCK SEARCH BAR}    search_box
${LIVESTOCK SIZE 9-10.5}    //*[@for='ProductSelect-option-Size-9' or @for='ProductSelect-option-Size-9.5' or @for='ProductSelect-option-Size-10' or @for='ProductSelect-option-Size-10.5']
${LIVESTOCK ADD TO CART}    //*[text()='Add to Cart']
${LIVESTOCK FIRST SEARCH RESULT}    //*[@data-algolia-index='Livestock_shopify_products']
${LIVESTOCK CHECKOUT BUTTON}    //*[@class='btn cart__checkout']
${LIVESTOCK ACCEPT COOKIES}    //*[@class='cookie-consent__button btn no-hover']
*** Keywords ***
Refresh Until Item is Visible
    [Arguments]    ${item locator}
    ${flag}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${item locator}    timeout=3
    WHILE    not ${flag}
        Reload Page
        ${flag}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${item locator}    timeout=3
        Log To Console    ${flag}
    END

Add Item to Cart and Checkout
    [Arguments]    ${item}    ${store}
    ${title}=    Get Title
    Click Element    ${${store} ACCEPT COOKIES}
    Wait Until Element Is Visible    ${${store} SEARCH ICON}    timeout=14400
    Click Element    ${${store} SEARCH ICON}
    Input Text    ${${store} SEARCH BAR}    ${item}
    Press Key    ${${store} SEARCH BAR}    \ue007
    ${item locator}=    Get Substring    ${${store} FIRST SEARCH RESULT}    0    -1
    ${item locator}=    Catenate    ${item locator}    and contains(@title,'${item}')]
    Log To Console    ${item locator}
    Refresh Until Item is Visible    ${item locator}
    Log To Console    ITEM FOUND ON WEBSITE
    Click Element    ${item locator}
    Wait Until Element Is Visible    ${${store} SIZE 9-10.5}    timeout=14400    error=ERROR: SOLD OUT IN CHOSEN SIZE(S)
    Click Element    ${${store} SIZE 9-10.5}
    Click Button    ${${store} ADD TO CART}
    Wait Until Element Is Visible    ${${store} CHECKOUT BUTTON}    timeout=14400
    Click Element    ${${store} CHECKOUT BUTTON}
    