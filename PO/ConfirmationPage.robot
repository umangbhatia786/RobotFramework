*** Settings ***
Documentation    All the page objects and keywords for Checkout Page
Library  Selenium2Library
Library     BuiltIn
Library     Collections
Library     String

*** Variables ***

${lct_checkbox}     checkbox2
${lct_btn_purchase}     btn btn-success btn-lg
${lct_success_msg}      xpath://div[@class='alert alert-success alert-dismissible']
${expected_success_msg}     Thank you! Your order will be delivered in next few weeks :-)
*** Keywords ***

enter delivery location and purchase
    [Arguments]     ${country}
    input text      country     ${country}
    wait until element is visible   xpath://a[text()='${country}']
    click element   xpath://a[text()='${country}']
    execute javascript  document.getElementById("${lct_checkbox}").checked = true;
    execute javascript  document.getElementsByClassName('${lct_btn_purchase}')[0].click();


verify that order is placed
    wait until element is visible   ${lct_success_msg}
    ${msg_text}=    get text    ${lct_success_msg}
    should contain      ${msg_text}     ${expected_success_msg}
#    element text should be  ${lct_success_msg}  ${expected_success_msg}


