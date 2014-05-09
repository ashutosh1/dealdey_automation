Feature: Checkout Page
  As a user i should checkout with one credit and visa payment
  As user i should be able to checkout using different payment option with wallet

Background:
  And I close the subscription popup

@wallet_and_one_credit_payment_for_deal
Scenario: one credit payment
  Given I am signed in as another user
  And I go to cart page of "non shippable deal"
  When I proceed to payment
  Then I see checkbox to use wallet
  And I should see my wallet balance and credit link
  And I choose use wallet
  And I click on onecredit payment method
  When I click on Complete Order button for one credit payment
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"
  
@visa_card_payment_for_deals  @payment_gateway
Scenario: checkout via visa payment
  Given I am signed in as "test user one"
  And I go to cart page of "one nira deal"
  When I proceed to payment
  Then I should see visa card payment option
  
  Then I should see instruction popup for visa payment
  And I close the instruction popup for visa payment

  When I click Complete Order button for visa payment
  Then I should see "Pay Online (Unified Payments Ltd)"
  And I should see flash message "Please make payment within 20 minutes after clicking on 'Confirm & Continue' so your order doesn't get cancelled."
  And I should see "Your Transaction Id is"
  And I should see "Please note this id as it may be used for tracking your payment."
  And I should see tracking id and user info

  And I click confirm and continue
  When I submit gateway form with valid credit card data
  Then I should see form to enter cedit card pin
  When I enter credit card pin and submit
  Then I should see message "Transaction was completed successfully and your order has been processed. Click here to view order details." from gateway
  
@visa_card_and_wallet_payment_for_deals  @payment_gateway
Scenario: checkout via visa and wallet payment
  Given I am signed in as "test user one"
  And I go to cart page of "one nira deal"
  When I proceed to payment
  Then I should see instruction popup for visa payment
  
  When I close the instruction popup for visa payment
  Then I should see visa card payment option
  And I see checkbox to use wallet
  And I should see my wallet balance and credit link
  And I choose use wallet
  And I close the instruction popup for visa payment

  When I click Complete Order button for visa payment
  Then I should see "Pay Online (Unified Payments Ltd)"
  And I should see flash message "Please make payment within 20 minutes after clicking on 'Confirm & Continue' so your order doesn't get cancelled."
  And I should see "Your Transaction Id is"
  And I should see "Please note this id as it may be used for tracking your payment."
  And I should see tracking id and user info
  And Total amount should be sum of paid by wallet and payable amount via card

  And I click confirm and continue
  And I should see remaining payable amount on "visa" gateway page
  When I submit gateway form with valid credit card data
  Then I should see form to enter cedit card pin
  When I enter credit card pin and submit
  Then I should see message "Transaction was completed successfully and your order has been processed. Click here to view order details." from gateway

@webpay_and_wallet_payment_for_deals
Scenario: checkout via webpay and wallet payment
  Given I am signed in as "test user two"
  And I go to cart page of "non shippable deal"
  When I proceed to payment
  And I choose use wallet
  When I click on Complete Order button for mater card payment
  Then I should see "Web Pay"
  And I should see flash message "Please make payment within 20 minutes after clicking on 'Confirm & Continue' so your order doesn't get cancelled."
  And I should see "Your Transaction Id is"
  And I should see tracking id and user info
  And Total amount should be sum of paid by wallet and payable amount via card

  And I click confirm and continue
  And I should see remaining payable amount on "webpay" gateway page

@paga_and_wallet_payment_for_deals
Scenario: checkout via paga and wallet payment
  Given I am signed in as "test user three"
  And I go to cart page of "non shippable deal"
  When I proceed to payment
  And I choose use wallet
  And I click on paga payment method
  When I click on Complete Order button for paga payment
  Then I should see "Please Confirm the information below"
  And I should see flash message "Please make payment within 20 minutes after clicking on 'Confirm & Continue' so your order doesn't get cancelled."
  And I should see user info
  And Total amount should be sum of paid by wallet and payable amount via paga card

  And I click confirm and continue
  And I should see remaining payable amount on "paga" gateway page