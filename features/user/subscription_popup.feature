Feature: subscription popup
  As a user i can subscribe news letter

Scenario: verify number, text, button on subscription popup
  Then I should see subscription popup
  And I should see signup button for subscription popup
  And I should see subscription form
  And I should see "No thanks, I’m already registered" link

  And I close the subscription popup
  Then I should see sign in link
  Then I should see sign up link

Scenario: subscription with invalid email
  And I submit subscription form with email " "
  Then I should see flash message "Email can't be blank"
  And I submit subscription form with email "test"
  Then I should see flash message "Email is invalid"

Scenario: subscription with valid email
  And I submit subscription form with email "test@example.com"
  Then I should see "Subscription Successful"
  Then I should see "Thank you for Subscribing!"
  Then I should see "Start Getting Those Discounts Now!"
