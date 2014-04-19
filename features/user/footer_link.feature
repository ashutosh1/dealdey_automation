Feature: Footer links
  As a user i should see all footer link and i can navigate through those link

Background:
  And I close the subscription popup

Scenario: footer link header
  Then I should see "KNOW" in footer
  Then I should see "EXPLORE" in footer
  Then I should see "PAYMENT OPTIONS" in footer
  Then I should see "WHAT THE PRESS SAY" in footer
  Then I should see "Copyright © 2014 DealDey. All rights reserved." in footer
  Then I should see "01- 4406237" in footer
  Then I should see "help@dealdey.com" in footer

Scenario: social link in footer
  Then I should see avilable "social links":
  |social_links|
  |gplus_link fb_link pinterest_link twitter_link|

Scenario: payment options image in footer
  Then I should see avilable "payment options":
  |payment_options|
  |mastercard visa verve gtb zenith access paga rencredit pod|

Scenario: other links in footer
  Then I should see avilable "other links":
  |other_links|
  |about_us contact_us faq how_it_works terms_of_use privacy_policy the_dealdeyholic_blog conditions_policy careers terms_of_use privacy_policy upload_a_promo|

Scenario: User should able to navigate through links
  Then I click links and see respective pages:
  |Click Links            | pages  |
  |About Us               | About Us |
  |Contact Us             | Contact Us |  
  |FAQ                    | FAQ |
  |How It Works           | How It Works |

Scenario: dealdeyholic blog page
  And I click "The Dealdeyholic Blog" in footer 
  Then I should be on dealdeyholic blog page

Scenario: Terms Of Use page
  And I click "Terms Of Use" in footer 
  Then I should see "Terms Of Use" in new tab

Scenario: Privacy Policy page
  And I click "Privacy Policy" in footer 
  Then I should see "Privacy Policy" in new tab

Scenario: Conditions Policy page
  And I click "Conditions Policy" in footer 
  Then I should see "Delivery, Cancellations, Returns, & Refunds" in new tab
