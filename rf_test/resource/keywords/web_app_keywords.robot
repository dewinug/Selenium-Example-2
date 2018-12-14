*** Settings ***

Documentation   Importing web and robotframework built-in keywords.
Library  SeleniumLibrary   timeout=10  #run_on_failure=CapturePageScreenShot
Library      XvfbRobot
Library    OperatingSystem
Library    FakerLibrary

*** Variables ***
${SERVER}         https://security-scorecard-online-stor.herokuapp.com
${BROWSER}        chrome
${DELAY}          0.5

*** Keywords ***
#########################################################

browser is opened to home page
    [Documentation]
#    Start Virtual Display    1920    1080
    Open Browser    ${SERVER}    ${BROWSER}
#    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Opened

Home Page Should Be Opened
    [Documentation]
    Title Should Be    Products

I add product "${link}" to cart
    [Documentation]
    click link    ${link}
    click button Add to cart

I remove "${expected}" from cart
    [Documentation]
    ${row count}=    Get Element Count    xpath=//*[@id="content"]/table/tbody/tr
    ${index}    Set Variable     1
    : FOR    ${index}    IN    ${row count}
    \    ${value}=    Get Table Cell     xpath=//*[@id="content"]/table    ${index}    2
    \    Run Keyword If    '${value}'== '${expected}'    click element     xpath=//*[@id="content"]/table/tbody/tr[2]/td[4]/a
    \    ${index}=    Evaluate    ${index}+1
    \    exit for loop if    ${index} == ${row count}

I place order
    [Documentation]
    ${name}=    FakerLibrary.Name
    ${email}=    FakerLibrary.Email
    ${city}=    FakerLibrary.City
    ${postcode}=    FakerLibrary.Postcode
    ${address}=    FakerLibrary.Address
    Wait Until Element Is Visible    css=#id_first_name
    click element     css=#id_first_name
    Input Text     css=#id_first_name     ${name}
    Input Text     css=#id_last_name    ${name}
    Input Text     css=#id_email    ${email}
    Input Text     css=#id_address    ${address}
    Input Text     css=#id_postal_code    ${postcode}
    Input Text     css=#id_city    ${city}
    click button Place order

user notes the order number
    [Documentation]
    wait until page contains    Your order has been successfully completed. Your order number is
    ${order id}=    Get Text    xpath=//*[@id="content"]/p/strong
    Set Suite Variable    ${order id}    ${order id}

user navigates to admin page
    [Documentation]
    Goto     ${SERVER}/admin
    Input Text     css=#id_username    admin
    Input Text     css=#id_password    admin
    click button Log in

I search for order by id ${order id}
    [Documentation]
    Input Text     css=#searchbar    ${order id}
    click button Search

click button ${label}
    [Documentation]
    click element     xpath=//*[@value="${label}" and contains(@type, "submit")]