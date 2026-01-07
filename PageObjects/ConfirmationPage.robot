*** Settings ***
Library    SeleniumLibrary
Resource    global.robot

*** Variables ***
${country}    id:country



*** Keywords ***
Enter the country and select the terms
    [Arguments]    ${country_name}
    Input Text    country    ${country_name}
    Wait Until Element is located in the page    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    Click Element    css:.checkbox label

Purchase the product and confirm the purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!