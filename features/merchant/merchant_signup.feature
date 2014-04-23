Feature: merchant sign in and sign up
  As a merchant i can sign in and as visitor i should sign up for merchant

Background:
  And I close the subscription popup
  Given I am on merchant welcome page

Scenario: User see sign_in and sign_up links
  Then I see signin and signup links
  And I click sign in as merchant link
  Then I see merchant sign_in form in popup

Scenario: sign in as a merchant
  And I click sign in as merchant link
  And I submit merchant sign in form with wrong credentials
  Then I should see flash message "Invalid Email or Password."

  And I submit merchant sign in form without password
  Then I should see flash message "Invalid Email or Password."

  And I submit merchant sign in form with wrong password
  Then I should see flash message "Invalid Email or Password."
  
  And I submit merchant sign in form
  Then I should be on "merchant home page"

@need_to_fix_email_validation
Scenario: merchant signup page and submit signup for with invalid data
  Given I am on merchant signup page
  Then I should see merchant signup form

  And I submit the signup form
  Then I should see flash message "Please fix the below mentioned errors to continue."
  Then I should see inline error on all "MerchantSignupPage" mandatory field of merchant

  And I fill "email" with "test"
  And I submit the signup form
  Then I should see inline error "Email is invalid"

Scenario: submit sign up form with valid data and deal offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I submit the signup form
  Then I should see flash message "Your Request has been created successfully"

Scenario: submit sign up form with promo offer without logo
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I submit the signup form
  Then I should see flash message "Please fix the below mentioned errors to continue."
  And I should see inline error "Logo can't be blank"

Scenario: submit sign up form with promo offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I upload a logo
  And I submit the signup form
  Then I should see flash message "You have signed up successfully. Your login details have been sent to you through email. You will be able to login once your account is activated by the administrator."  

Scenario: forget password page and submit resend password form with invalid data
  And I click sign in as merchant link
  And I click forget password link
  Then I should be on merchant forget password page

  And I click Send me reset password instructions for merchant
  Then I should see inline error "Email can't be blank"

  And I fill merchant email for resend instruction with "test@example.com"
  And I click Send me reset password instructions for merchant
  Then I should see inline error "Email not found"

Scenario: submit forget password form with correct email
  And I click sign in as merchant link
  And I click forget password link    
  And I fill merchant email for resend instruction with "merchant@mailinator.com"  
  And I click Send me reset password instructions for merchant
  Then I should see flash message "You will receive an email with an option to change password."
