Feature: Admin orders feature
  As admin i should be able place a order in behalf of any user

Background:
  Given I am logged in as admin
  And I click on "orders" in nav bar
  And I click on "new order" on "orders" page

Scenario: Admin search a deal and add it to cart
  Then I should see search deal form
  And I search and select a deal 
  Then I should see flash message "Cart Updated"
  And I should see deal added in cart

Scenario: Admin should be able to increase/decrease quantity of deals
  When I search and select a deal
  And I change quantity of item to 5 in cart
  Then I should see quantity 5 and updated line item total in cart
  And I should see updated grand total for cart

  When I change quantity of item to 2 in cart
  Then I should see quantity 2 and updated line item total in cart
  And I should see updated grand total for cart

Scenario: Admin should not be able to edit quantity more than deals per user
  When I search and select a deal
  And Admin edit quantity of deal with quantity greater than "user_upper_limit"
  Then I should see "Quantity for PoD Service Deal 1 should not exceed 70." in alert box

Scenario: Admin should not be able to edit quantity more than max limit of deals
  When I search and select a deal
  And Admin edit quantity of deal with quantity greater than "maximum_limit"
  Then I should see "Quantity for PoD Service Deal 1 should not exceed 70." in alert box

Scenario: Admin should add a user to order
  When I search and select a deal
  And I click on "continue" on "orders" page
  Then I should see field to search and add user to order
  And I search and add a user to order
  Then I should see "Customer Details"
  Then I should see customer details and proceed to payment button

Scenario: Admin should complete order using wallet payment
  When I search and select a deal
  And I click on "continue" on "orders" page
  And I search and add a user to order
  And I click on proceed to payment button
  Then I should see "Complete Purchase"
  And I should see "Order Summary"
  And I should see "Select Payment Method Below"
  And I should see wallet and pod payment option
  And I click on complete order
  Then I should see "Order Successfully Completed"

Scenario: Admin should complete order using pod
  When I search and select a deal
  And I click on "continue" on "orders" page
  And I search and add a user to order
  And I click on proceed to payment button
  Then I should see "Complete Purchase"
  And I should see "Order Summary"
  And I should see "Select Payment Method Below"
  And I should see wallet and pod payment option
  And I choose pod payment option
  Then I should see address to select or create an address for delivery
  And I choose an address for delivery
  And I click on 
  And I click on complete order
  Then I should see "Order Successfully Completed"

  #Please add shipping address for the PoD item.
  #a#pop-up-address
  

