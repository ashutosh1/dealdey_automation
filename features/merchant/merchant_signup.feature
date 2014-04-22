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

  And I click sign in as merchant link
  And I submit merchant sign in form without password
  Then I should see flash message "Invalid Email or Password."

  And I click sign in as merchant link
  And I submit merchant sign in form with wrong password
  Then I should see flash message "Invalid Email or Password."
  
  And I click sign in as merchant link
  And I submit merchant sign in form
  Then I should be on "merchant home page"

@sign_up_page
Scenario: merchant signup page
  Given I am on merchant signup page
  Then I should see merchant signup form

Scenario: submit blank sign up form
  Given I am on merchant signup page
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error on all "MerchantSignupPage::MERCHANT_ATTR"

Scenario: submit sign up form with invalid email
  Given I am on merchant signup page
  And I fill "email" with "test"
  And I fill "location" with ""
  And I submit the signup form
  Then I should see inline error "Email is invalid"

Scenario: submit sign up form with valid data and deal offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I submit the signup form
  Then I should see flash notice "Your Request has been created successfully"

Scenario: submit sign up form with promo offer without logo
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I submit the signup form
  Then I should see inline error "Logo can't be blank"

Scenario: submit sign up form with promo offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I upload a logo
  And I submit the signup form
  Then I should see flash notice "You have signed up successfully. Your login details have been sent to you through email. You will be able to login once your account is activated by the administrator."  

Scenario: forget password page
  And I click sign in as merchant link
  And I click forget password link
  Then I should be on merchant forget password page

Scenario: submit forget password form without email
  And I click sign in as merchant link
  And I click forget password link
  And I click Send me reset password instructions
  Then I should see error "Email can't be blank"

Scenario: submit forget password form with wrong email
  And I click sign in as merchant link
  And I click forget password link    
  And I fill merchant email for resend instruction with "test@example.com"
  And I click Send me reset password instructions
  Then I should see error "Email not found"

Scenario: submit forget password form with correct email
  And I click sign in as merchant link
  And I click forget password link    
  And I fill merchant email for resend instruction with "merchant@mailinator.com"  
  And I click Send me reset password instructions
  Then I should see flash notice "You will receive an email with an option to change password."
