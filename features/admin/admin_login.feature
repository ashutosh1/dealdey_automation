Feature: Admin login page
  As admin i should be able to login

Scenario: Admin should see login form and login with invalid credentials
  Given I visit admin section
  And I should see admin login form

  And I click on Login button for admin
  Then I should see flash message "Invalid email or password."

  And I submit admin login form with invalid credentials
  Then I should see flash message "Invalid email or password."

  And I submit admin login form without password
  Then I should see flash message "Invalid email or password."

  And I submit admin login form with wrong password
  Then I should see flash message "Invalid email or password."

  And I fill and submit login form for admin
  Then I should see flash message "Signed in successfully."
