*** Settings ***

Documentation   sample resource file to store variables and keywords
Library  Selenium2Library
Library     BuiltIn
Library     Collections
Library     String
#Library     ../resources/keywords/ShopPageKey.py

*** Variables ***

${URL}     https://www.rahulshettyacademy.com/loginpagePractise/
${BROWSER}  Chrome

*** Keywords ***

open the browser with Mortage Payment URL
    create webdriver    ${BROWSER}      executable_path=/Users/ubhatia/PycharmProjects/UdemyRF/resources/drivers/chromedriver
    go to   ${URL}
    maximize browser window
    set browser implicit wait   20s


delete cookies and close all browser sessions
    delete all cookies
    close all browsers




