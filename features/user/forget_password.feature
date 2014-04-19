Feature: Forget Password
  As a user i should be able to reset my password
  
Background:
  Given I close the subscription popup
  And I visit home page and see the sign in popup
  And I click forget password link

Scenario: forget password page and submit form with wrong email
  Then I should see forget password page
  And I should see "Forgot your password?"
  And I should see "Please enter your email address below."

  When I submit resend instruction with " "
  Then I should see inline error "Email can't be blank"

  When I submit resend instruction with "test"
  Then I should see inline error "Email not found"

  #-------------------Non existing email--------------------
  When I submit resend instruction with "test@example.com"
  Then I should see inline error "Email not found"

Scenario: submit with correct email
  When I submit resend instruction with "user@mailinator.com"
  Then I should see flash message "You will receive an email with an option to change password."
