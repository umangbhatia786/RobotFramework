*** Settings ***
Documentation    All the page objects and keywords for Checkout Page
Library  Selenium2Library
Library     BuiltIn
Library     Collections
Library     String

*** Variables ***

${lct_btn_checkout}     xpath://button[@class='btn btn-success']

*** Keywords ***

verify items in the checkout page and proceed
    [Arguments]     ${expected_list}
    @{elements}=    get webelements     xpath://h4[@class='media-heading']/a
    @{mobile_list}=     create list
    FOR    ${element}    IN    @{elements}
        append to list      ${mobile_list}      ${element.text}
    END
    reverse list    ${mobile_list}
    lists should be equal   ${mobile_list}    ${expected_list}
    click button    ${lct_btn_checkout}