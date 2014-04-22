Feature: merchant home page
  As a merchant i can offer promo

Background:
  And I close the subscription popup
  Given I am on merchant welcome page
  And I click sign in as merchant link

Scenario: As a merchant with valid subscription
  And I am logged in as merchant with valid subscription
  Then I should be on merchant home page

Scenario: As a merchant with valid subscription submit blank promo offer
  And I am logged in as merchant with valid subscription
  And I submit promo offer
  Then I should see inline error on all promo fields  

Scenario: As a merchant with valid subscription submit promo offer with invalid url
  And I am logged in as merchant with valid subscription
  And I fill promo "promo_url" with "test"
  And I submit promo offer
  Then I should see inline error on promo "Coupon url is invalid"  

Scenario: As a merchant with valid subscription submit promo offer with blank address
  And I am logged in as merchant with valid subscription
  And I fill promo "business_address" with ""
  And I submit promo offer
  Then I should see inline error on promo "Business address can't be blank"  

Scenario: As a merchant with valid subscription submit promo offer with blank start date
  And I am logged in as merchant with valid subscription
  And I fill promo "coupon_start_date" with ""
  And I submit promo offer
  Then I should see inline error on promo "Start date can't be blank"  

Scenario: As a merchant with valid subscription submit promo offer with blank end date
  And I am logged in as merchant with valid subscription
  And I fill promo "coupon_end_date" with ""
  And I submit promo offer
  Then I should see inline error on promo "End date can't be blank"

Scenario: As a merchant with valid subscription submit promo offer 
  And I am logged in as merchant with valid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash notice "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator."

@invalid_subscription
Scenario: As a merchant with Invalid subscription submit promo offer
  And I am logged in as merchant with invalid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash notice "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator. Please update your subscription with one of our available subscription plans to ensure your Promos visibility."

@home_page
Scenario: On merchant home page
  And I am on merchant home page
  Then I should see promo offer form
  Then I should see "Logout" link for merchant
  Then I should see "My Account" link for merchant
  Then I should see "Contact" link for merchant

Scenario: On merchant home page as merchant with invalid subscription
  And I am logged in as merchant with invalid subscription
  Then I should see subscription info
  Then I should see "Proceed To Payment" link for merchant

Scenario: On merchant home page as merchant with valid subscription
  And I am logged in as merchant with valid subscription
  Then I should not see subscription info

@footer_links_for_merchant
Scenario: On merchant home page as merchant with valid subscription
  And I am logged in as merchant with valid subscription
  Then I should see "Copyright © 2014 Dealdey. All right reserved." in merchant footer

Scenario: other links in merchant footer
  And I am logged in as merchant with valid subscription
  Then I should see other links in merchant footer:
  |footer_links|
  |contact faq |

Scenario: contact us page
  And I am logged in as merchant with valid subscription
  And I click "Contact Us" in merchant footer 
  Then I should see "Contact"

Scenario: faq page
  And I am logged in as merchant with valid subscription
  And I click "FAQ" in merchant footer 
  Then I should see "FAQ"

@expired_subscription
Scenario: subscription expired
  And I am logged in as merchant with expired subscription
  Then I should see error image
  Then I should see subscription expire warning
