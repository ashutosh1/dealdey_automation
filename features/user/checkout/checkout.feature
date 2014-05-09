Feature: Checkout Page
  As user i should be able to checkout with different deals

Background:
  And I close the subscription popup
  And I am signed in as user
  And I clear the cart

@wallet_payment_for_non_shippable_deal
Scenario: checkout for non shippable deal
  Given I go to cart page of "non shippable deal"
  And I proceed to payment
  And I click on Complete Order button
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@wallet_payment_for_shippable_deal_with_old_address
Scenario: checkout for shippable deal
  Given I go to cart page of "shippable deal"
  And I should see addresses to select
  When I procedd without selecting address
  Then I should see flash message "Please enter a valid shipping address"

  And I select first address
  And I proceed to payment with existing address
  And I click on Complete Order button
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@wallet_payment_for_shippable_deal_with_new_address
Scenario: checkout with new shipping address for shippable deal
  Given I go to cart page of "shippable deal"
  Then I should see new ship addresses form

  When I submit blank new shipping form
  Then I should see flash message "Shipping address address line can't be blank, Shipping address area can't be blank, and Shipping address name can't be blank"

  And I proceed with new shipping address
  And I click on Complete Order button
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"
  
@pod_for_shippable_deal_with_old_address
Scenario: checkout of shippable deals using POD
  Given I go to cart page of "pod shippable deal"
  And I select first address
  And I proceed to payment with existing address
  When I selcet Pay on Delivery and click complete button
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@pod_for_shippable_deal_with_new_address
Scenario: checkout of shippable deals using POD with new address
  Given I go to cart page of "pod shippable deal"
  And I proceed with new shipping address
  When I selcet Pay on Delivery and click complete button
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@pod_for_non_shippable_deal
Scenario: checkout of non shippable deals using POD
  Given I go to cart page of "pod non shippable deal"
  And I proceed to payment
  And I selcet Pay on Delivery
  And I click on select or add your shipping address
  And I select first pod address
  And I proceed with pod address
  And I click complete order button for pod
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@pod_for_non_shippable_deal_with_new_pod_address
Scenario: checkout of non shippable deals using POD with new address
  Given I go to cart page of "pod non shippable deal"
  And I proceed to payment
  And I selcet Pay on Delivery
  And I click on select or add your shipping address

  When I click on proceed to payment within new pod address form
  Then I should see inline error on all "UserCheckoutPage" mandatory field

  And I submit new shipping address for pod
  And I click complete order button for pod
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

@rencredit_payment_for_deal
Scenario: checkout with RENCREDIT
  Given I go to cart page of "rencreditmax deal"
  And I select first address
  And I proceed to payment with existing address
  Then I should see Rencredit payment method
  And I click on Rencredit payment method
  Then I should see "Pay installmentally by Rencredit"
  And I click continue
  Then I should see flash message "Only below listed items are available under Rencredit Installment Payment Option."
  And I click on Complete Order button for rencredit deal
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"

Scenario: Order sum is greater than max limit of rencredit deals
  Given I am on checkout page of rencredit max deal with sum greater than max limit
  And I click on Rencredit payment method
  And I click continue
  Then I should see "Your order cost exceeds the maximum limit allowed for a Rencredit order which is N 500000. Please remove some items from your cart to proceed with the order."

Scenario: Order sum is less than min limit of rencredit deals 
  Given I go to cart page of "rencredit deal"
  And I select first address
  And I proceed to payment with existing address
  Then I should not see Rencredit payment method

@rencredit_payment_for_multiple_deals  
Scenario: rencredit deals with multiple order
  Given I go to cart page of "non shippable deal"
  Given I go to cart page of "rencreditmax deal"
  And I select first address
  And I proceed to payment with existing address
  And I click on Rencredit payment method
  And I click continue
  Then I should see flash message "Only below listed items are available under Rencredit Installment Payment Option."
  Then I should see 1 products in my cart on cart page

@one_credit_payment_for_deals  
Scenario: one credit payment
  Given I am signed in as user
  Given I go to cart page of "non shippable deal"
  And I proceed to payment
  And I do not see checkbox to use wallet
  And I click on onecredit payment method
  And I click on Complete Order button for one credit payment
  Then I should see "Order Successful"
  And I should see "Thanks for shopping on DealDey!"
  