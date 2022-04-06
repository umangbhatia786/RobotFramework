*** Settings ***

Documentation   To validate the login form
Library  Selenium2Library
Library     BuiltIn
Library     ../resources/keywords/ShopPageKey.py
Resource    ../PO/generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Test Teardown   generic.delete cookies and close all browser sessions
Test Setup   generic.open the browser with Mortage Payment URL

*** Variables ***

@{listOfProducts}   Blackberry  Nokia Edge

*** Test Cases ***

#Validate unsuccessful Login
#    fill the login form     ${USERNAME}     ${INVALID PASSWORD}
#    wait for element to be visible      ${ERROR_MESSAGE_LOCATOR}
#    verify error message is correct


#Validate cards display in Shopping Page
#    fill the login form     ${USERNAME}     ${VALID PASSWORD}
#    wait for element to be visible      ${CHECKOUT_LOCATOR}
#    verify card titles on shop page
#    select the card     Nokia Edge


#fill form with arguments
#    fill the form and login with    User    ${USERNAME}     ${VALID PASSWORD}   Teacher

Validate cards display in Shopping Page
    fill the login form     ${USERNAME}     ${VALID PASSWORD}
    wait for element to be visible
    verify card titles on shop page
    add items to cart and checkout  ${listOfProducts}
    sleep   5s
