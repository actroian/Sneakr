*** Settings ***
Resource    Collections

*** Variables ***
###SHIPPING INFO###
${MY EMAIL}    ENTER_HERE
${MY FNAME}    ENTER_HERE
${MY LNAME}    ENTER_HERE
${MY ADDRESS}    ENTER_HERE
${MY CITY}    ENTER_HERE
${MY PROVINCE}    ENTER_HERE
${MY POSTAL CODE}    ENTER_HERE
${MY PHONE NUMBER}    ENTER_HERE

*** Keywords ***
Validate Personal Info
    @{info_list}=    Set Variable    MY EMAIL    MY FNAME    MY LNAME    MY ADDRESS  MY CITY  MY PROVINCE  MY POSTAL CODE  MY PHONE NUMBER
    FOR  ${info}  IN  @{info_list}
        Run Keyword If  '${${info}}' == 'ENTER_HERE'    Fail    FILL OUT personal_info.robot FILE
    END
