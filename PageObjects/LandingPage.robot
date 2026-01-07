*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary
Resource        global.robot

*** Variables ***
${Login_error_message}    css:.alert-danger

*** Keywords ***
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

Fill the login details and select the user option

    Input Text    id:username    ${username}
    Input Password    id:password    ${valid_password}
    Click Element    //span[normalize-space()='User']
    Wait Until Element Is Visible    okayBtn
    Click Element    okayBtn
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    id:terms
    Click Button    signInBtn