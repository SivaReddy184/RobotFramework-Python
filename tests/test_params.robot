*** Settings ***
Documentation    Robot file to demonstrate data driven tests with test case parameters
Library    SeleniumLibrary
Library    Collections
Library    String
Test Template    Validate UnSuccessful Login with parameterization
Resource    resource.robot
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser


*** Variables ***
${Login_error_message}    css:.alert-danger

*** Test Cases ***    username        password
Invalid Username      djhd            learning
Invalid Password      rahulshettyacademy     12345678
Invalid Both          user             pass1234




*** Keywords ***

Validate UnSuccessful Login with parameterization
    [Arguments]    ${username}    ${password}
    #Open the browser with the mortgage payment url
    Fill the login form    ${username}    ${password}
    wait until Element is located in the page    ${login_error_message}
    verify the error message is correct

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until Element is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify the error message is correct
    #${result}=    Get Text    ${login_error_message}
    #Should Be Equal As Strings    ${result}    Incorrect username/password.
    Element Text Should Be    ${login_error_message}    Incorrect username/password.

