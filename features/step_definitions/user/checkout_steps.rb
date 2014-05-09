And(/^I click on Complete Order button$/) do 
  @dealdey.user_checkout_page.click_on_complete_order
end

And(/^I selcet Pay on Delivery$/) do 
  @dealdey.user_checkout_page.pod_payment_method.click
end

And(/^I click complete order button for pod$/) do 
  @dealdey.user_checkout_page.complete_pod_order.click
end

And(/^I click on Complete Order button for one credit payment$/) do 
  @dealdey.user_checkout_page.complete_onecredit_order.click
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

And(/^I click on onecredit payment method$/) do 
  @dealdey.user_checkout_page.one_credit_payment_method.click
end

And(/^I should see my wallet balance and credit link$/) do 
  expect(@dealdey.user_checkout_page.has_wallet_amount_and_credit_link?).to eq(true)
  @wallet_amount = @dealdey.user_checkout_page.wallet_balance.text[1..-1].to_i
end

And(/^I see checkbox to use wallet$/) do 
  expect(@dealdey.user_checkout_page.has_use_wallet?).to eq(true)
end

And(/^I choose use wallet$/) do 
  @dealdey.user_checkout_page.use_wallet.set(true)
end

And(/^I do not see checkbox to use wallet$/) do 
  expect(@dealdey.user_checkout_page.has_use_wallet?).to eq(false)
end

Then(/^I should see visa card payment option$/) do 
  expect(@dealdey.user_checkout_page.has_visa_card_payment_method?).to eq(true)
end

And(/^I click on visa card payment method$/) do 
  @dealdey.user_checkout_page.visa_card_payment_method.click
end

Then(/^I should see instruction popup for visa payment$/) do 
  expect(@dealdey.user_checkout_page.has_visa_instrction_popup?).to eq(true)
end

And(/^I close the instruction popup for visa payment$/) do 
  @dealdey.user_checkout_page.close_instruction_popup.click
end

When(/^I click Complete Order button for visa payment$/) do 
  @dealdey.user_checkout_page.complete_visa_order.click
end

And(/^I should see tracking id and user info$/) do 
  expect(@dealdey.user_checkout_page.has_tracking_id_and_user_info?).to eq(true)
end

When(/^I click confirm and continue$/) do 
  @dealdey.user_checkout_page.confirm_and_continue.click
end

And(/^I should fill gateway information$/) do 
  @dealdey.user_checkout_page.fill_credit_card_info_and_submit
end

When(/^I submit gateway form without "credit card number"$/) do |field|
  @dealdey.user_checkout_page.submit_gateway_form_without(field.downcase.split.join("_") => "")
end

#Enter credit card information
When(/^I submit gateway form with valid credit card data$/) do 
  @dealdey.user_checkout_page.submit_gateway_form
end

#Enter credit card ipin on next page
And(/^I enter credit card pin and submit$/) do 
  @dealdey.user_checkout_page.wait_for_visa_payment_iframe
  within_frame("valu-card-online-payment-iframe") do 
    #execute_script("$('input#iPIN').removeAttr('readonly')")
    execute_script("$('input#iPIN').val('#{ENV['CREDIT_CARD_PIN']}')")
  end
  @dealdey.user_checkout_page.pay
end

Then(/^I should see message "(.*?)" from gateway$/) do |expected_text|
  expect(@dealdey.user_checkout_page.gateway_message?(expected_text)).to eq(true)
end

Then(/^I should see form to enter cedit card pin$/) do 
  expect(@dealdey.user_checkout_page.has_visa_payment_iframe?).to eq(true)
end

And(/^Total amount should be sum of paid by wallet and payable amount via card$/) do 
  @amount_payable_via_gateway = @dealdey.user_checkout_page.payable_amount_via_gateway
  expect(@dealdey.user_checkout_page.is_payable_amount_via_card_correct?).to eq(true)
end

And(/^I should see remaining payable amount on "(.*?)" gateway page$/) do |gateway|
  expect(@dealdey.user_checkout_page.check_reamining_payable_amount?(gateway, @amount_payable_via_gateway)).to eq(true)
end

When(/^I click on Complete Order button for mater card payment$/) do 
  @dealdey.user_checkout_page.complete_order_webpay.click
end

And(/^I click on paga payment method$/) do 
  @dealdey.user_checkout_page.paga_payment_method.click
end

When(/^I click on Complete Order button for paga payment$/) do 
  @dealdey.user_checkout_page.complete_paga_order.click
end

And(/^I should see user info$/) do 
  expect(@dealdey.user_checkout_page.has_user_info?).to eq(true)
end

And(/^Total amount should be sum of paid by wallet and payable amount via paga card$/) do 
  @amount_payable_via_gateway = @dealdey.user_checkout_page.payable_amount_via_paga_gateway
  expect(@dealdey.user_checkout_page.is_payable_amount_via_paga_card_correct?).to eq(true)
end