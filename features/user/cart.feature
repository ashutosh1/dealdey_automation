Feature: Cart page
  As user i should be able to edit quantity and remove deals from cart

Background:
  And I close the subscription popup

Scenario: User should not be able to edit quantity more than deals per user
  And I add a deal to my cart
  And I edit quantity of deal with quantity greater than "user_upper_limit"
  Then I should see "Quantity for Black Slazenger Mens Polo Shirt should not exceed 70." in alert box

Scenario: User should not be able to edit quantity more than max limit of deals
  And I add a deal to my cart
  And I edit quantity of deal with quantity greater than "maximum_limit"
  Then I should see "Black Slazenger Mens Polo Shirt  is sold out OR the quantities you have selected are not available." in alert box

Scenario: User should be able to increase/decrease quantity of deals
  And I add a deal to my cart
  And I change quantity to 5
  Then I should see quantity 5 and updated line item total
  Then I should see updated grand total

  And I change quantity to 2
  Then I should see quantity 2 and updated line item total
  Then I should see updated grand total

Scenario: Deals count on cart icon and table
  And I add a deal to my cart
  Then I should see 1 products in my cart on cart page
  And I should see 1 in cart icon on cart page
  And I should see "Continue shopping" button
  And I should see "Proceed to Payment" button
