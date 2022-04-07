*** Settings ***

Documentation   To validate the login form
Library  Selenium2Library
Library     BuiltIn
Library     ../resources/keywords/ShopPageKey.py
Resource    ../PO/generic.robot
Resource    ../PO/LandingPage.robot
Resource    ../PO/ShopPage.robot
Resource    ../PO/CheckoutPage.robot
Resource    ../PO/ConfirmationPage.robot
Test Teardown   generic.delete cookies and close all browser sessions
Test Setup   generic.open the browser with Mortage Payment URL

*** Variables ***

@{listOfProducts}   Blackberry  Nokia Edge
${country}  India

*** Test Cases ***

Place order for multiple items
    [Tags]      REGRESSION
    LandingPage.fill the form and login with    User    ${USERNAME}     ${VALID PASSWORD}   Teacher
    ShopPage.wait for element to be visible
    ShopPage.verify card titles on shop page
    ShopPageKey.add items to cart and checkout     ${listOfProducts}
    CheckoutPage.verify items in the checkout page and proceed      ${listOfProducts}
    ConfirmationPage.enter delivery location and purchase   ${country}
    ConfirmationPage.verify that order is placed