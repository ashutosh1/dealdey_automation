Feature: merchant account/address settings
  As a merchant I can update my profile, password and addresses

Background:
  And I close the subscription popup
  Given I go to merchant account page

Scenario: update merchant password
  Given I am on update password section of merchant account
  And I update merchant password
  Then I should see flash notice "Password updated successfully."
  And I reset the merchant password

Scenario: update merchant password without current password
  Given I am on update password section of merchant account
  And I update merchant password without "current_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Current password can't be blank"

Scenario: update merchant password without new password
  Given I am on update password section of merchant account
  And I update merchant password without "new_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Password can't be blank and doesn't match confirmation"

Scenario: update merchant password without confirm password
  Given I am on update password section of merchant account
  And I update merchant password without "confirm_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Password doesn't match confirmation"

Scenario: update merchant password with invalid current password
  Given I am on update password section of merchant account
  And I update merchant password with invalid current password
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Current password is invalid"

Scenario: update merchant password with blank fields
  Given I am on update password section of merchant account
  And I update merchant password with blank values
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error on all "MerchantAccountPage::MERCHANT_PASS_ATTR"

@my_subscription
Scenario: my subscription on account page
  Given I am on my subscription section of merchant account
  Then I should see subscription section
  Then I should see "Welcome to Dealdey"
  Then I should see "Choose a subscription to start featuring your Promos on DealDey"

Scenario: subscription on account page
  Given I am on my subscription section of merchant account
  Then I should see normal and premium offer for subscription

@profile_section
Scenario: profile section on account page
  Then I should see update_profile form

Scenario: email should not be editable
  Then I should see email field is disabled

Scenario: update profile on account page
  And I update profile on my account section
  Then I should see flash notice "Your account details have been updated successfully."
  
Scenario: update profile with blank form
  And I update profile with blank values
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error on all "MerchantAccountPage::MERCHANT_PROFILE_ATTR"

Scenario: update profile with invalid website on account page
  And I update profile with invalid website on my account section
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Website is invalid"
