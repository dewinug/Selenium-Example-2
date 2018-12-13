*** Settings ***

Documentation   Importing web and robotframework built-in keywords.
Library  SeleniumLibrary   timeout=10  #run_on_failure=CapturePageScreenShot
Library      XvfbRobot

*** Variables ***
${SERVER}         localhost:8000
${BROWSER}        chrome
${DELAY}          0.5
${VALID USER}     demo

*** Keywords ***
#########################################################
browser is opened to home page
    [Documentation]
#    Start Virtual Display    1920    1080
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Opened

I search for item "${item to search}"
    [Documentation]
    Wait Until Element Is Visible    css=#twotabsearchtextbox
    click element    css=#twotabsearchtextbox
    Input Text    css=#twotabsearchtextbox    ${item to search}
    click element    css=#nav-search > form > div.nav-right > div > input

I "${item name}"
    Wait Until Element Is Visible    xpath=//*[@value="Save for later" and contains(@aria-label, "${item name}")]
    click element     xpath=//*[@value="Save for later" and contains(@aria-label, "${item name}")]

I click "${item name}"
    [Documentation]
    Wait Until Element Is Visible    xpath=//*[@value="Delete" and contains(@aria-label, "${item name}")]
    click element     xpath=//*[@value="Delete" and contains(@aria-label, "${item name}")]

click only item in save for later list
        [Documentation]
        Wait Until Element Is Visible    xpath=//*[@id="savedCartViewForm"]/div[3]/div/div[4]/div/div[1]/div/div/div[2]/ul/li[1]/span/a/span
        click element     xpath=//*[@id="savedCartViewForm"]/div[3]/div/div[4]/div/div[1]/div/div/div[2]/ul/li[1]/span/a/span

Click Paperback button
    [Documentation]
    Wait Until Element Is Visible    xpath=//*[@role="button" and contains(., "Paperback")]
    click element     xpath=//*[@role="button" and contains(., "Paperback")]


I opened searched item "${item to search}"
    [Documentation]
    click link    ${item to search}

I add opened item to shopping cart
    [Documentation]
    Wait Until Element Is Visible    css=#add-to-cart-button
    click element    css=#add-to-cart-button

Home Page Should Be Opened
    [Documentation]
    Title Should Be    Products

I select "${type}" book type
    [Documentation]
    Wait Until Element Is Visible    xpath=//*[@class="a-size-large mediaTab_title" and contains(., "${type}")]
    click element    xpath=//*[@class="a-size-large mediaTab_title" and contains(., "${type}")]

I open shopping cart
    [Documentation]
    Wait Until Element Is Visible    css=#nav-cart-count
    click element    css=#nav-cart-count




#Login Should Have Failed
#    [Documentation]
#    [Tags]
#    Location Should Be    ${ERROR URL}
#    Title Should Be    Error Page
#

Go To home page
    [Documentation]
    [Tags]
    Go To    ${SERVER}
    Home Page Should Be Opened

#Input Username
#    [Documentation]
#    [Tags]
#    [Arguments]    ${username}
#    Input Text    username_field    ${username}
#
#Input Password
#    [Documentation]
#    [Tags]
#    [Arguments]    ${password}
#    Input Text    password_field    ${password}
#
#Submit Credentials
#    [Documentation]
#    [Tags]
#    Click Button    login_button
#
#Welcome Page Should Be Open
#    [Documentation]
#    [Tags]
#    Location Should Be    ${WELCOME URL}
#    Title Should Be    Welcome Page
#
#User "${username}" logs in with password "${password}"
#    [Documentation]
#    [Tags]
#    Input username    ${username}
#    Input password    ${password}
#    Submit credentials
#
