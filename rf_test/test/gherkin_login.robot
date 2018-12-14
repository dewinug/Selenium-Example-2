*** Settings ***
Documentation     A test
...               at est

Resource          ../resource/keywords/web_app_keywords.robot

Suite Teardown    Close Browser

*** Test Cases ***
Order Produt
    Given browser is opened to home page
    And I add product "pilsner" to cart
    And click link    Continue shopping
    And I add product "Guiness" to cart
    And I remove "Guiness" from cart
    And click link    Continue shopping
    And I add product "Gambrinus" to cart
    When click link    Checkout
    And page should contain    1x pilsner
    And page should contain    1x Gambrinus
    And I place order

Delete
    Given user notes the order number
    And user navigates to admin page
    And click link    Orders
    When I search for order by id ${order id}

