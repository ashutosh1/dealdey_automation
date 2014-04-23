Then(/^I should see promo offer form$/) do
  @dealdey.merchant_home_page.wait_for_promo_offer_form
  expect(@dealdey.merchant_home_page.has_promo_offer_form?).to eq(true)
end 

And(/^I should see view all promo link$/) do 
  expect(@dealdey.merchant_home_page.has_view_all_promos?).to eq(true)
end

And(/^I submit promo offer$/) do
  @dealdey.merchant_home_page.submit_promo_form
end 

And(/^I fill promo "([^\"]*)" with "([^\"]*)"$/) do|promo_attr, value|
  @dealdey.merchant_home_page.partial_populate_promo({promo_attr => value})
end 

And(/^I fill promo offer form$/) do
  @dealdey.merchant_home_page.populate_promo
end 

Then(/^I should see "([^\"]*)" link for merchant$/) do|link|
  expect(@dealdey.merchant_home_page.send("has_#{link.downcase.split.join('_')}?")).to eq(true)
end

Then(/^I should see subscription info$/) do
  expect(@dealdey.merchant_home_page.subscription_info?).to eq(true)
end

Then(/^I should not see subscription info$/) do
  expect(@dealdey.merchant_home_page.subscription_info?).to eq(false)
end

Then(/^I should see "([^\"]*)" in merchant footer$/) do|expected_text|
  expect(@dealdey.merchant_home_page.merchant_footer.text).to include(expected_text)
end

And(/^I click "([^\"]*)" in merchant footer$/) do |expected_text|
  lnk = "footer_#{expected_text.downcase.split.join('_')}"
  @dealdey.merchant_home_page.send(lnk).click
end

And(/^I am logged in as merchant with expired subscription$/) do
  @dealdey.merchant_signup_page.sign_in_merchant("merchant_signin_credential")
end 

Then(/^I should see error image$/) do
  @dealdey.merchant_home_page.wait_for_error_image
  expect(@dealdey.merchant_home_page.has_error_image?).to eq(true)
end

Then(/^I should see subscription expire warning$/) do
  expect(@dealdey.merchant_home_page.subscription_info_warning.text).to include("Your subscription expired on")
end

And(/^I should see price blocks$/) do 
  expect(@dealdey.merchant_home_page.price_blocks?).to eq(true)
end