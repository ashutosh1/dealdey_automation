Feature: sign in
  As an user i should be able to login
  As application owner i want to make sure no one can login with invalid or blank credntials.

Scenario: sign in
  Given I close the subscription popup
  And I click Sign In link

  Then I should see sign in popup

  And I click on Sign In button
  Then I should see error message "Invalid email or password."

  And I submit sign in form with invalid credentials
  Then I should see error message "Invalid email or password."

  And I submit sign in form without password
  Then I should see error message "Invalid email or password."

  And I submit sign in form with wrong password
  Then I should see error message "Invalid email or password."

  And I submit sign in form with valid credentials
  Then I should see flash message "Signed in successfully."
