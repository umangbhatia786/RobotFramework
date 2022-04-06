*** Settings ***

Documentation   To validate the login form
Library  Selenium2Library
Library     BuiltIn
Library     ../resources/keywords/UserKeywords.py
Resource    generic.robot
Test Teardown   demo_resource.delete cookies and close all browser sessions
Test Setup   demo_resource.open the browser with Mortage Payment URL

*** Test Cases ***

Validate window switch
    select the link of child window
    verify user is switched to new window
    grab the email id in the child window
    switch to parent window and enter email

*** Keywords ***

select the link of child window
    click element       css:.blinkingText
    Sleep   7s

verify user is switched to new window
    switch window       NEW
    element text should be      xpath://*[@class='inner-box']/h1        DOCUMENTS REQUEST

grab the email id in the child window
    ${text}=    get text    css:.red
    ${email}=   return email from text    ${text}
#    log to console  ${email}
    set global variable     ${email}

switch to parent window and enter email
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text      id:username     ${email}
    sleep   5s




