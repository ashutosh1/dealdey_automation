Feature: Deal Detail page
  As user i should be able to add deals in my cart

Background:
  Given I close the subscription popup

Scenario: User should be able to add more than one deal to cart
  And I add a deal to my cart
  And I add an another deal to my cart
  Then I should see 2 products in my cart on cart page
  Then I should see 2 in cart icon on cart page

Scenario: User should not be able to add more than deals per user
  And I add a deal with quantity greater than "user_upper_limit" 
  And I add it to cart
  Then I should see flash message "Quantity for Black Slazenger Mens Polo Shirt should not exceed 70."
  
Scenario: User should not be able to add more than max limit of deals
  And I add a deal with quantity greater than "maximum_limit" 
  And I add it to cart
  Then I should see flash error "Black Slazenger Mens Polo Shirt is sold out OR the quantities you have selected are not available."

