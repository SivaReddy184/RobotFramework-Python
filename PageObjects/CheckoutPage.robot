*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary


*** Keywords ***

Verify items in the Checkout Page and proceed
    click element   css:.btn-success
