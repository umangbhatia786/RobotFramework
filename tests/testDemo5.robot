*** Settings ***

Documentation   Parametrization in Robot framework
Library  Selenium2Library
Library     BuiltIn
Test Teardown   delete cookies and close all browser sessions
Test Setup       open the browser with Mortage Payment URL
Test Template    Validate unsuccessful Login
Library     DataDriver  ../resources/test_data/credentials_data.csv    dialect=excel     encoding=utf-8    delimiter=,

*** Variables ***

${URL}     https://www.rahulshettyacademy.com/loginpagePractise/
${BROWSER}  Chrome
${ERROR_MESSAGE_LOCATOR}    css:.alert-danger

*** Test Cases ***

Try unsuccessful login with username as ${user} and password as ${pwd}      xyz     12345


*** Keywords ***

Validate unsuccessful Login
    [Arguments]     ${user}     ${pwd}
    fill the login form     ${user}     ${pwd}
    wait until it checks and displays error message
    verify error message is correct

open the browser with Mortage Payment URL
    create webdriver    ${BROWSER}      executable_path=/Users/ubhatia/PycharmProjects/UdemyRF/resources/drivers/chromedriver
    go to   ${URL}
    maximize browser window
    set browser implicit wait   20s

fill the login form
    [Arguments]     ${username}     ${password}
    input text  id:username     ${username}
    input password  id:password     ${password}
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



