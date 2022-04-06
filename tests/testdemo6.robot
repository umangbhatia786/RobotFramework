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

login and add multiple items to cart
    LandingPage.fill the form and login with    User    ${USERNAME}     ${VALID PASSWORD}   Teacher
    ShopPage.wait for element to be visible
    ShopPage.verify card titles on shop page
    ShopPageKey.add items to cart and checkout     ${listOfProducts}