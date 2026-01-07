*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***

*** Test Cases ***
Play around with dictionary
    &{data}=    Create Dictionary    name=siva    job=qa    role=engineer
    Log    ${data}
    Dictionary Should Contain Key    ${data}    name
    ${job}=    Get From Dictionary    ${data}    job
    Log    ${job}
