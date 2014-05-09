Feature: New Product Deal Page
  As admin i should be able to CRUD the new product deal
  I should be able to create redemption or shipping type of new product deals

Background:
  Given I am logged in as admin
  And I click on "deals" in nav bar
  And I click on "new product deal" on deal page

Scenario: Admin should see new product deal login form and submit blank form
  Then I should see new product deal form
  And I should see all fields of new product deal form
  And I should see "Please upload an image with 678x363 ratio and size less than 2MB"

  When I submit blank deal form
  Then I should see flash message "Please correct the below errors before continuing."
  And I should see inline error on all "AdminNewProductDealPage" mandatory field
  And I should see inline error "Expiration date should be greater than end date"
  
  When I submit new deal form with sms text less than min char allowed
  Then I should see flash message "Please correct the below errors before continuing."
  And I should see inline error "Sms text is too short (minimum is 10 characters)"

  When I submit new deal form with sms text greater than max char allowed
  Then I should see flash message "Please correct the below errors before continuing."
  And I should see inline error "Sms text is too long (maximum is 60 characters)"  

  When I submit new deal form with image size greater than max size allowed
  Then I should see flash message "Please correct the below errors before continuing."
  And I should see inline error "Image file size file size must be less than 2 megabytes"

#Scenario: submit form with valid data
#  And I submit new deal form with valid data
#  Then I should see flash message "Deal has been created"
