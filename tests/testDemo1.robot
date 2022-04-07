*** Settings ***

Documentation   To validate the login form
Library  Selenium2Library
Library     BuiltIn
Test Setup      open the browser with Mortage Payment URL
Test Teardown   delete cookies and close all browser sessions

*** Variables ***

${URL}     https://www.rahulshettyacademy.com/loginpagePractise/
${BROWSER}  Chrome
${ERROR_MESSAGE_LOCATOR}    css:.alert-danger

*** Test Cases ***

Validate successful Login
    [Tags]      SMOKE
    fill the login form
    wait until it checks and displays error message
    verify error message is correct

*** Keywords ***

open the browser with Mortage Payment URL
    create webdriver    ${BROWSER}      executable_path=/Users/ubhatia/PycharmProjects/UdemyRF/resources/drivers/chromedriver
    go to   ${URL}
    maximize browser window
    set browser implicit wait   20s

fill the login form
    input text  id:username     rahulshettyacademy
    input password  id:password     12345678
    click element   id:terms
    click button    id:signInBtn

wait until it checks and displays error message
    wait until element is visible   ${ERROR_MESSAGE_LOCATOR}   3s

verify error message is correct
    ${ERROR MESSAGE}=   get text    ${ERROR_MESSAGE_LOCATOR}
    element text should be  ${ERROR_MESSAGE_LOCATOR}      Incorrect username/password.

delete cookies and close all browser sessions
    delete all cookies
    close all browsers



