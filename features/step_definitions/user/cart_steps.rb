Given(/^I go to cart page of "(.*?)"$/) do |deal|
  steps %{
    And I go to detail page of "#{deal}"
    And I add deal to cart
  }
end

Then(/^I should see (\d+) products in my cart on cart page$/) do|val|
  expect(@dealdey.user_cart_page.cart_items.count).to eq(val.to_i)
end

Then(/^I should see (\d+) in cart icon on cart page$/) do|val|
  expect(@dealdey.user_cart_page.deals_count_in_cart.text).to eq(val)
end


# And(/^I click 'Proceed to Payment' link$/) do
#   @current_page.proceed_to_payment
# end

# And(/^I proceed$/) do
#   on(CartPage).proceed
# end

# Then(/^I should see 'Continue shopping' link$/) do
#   expect(@current_page.continue_shopping?).to eq(true)
# end

# Given(/^I am on cart page for shippable item$/) do
#   step "I am on cart detail page for shippable item"
#   step "I am logged in as user"
# end

# Then(/^I should see new ship addresses form$/) do
#   expect(on(CartPage).new_ship_address_form?).to eq(true)
# end

# And(/^I submit the new shipping form$/) do
#   on(CartPage).proceed_with_new_address
# end

# And(/^I proceed with new shipping address$/) do
#   on(CartPage).populate_new_shipping_address
# end

# And(/^I change quantity to (\d+)$/) do|val|
#   on(CartPage).change_quantity(val)
#   @browser.switch_to().alert().accept()
# end

# Then(/^I should see quantity (\d+) and updated line item total$/) do|val|
#   expect(on(CartPage).quantity_changed?(val)).to eq(true)
#   # expect(on(CartPage).li_total_updated?).to eq(true) 
# end

# Then(/^I should see updated grand total$/) do
#   expect(on(CartPage).grand_total_updated?).to eq(true) 
# end

# And(/^I edit quantity of deal with quantity greater than "([^\"]*)"$/) do|limit|
#   on(CartPage).edit_deal_quantity(limit)
# end

# Then(/^I should see "([^\"]*)" in alert box$/) do|expected_text|
#   alert = @browser.switch_to().alert()  
#   expect(alert.text).to eq(expected_text)
# end
