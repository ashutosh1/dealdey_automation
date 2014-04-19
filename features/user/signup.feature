Feature: Signup Feature
  As a application owner i need to make sure that user could sign up using valid data

Background:
  Given I close the subscription popup
  And I visit home page and see the sign up popup

Scenario: submits blank or invalid form
  Then I should see signup form
  And I submit blank signup form
  Then I should see inline error on all "SignupPage" mandatory field

  And I submit signup form with wrong email
  Then I should see inline error "Email is invalid"

  And I submit signup form with wrong mobile
  Then I should see inline error "Mobile is invalid"

  And I submit signup form with existing email
  Then I should see inline error "Email has already been taken"

  And I submit signup form with different password and password confirmation
  Then I should see inline error "Password doesn't match confirmation"

Scenario: submit form with valid data
  And I submit signup form
  Then I should see flash message "You have signed up successfully. Your login details have been sent to you through email."
