*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary

*** Variables ***
${Shop_page_load}           css:.nav-link


*** Keywords ***
wait until Element is located in the page
    Wait Until Element Is Visible    ${Shop_page_load}

verify card titles in the shop page
    @{expected_list} =   Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements} =   Get Webelements    css:.card-title
    @{actual_list}=    Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actual_list}    ${element.text}

    END
    Lists Should Be Equal    ${expected_list}    ${actual_list}

Add a product to the cart
    [Arguments]    ${card_name}
    @{elements}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${element}   IN    @{elements}
        IF    '${element.text}' == '${card_name}'    BREAK
            Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
        ${index}=    Evaluate    ${index} + 1

    END