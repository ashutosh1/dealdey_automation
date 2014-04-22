Feature: Deal Detail page
  As user i should be able to add deals in my cart

Background:
  Given I close the subscription popup

Scenario: add product to cart
  And I go to detail page of "shippable deal"
  And I add deal to cart
  Then I should see flash message "Black Slazenger Mens Polo Shirt was successfully added to your cart"

Scenario: User should be able to add more than one deal to cart
  And I add a deal to my cart
  And I add an another deal to my cart
  Then I should see 2 products in my cart on cart page
  Then I should see 2 in cart icon on cart page

Scenario: User should not be able to add more than deals per user
  And I add a deal with quantity greater than "user_upper_limit" 
  And I add deal to cart
  Then I should see flash message "Quantity for Black Slazenger Mens Polo Shirt should not exceed 70."
  
Scenario: User should not be able to add more than max limit of deals
  And I add a deal with quantity greater than "maximum_limit" 
  And I add deal to cart
  Then I should see flash message "Black Slazenger Mens Polo Shirt is sold out OR the quantities you have selected are not available."

Scenario: options for shippable product on detail page
  When I go to detail page of "shippable deal"
  Then I should see available cod options
  Then I should see delivery detail
  And I click on view available area
  Then I should see states to select in popup

Scenario: rencredit deals
  When I go to detail page of "rencreditmax deal"
  Then I should see "Available for installmental payments"
  And I add deal to cart
  Then I should see flash message "Its a rencredit deal was successfully added to your cart"
