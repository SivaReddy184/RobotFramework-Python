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
Resource    ../PageObjects/global.robot
#Test Template    Validate UnSuccessful Login with parameterization
#Resource    resource.robot
Test Setup    global.Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser


*** Variables ***
${Login_error_message}    css:.alert-danger
@{list_of_items}    Nokia Edge    Blackberry
${Shop_page_load}           css:.nav-link

*** Test Cases ***

E2E ecommerce product validation
    LandingPage.Fill the login form    ${user_name}   ${valid_password}
    shoppage.wait until element is located in the page
    shoppage.verify card titles in the shop page
    Add Item To Cart    ${list_of_items}
    CheckoutPage.Verify items in the checkout page and proceed
    ConfirmationPage.Purchase the product and confirm the purchase








