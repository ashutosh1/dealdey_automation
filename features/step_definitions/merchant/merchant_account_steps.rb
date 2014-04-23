And(/^I click on my account$/) do 
  @dealdey.merchant_home_page.my_account.click
end

Given(/^I am on update password section of merchant account$/) do
  @dealdey.merchant_account_page.password_tab.click
  @dealdey.merchant_account_page.wait_for_reset_password_form
end

Given(/^I am on my subscription section of merchant account$/) do
  @dealdey.merchant_account_page.my_subscription_tab.click
  @dealdey.merchant_account_page.wait_for_proceed_to_payment
end

And(/^I update merchant password$/) do
  @dealdey.merchant_account_page.fill_and_save_password_field
end

And(/^I reset the merchant password$/) do
  @dealdey.merchant_account_page.reset_updated_password
end

And(/^I update merchant password with blank values$/) do
  @dealdey.merchant_account_page.submit_form
end

And(/^I update merchant password without "([^\"]*)"$/) do|pass_attr|
  @dealdey.merchant_account_page.fill_and_save_password_field({pass_attr => ""})
end

And(/^I update merchant password with invalid current password$/) do
  @dealdey.merchant_account_page.fill_and_save_password_field({"current_password" => "xyz"})
end

And(/^I should see inline error on all password field$/) do 
  @dealdey.user_shared_page.wait_for_inline_error_messages
  MerchantAccountPage::MERCHANT_PASS_ATTR.each do |val|
    expect(@dealdey.user_shared_page.check_errors?(val)).to eq(true)
  end
end

Then(/^I should see subscription section$/) do
  expect(@dealdey.merchant_account_page.subscription_section?).to eq(true)
end

And(/^I should see proceed to payment link$/) do 
  expect(@dealdey.merchant_account_page.has_proceed_to_payment?).to eq(true)
end

Then(/^I should see normal and premium offer for subscription$/) do
  expect(@dealdey.merchant_account_page.multiple_subscription_offer?).to eq(true)
end

Then(/^I should see update profile form$/) do
  @dealdey.merchant_account_page.wait_for_edit_profile_form
  expect(@dealdey.merchant_account_page.has_edit_profile_form_attr?).to eq(true)
end

Then(/^I should see email field is disabled$/) do
  expect(@dealdey.merchant_account_page.merchant_email[:readonly]).to eq("true")
end

And(/^I update profile on my account section$/) do
  @dealdey.merchant_account_page.populate_merchant_profile
end

And(/^I update profile with invalid website on my account section$/) do
  @dealdey.merchant_account_page.populate_merchant_profile({"website" => "test"})
end

And(/^I update profile with blank values$/) do
  @dealdey.merchant_account_page.populate_merchant_profile({"business_name" => "", "location" => "", "contact_person" => "", "business_description" => "", "phone" => ""})
end