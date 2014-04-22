Feature: contact info and faq on merchant home page
  As a merchant I can see the contact information of dealdey and faq page

Background:
  And I close the subscription popup
  Given I am logged in as merchant
  And I click contact on merchant home page

Scenario: contact page
  Then I should see "Contact Us"
  Then I should see "DealDey"
  Then I should see "Call us on 01- 4406237 and a customer service"

Scenario: office images
  Then I should see "office_building" image
  Then I should see "abuja_office_building" image

Scenario: office maps
  Then I should see "dealdey_lagos_office_map" map
  Then I should see "dealdey_abuja_office_map" map

Scenario: email for help and advertise 
  Then I should see help email "help@dealdey.com"
  Then I should see advertise email "advertise@dealdey.com"

Scenario: content of faq page
  And I click faq on merchant home page
  Then I should see faq title "Frequently Asked Questions"
  Then I should see "How can we add our Offers and Promos to DealDey?"
  Then I should see "How do we make payment?"
  Then I should see "How does an offer work?"
  Then I should see "premium_slider" image
