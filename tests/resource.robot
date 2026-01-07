*** Settings ***
Documentation    A resource file with reusable keywords and variables
...               can extend the docs using ...

Library    SeleniumLibrary

*** Variables ***
${username}    rahulshettyacademy
${invalid_password}    12345678
${valid_password}    learning

*** Keywords ***
Open the browser with the mortgage payment url
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
