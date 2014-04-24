Feature: contact info and faq on merchant home page
  As a merchant I can see the contact information of dealdey and faq page

Background:
  And I close the subscription popup
  Given I am on merchant welcome page
  And I am logged in as merchant

Scenario: contact page for merchant
  When I click contact on merchant home page
  Then I should see "Contact Us"
  And I should see "DealDey"
  And I should see "Call us on 01- 4406237 and a customer service"
  
  And I should see head and branch office image of dealdey
  And I should see "dealdey lagos office map" map
  And I should see "dealdey abuja office map" map

  And I should see help email "help@dealdey.com"
  And I should see advertise email "advertise@dealdey.com"

Scenario: content of faq page for merchant
  And I click faq on merchant home page
  Then I should see faq title "Frequently Asked Questions"
  Then I should see "How can we add our Offers and Promos to DealDey?"
  Then I should see "How do we make payment?"
  Then I should see "How does an offer work?"
  Then I should see premium_slider image
