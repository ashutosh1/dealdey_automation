And(/^I click on Complete Order button$/) do 
  @dealdey.user_checkout_page.click_on_complete_order
end

And(/^I selcet Pay on Delivery$/) do 
  @dealdey.user_checkout_page.pod_payment_method.click
end

And(/^I click complete order button for pod$/) do 
  @dealdey.user_checkout_page.complete_pod_order.click
end

And(/^I selcet Pay on Delivery and click complete button$/) do
  @dealdey.user_checkout_page.complete_order_with_pod
end

And(/^I click on select or add your shipping address$/) do 
  @dealdey.user_checkout_page.select_or_add_shipping_address.click
end

And(/^I select first pod address$/) do 
  @dealdey.user_checkout_page.existing_address_for_pod.first.click
end

And(/^I proceed with pod address$/) do 
  @dealdey.user_checkout_page.pod_proceed_to_payment_with_old_address.click
end

And(/^I submit new shipping address for pod$/) do 
  @dealdey.user_checkout_page.populate_new_shipping_address  
end

And(/^I click on proceed to payment within new pod address form$/) do 
  @dealdey.user_checkout_page.pod_proceed_to_payment_with_new_address.click
end

Then(/^I should see Rencredit payment method$/) do 
  expect(@dealdey.user_checkout_page.has_rencredit_payment_method?).to eq(true)
end

Then(/^I should not see Rencredit payment method$/) do 
  expect(@dealdey.user_checkout_page.has_rencredit_payment_method?).to eq(false)
end

And(/^I click on Rencredit payment method$/) do 
  @dealdey.user_checkout_page.rencredit_payment_method.click
end

And(/^I click continue$/) do 
  @dealdey.user_checkout_page.continue.click
end

And(/^I click on Complete Order button for rencredit deal$/) do 
  @dealdey.user_checkout_page.complete_rencredit_order.click
end

Given(/^I am on checkout page of rencredit max deal with sum greater than max limit$/) do 
  steps %{
    And I go to detail page of "rencreditmax deal"
    And I select quantity so that order sum exceeds max limit
    And I add deal to cart
    And I select first address
    And I proceed to payment with existing address
  }
end

And(/^I select quantity so that order sum exceeds max limit$/) do 
  @dealdey.user_deal_detail_page.select_quantity(12)
end