Given(/^I go to cart page of "(.*?)"$/) do |deal|
  steps %{
    And I go to detail page of "#{deal}"
    And I add deal to cart
  }
end

And(/^I edit quantity of deal with quantity greater than "([^\"]*)"$/) do|limit|
  @dealdey.user_cart_page.edit_deal_quantity(limit)
end

And(/^I change quantity to (\d+)$/) do|val|
  @dealdey.user_cart_page.change_quantity(val)
  page.driver.browser.switch_to().alert().accept()
end

Then(/^I should see quantity (\d+) and updated line item total$/) do|val|
  expect(@dealdey.user_cart_page.updated_quantity_and_line_item_total?(val)).to eq(true)
end

Then(/^I should see updated grand total$/) do
  expect(@dealdey.user_cart_page.grand_total_updated?).to eq(true) 
end

Then(/^I should see "([^\"]*)" in alert box$/) do|expected_text|
  sleep(5)
  alert = page.driver.browser.switch_to().alert();
  message = alert.text
  alert.accept()
  expect(message).to eq(expected_text)
end


Then(/^I should see (\d+) products in my cart on cart page$/) do|val|
  expect(@dealdey.user_cart_page.cart_items.count).to eq(val.to_i)
end

Then(/^I should see (\d+) in cart icon on cart page$/) do|val|
  expect(@dealdey.user_cart_page.deals_count_in_cart.text).to eq(val)
end

And(/^I should see "(.*?)" button$/) do |btn|
  expect(@dealdey.user_cart_page.has_button?(btn)).to eq(true)
end

And(/^I proceed to payment$/) do
  @dealdey.user_cart_page.proceed
end

And(/^I proceed to payment with existing address$/) do 
  @dealdey.user_cart_page.proceed_to_payment_with_address.click
end

Then(/^I should see addresses to select$/) do
  expect(@dealdey.user_cart_page.has_select_address?).to eq(true)
end

When(/^I procedd without selecting address$/) do 
  @dealdey.user_cart_page.proceed_to_payment_with_address.click
end

And(/^I select first address$/) do
  @dealdey.user_cart_page.existing_address.first.click
end

Then(/^I should see new ship addresses form$/) do
  expect(@dealdey.user_cart_page.has_new_ship_address_form?).to eq(true)
end

And(/^I submit blank new shipping form$/) do
  @dealdey.user_cart_page.proceed_to_payment_button.click
end

And(/^I proceed with new shipping address$/) do
  @dealdey.user_cart_page.populate_new_shipping_address
end

And(/^I clear the cart$/) do 
  @dealdey.user_cart_page.clear_cart
end