Feature: merchant home page feature
  As a merchant i can offer promo

Background:
  And I close the subscription popup
  Given I am on merchant welcome page
  And I click sign in as merchant link

Scenario: Home page for merchant with valid subscription
  And I am logged in as merchant with valid subscription
  Then I should be on "merchant home page"
  And I should see promo offer form
  And I should see view all promo link
  Then I should see "Logout" link for merchant
  Then I should see "My Account" link for merchant
  Then I should see "Contact" link for merchant
  Then I should see "Copyright © 2014 Dealdey. All right reserved." in merchant footer
  Then I should see "Contact" in merchant footer
  Then I should see "FAQ" in merchant footer
  Then I should not see subscription info

Scenario: As a merchant with valid subscription submit promo offer form with invalid data
  And I am logged in as merchant with valid subscription
  And I submit promo offer
  Then I should see inline error on all "MerchantHomePage" mandatory field of merchant

  And I fill promo "promo_url" with "test"
  And I submit promo offer
  Then I should see inline error "Coupon url is invalid"  

  And I fill promo "promo_url" with "wwe.dealdey.com"
  And I submit promo offer
  Then I should see inline error "Coupon url is invalid"  

  And I fill promo "promo_url" with "http://www.dealdey.com"
  And I submit promo offer
  Then I should not see inline error "Coupon url is invalid"  

Scenario: As a merchant with valid subscription submit promo offer 
  And I am logged in as merchant with valid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash message "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator."

Scenario: As a merchant with Invalid subscription submit promo offer
  And I am logged in as merchant with invalid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash message "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator. Please update your subscription with one of our available subscription plans to ensure your Promos visibility."

Scenario: On merchant home page as merchant with invalid subscription
  And I am logged in as merchant with invalid subscription
  Then I should be on "merchant home page"
  And I should see promo offer form
  Then I should see "Logout" link for merchant
  Then I should see "My Account" link for merchant
  Then I should see "Contact" link for merchant
  Then I should see subscription info
  Then I should see "Proceed To Payment" link for merchant

Scenario: contact us and faq page
  And I am logged in as merchant with valid subscription
  And I click "Contact" in merchant footer 
  Then I should see "Contact Us"

  And I go back
  And I click "FAQ" in merchant footer 
  Then I should see "Frequently Asked Questions"

@expired_subscription
Scenario: subscription expired
  When I am logged in as merchant with expired subscription
  Then I should see error image
  And I should see subscription expire warning
  And I should see "Choose a subscription to start featuring your Promos on DealDey"
  And I should see price blocks
