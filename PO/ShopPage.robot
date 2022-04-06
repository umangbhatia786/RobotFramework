*** Settings ***
Documentation    All the page objects and keywords for Shop Page
Library  Selenium2Library
Library     BuiltIn
Library     Collections
Library     String

*** Variables ***

${CHECKOUT_LOCATOR}     css:.nav-link
${css_card_titles}      css:.card-title

*** Keywords ***

wait for element to be visible
    wait until element is visible   ${CHECKOUT_LOCATOR}

verify card titles on shop page
    @{expected_list}=   create list     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    @{elements}=    get webelements     ${css_card_titles}
    @{actual_list}=   create list
    FOR    ${element}    IN    @{elements}
        append to list      ${actual_list}      ${element.text}
    END
    lists should be equal   ${expected_list}    ${actual_list}

select the card
    [Arguments]     ${name}
    @{elements}=    get webelements     ${css_card_titles}
    ${index}=   set variable    ${1}
    FOR    ${element}    IN    @{elements}
        exit for loop if    "${element.text}" == "${name}"
        ${index}=   evaluate     ${index} + ${1}
    END
    click button    xpath:(//*[@class='card-footer'])[${index}]/button
