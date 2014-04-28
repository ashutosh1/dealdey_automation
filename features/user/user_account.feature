Feature: account settings
  As a user I can update my profile and addresses

Background:
  And I close the subscription popup
  Given I am signed in as user
  Given I am on account page

Scenario: I see/update profile detail
  Then I see profile details 
  And I update my profile
  Then I should see flash message "Your Account Details have been updated"

Scenario: update profile without firstname
  And I update profile without "firstname"
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Firstname can't be blank"

  And I update profile without "lastname"
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Lastname can't be blank"

  And I update profile without "mobile"
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Mobile can't be blank"

  And I update profile without age bracket
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Age bracket can't be blank"

  And I update profile without gender
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Gender can't be blank"

  And I update profile with invalid mobile
  #Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Mobile is invalid"

Scenario: uncheck all news letter check box
  And I click select none
  And I save news letter settings
  Then I should see flash message "Your Email Subscriptions have been updated successfully."
  Then All select box should be unchecked

Scenario: update news letter settings
  And I update news letter settings
  Then I should see flash message "Your Email Subscriptions have been updated successfully."
  And I should see first check box are checked

Scenario: add/update/delete shipping address
  Given I am on update address page
  And I add a new address
  Then I should see flash message "Your shipping address has been created"

  And I edit first address
  Then I should see flash message "Your shipping address has been updated"

  And I delete first address
  Then I should see flash message "Shipping Address has been deleted"

Scenario: submit blank shipping address
  Given I am on update address page
  And I submit blank shipping address form
  Then I should see flash message "Please correct below errors, before continuing"
  Then I should see inline error on all "UserAccountPage" mandatory field

Scenario: update password
  Given I am on update update password page
  And I update password
  Then I should see flash message "Your password has been changed."
  And I reset the password

Scenario: update password with invalid current password
  Given I am on update update password page
  And I update password with invalid current password
  Then I should see flash message "Please correct below errors before continuing"

  And I update password without "current_password"
  Then I should see flash message "Please correct below errors before continuing"
  Then I should see inline error "Current password can't be blank"

  And I update password without "confirm_password"
  Then I should see flash message "Please correct below errors before continuing"
  Then I should see inline error "Password doesn't match confirmation"

  And I update password without "new_password"
  Then I should see flash message "Please correct below errors before continuing"
  Then I should see inline error "Password can't be blank and doesn't match confirmation"

  And I update password with blank values
  Then I should see flash message "Please correct below errors before continuing"
  