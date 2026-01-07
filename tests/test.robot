*** Settings ***
Documentation    Data driven tests with test case parameters + functional tests
...                When we use [Template] NONE, we can have both parameterized and non-parameterized tests in the same suite
Library    SeleniumLibrary
Library    Collections
Library    String
Library    ../custom libraries/Shop.py
Resource    ../PageObjects/LandingPage.robot
Resource    ../PageObjects/shoppage.robot
Resource    ../PageObjects/CheckoutPage.robot
Resource    ../PageObjects/ConfirmationPage.robot
Test Template    Validate UnSuccessful Login with parameterization
Resource    ../PageObjects/global.robot
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser


*** Variables ***
${Login_error_message}    css:.alert-danger
@{list_of_items}    Nokia Edge    Blackberry

*** Test Cases ***    username        password
Invalid Username      djhd            learning
Invalid Password      rahulshettyacademy     12345678
Invalid Both          user             pass1234



Validate UnSuccessful Login
    [Template]    NONE
    #Open the browser with the mortgage payment url
    LandingPage.Fill the login form    ${username}    ${invalid_password}
    global.wait until Element is located in the page    ${login_error_message}
    LandingPage.verify the error message is correct
    Hello World
    #hello world is from custom library shop

Validate cards display in the shopping page
    [Template]    NONE
    [Tags]    SMOKE
    LandingPage.Fill The Login Form    ${username}    ${valid_password}
    global.wait until Element is located in the page    css:.nav-link
    shoppage.verify card titles in the shop page
    Add Item To Cart    ${list_of_items}
    Sleep    5

Validate the user login with role selection
    [Template]    NONE
    [Tags]    REGRESSION
    LandingPage.Fill the login details and select the user option

Validate the window handling
    [Template]    NONE
    Select the link of child window
    verify the user is switched to the child window
    Grab the email id in the child window
    Switch to parent window and enter the email


*** Keywords ***

Validate UnSuccessful Login with parameterization
    [Arguments]    ${username}    ${password}
    #Open the browser with the mortgage payment url
    LandingPage.Fill the login form    ${username}    ${password}
    global.wait until Element is located in the page    ${login_error_message}
    landingPage.verify the error message is correct







Select the link of child window
    Click Link    css:.blinkingText
    Sleep    5
    
verify the user is switched to the child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the email id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String   ${text}    at
    Log    ${words}
    ${text_split}=     Get From List    ${words}    1
    @{words_2}=    Split String    ${text_split}
    Log    ${words_2}
    ${email}=    Get From List    ${words_2}    0
    Log    ${email}
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}