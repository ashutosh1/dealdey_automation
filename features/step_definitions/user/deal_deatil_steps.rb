And(/^I add deal to cart$/) do 
  @dealdey.user_deal_detail_page.add_deal_to_cart
end

Given(/^I go to detail page of "(.*?)"$/) do |deal|
  visit(@dealdey.user_deal_detail_page.visit_deals(deal))
end

And(/^I add a deal to my cart$/) do
  steps %{And I go to cart page of "shippable deal"}
end

And(/^I add an another deal to my cart$/) do
  steps %{And I go to cart page of "non shippable deal"}
end

And(/^I add a deal with quantity greater than "([^\"]*)"$/) do|txt|
  steps %{And I go to detail page of "shippable deal"}
  @dealdey.user_deal_detail_page.select_extra_option_and_add(txt)
end

Then(/^I should see available cod options$/) do
  expect(@dealdey.user_deal_detail_page.has_cod_option?).to eq(true)
end

Then(/^I should see delivery detail$/) do
  expect(@dealdey.user_deal_detail_page.has_deal_detail_div?).to eq(true)
end

And(/^I click on view available area$/) do
  @dealdey.user_deal_detail_page.cod_option.click
  wait_for_ajax
end

Then(/^I should see states to select in popup$/) do
  expect(@dealdey.user_deal_detail_page.has_state_select_div?).to eq(true)
end
