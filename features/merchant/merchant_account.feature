Feature: merchant account/address settings
  As a merchant I can update my profile, password and addresses

Background:
  And I close the subscription popup
  Given I am on merchant welcome page
  And I am logged in as merchant
  And I click on my account

Scenario: update merchant password
  Given I am on update password section of merchant account
  And I update merchant password
  Then I should see flash message "Password updated successfully."
  And I reset the merchant password

Scenario: update merchant password with invalid data
  Given I am on update password section of merchant account
  When I update merchant password with blank values
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error on all password field

  When I update merchant password without "current_password"
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error "Current password can't be blank"

  When I update merchant password without "new_password"
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error "Password can't be blank and doesn't match confirmation"

  When I update merchant password without "confirm_password"
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error "Password doesn't match confirmation"

  When I update merchant password with invalid current password
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error "Current password is invalid"

@my_subscription
Scenario: my subscription on account page
  Given I am on my subscription section of merchant account
  Then I should see subscription section
  And I should see "Welcome to Dealdey"
  And I should see "Choose a subscription to start featuring your Promos on DealDey"
  And I should see normal and premium offer for subscription
  And I should see proceed to payment link

@profile_section
Scenario: update profile on account page
  Then I should see update profile form
  And I should see email field is disabled

  And I update profile on my account section
  Then I should see flash message "Your account details have been updated successfully."
  
Scenario: update profile with blank form
  And I update profile with blank values
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error on all "MerchantAccountPage" mandatory field
  
  And I update profile with invalid website on my account section
  Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error "Website is invalid"
