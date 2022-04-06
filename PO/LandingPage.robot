*** Settings ***
Documentation    All the page objects and keywords of Landing Page
Library  Selenium2Library

*** Variables ***

${lct_username}     id:username
${lct_password}     id:password
${lct_agree_terms}      id:terms
${lct_sign_btn}     id:signInBtn
${lct_btn_okay}     xpath://button[@class='btn btn-success']
${lct_drp_select}       css:select.form-control
${ERROR_MESSAGE_LOCATOR}    css:.alert-danger
${USERNAME}     rahulshettyacademy
${INVALID PASSWORD}     12345678
${VALID PASSWORD}   learning

*** Keywords ***

verify error message is correct
    ${ERROR MESSAGE}=   get text    ${ERROR_MESSAGE_LOCATOR}
    element text should be  ${ERROR_MESSAGE_LOCATOR}      Incorrect username/password.


fill the login form
    [Arguments]     ${username}    ${password}
    input text  ${lct_username}      ${username}
    input password  ${lct_password}       ${password}
    click element   ${lct_agree_terms}
    click button    ${lct_sign_btn}

fill the form and login with
    [Arguments]     ${role}     ${user}     ${pwd}      ${type}
    ${value}=   convert to lower case   ${role}
    input text  ${lct_username}     ${user}
    input password  ${lct_password}      ${pwd}
    log to console  ${value}
    click element   xpath://input[@value='${value}']

    IF   "${value}" == "user"
        click element   ${lct_btn_okay}
        sleep   3s
        click element   ${lct_btn_okay}
    END
    wait until element is visible  ${lct_drp_select}
    select from list by label   ${lct_drp_select}     ${type}
    wait until element is enabled   ${lct_agree_terms}
    click element   ${lct_agree_terms}
    click button    ${lct_sign_btn}