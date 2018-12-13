*** Settings ***
Documentation     A test recreates instructed steps validation of actual values are not done as this exercise is a demo
...               Navigate to www.amazon.com and add the following books to your Amazon basket

...               1. 'Experiences of Test Automation: Case Studies of Software Test Automation'
...               2. 'Agile Testing: A Practical Guide for Testers and Agile Teams'
...               3. 'Selenium WebDriver 3 Practical Guide: End-to-end automation testing for web and mobile browsers with Selenium WebDriver, 2nd Edition'

...               Select the 'Save For Later' option for 'Experiences of Test Automation'
...               Select the 'Delete' option for 'Agile Testing'
...               Increase the quantity in your basket for 'Selenium WebDriver 3 Practical Guide' to 3 copies
...               Mark the order as a 'Gift'
...               Remove all copies of 'Selenium WebDriver 3 Practical Guide' from your basket
...               End the test
Resource          ../resource/keywords/web_app_keywords.robot

Test Teardown     Close Browser

*** Test Cases ***
buy given books on amazon
    Given browser is opened to home page
#    When I search for item "Experiences of Test Automation: Case Studies of Software Test Automation"
#    And I opened searched item "Experiences of Test Automation: Case Studies of Software Test Automation"
#    And I select "Paperback" book type
#    And I add opened item to shopping cart
#
#    Go To home page
#    When I search for item "Agile Testing: A Practical Guide for Testers and Agile Teams"
#    And I opened searched item "Agile Testing: A Practical Guide for Testers and Agile Teams"
#    And I select "Paperback" book type
#    And I add opened item to shopping cart
#
#    Go To home page
#    When I search for item "Selenium WebDriver 3 Practical Guide: End-to-end automation testing for web and mobile browsers with Selenium WebDriver, 2nd Edition"
#    And I opened searched item "Selenium WebDriver 3 Practical Guide: End-to-end automation testing for web and mobile browsers with Selenium WebDriver, 2nd Edition"
#    And Click Paperback button
#    And I add opened item to shopping cart
#    And I open shopping cart
#    And I "Save for later Selenium WebDriver 3 Practical Guide: End-to-end automation testing for web and mobile browsers with Selenium WebDriver, 2nd Edition"
#    And I click "Delete Agile Testing: A Practical Guide for Testers and Agile Teams"
#    And click only item in save for later list
#    And Select From List by Value    css=#quantity    3
#    And I add opened item to shopping cart
#    And I open shopping cart
#    And I click "Delete Selenium WebDriver 3 Practical Guide: End-to-end automation testing for web and mobile browsers with Selenium WebDriver, 2nd Edition"
