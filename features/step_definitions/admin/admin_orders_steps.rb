Then(/^I should see search deal form$/) do 
  expect(@dealdey.admin_orders_page.has_search_deal_form?).to eq(true)
end

And(/^I search and select a deal$/) do
  @dealdey.admin_orders_page.serach_and_add_deal_to_cart 
end

Then(/^I should see deal added in cart$/) do 
  @dealdey.admin_orders_page.wait_for_cart_section
  expect(@dealdey.admin_orders_page.has_cart_section?).to eq(true)
end

And(/^I change quantity of item to (\d+) in cart$/) do|val|
  @dealdey.admin_orders_page.change_quantity(val)
  sleep(2)
  page.driver.browser.switch_to().alert().accept()
end

Then(/^I should see quantity (\d+) and updated line item total in cart$/) do|val|
  expect(@dealdey.admin_orders_page.updated_quantity_and_line_item_total?(val)).to eq(true)
end

Then(/^I should see updated grand total for cart$/) do
  expect(@dealdey.admin_orders_page.grand_total_updated?).to eq(true) 
end

And(/^Admin edit quantity of deal with quantity greater than "([^\"]*)"$/) do|limit|
  @dealdey.admin_orders_page.edit_deal_quantity(limit)
end

Then(/^I should see field to search and add user to order$/) do 
  expect(@dealdey.admin_orders_page.add_user_section.has_search_user_field?).to eq(true)
end

And(/^I search and add a user to order$/) do 
  @dealdey.admin_orders_page.serach_and_add_user
end

Then(/^I should see customer details and proceed to payment button$/) do 
  expect(@dealdey.admin_orders_page.has_customer_deatils_and_proceed_button?).to eq(true)
end

And(/^I click on proceed to payment button$/) do 
  @dealdey.admin_orders_page.customer_detail_section.proceed_to_payment.click
end

And(/^I should see wallet and pod payment option$/) do 
  expect(@dealdey.admin_orders_page.has_payment_options?).to eq(true)
end

And(/^I click on complete order$/) do 
  @dealdey.admin_orders_page.complete_order.click
end

And(/^I choose pod payment option$/) do 
  @dealdey.admin_orders_page.pod_payment_option.click
  wait_for_ajax
end

Then(/^I should see address to select or create an address for delivery$/) do 
end

And(/^I choose an address for delivery$/) do 
end