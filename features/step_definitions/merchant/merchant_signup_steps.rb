Given(/^I am on merchant welcome page$/) do
  rescue_background_exception{@dealdey.merchant_signup_page.upload_a_promo.click}
end

Given(/^I am logged in as merchant$/) do
  rescue_background_exception do 
    @dealdey.merchant_signup_page.sign_in_link.click
    @dealdey.merchant_signup_page.wait_for_merchant_signin_form
    @dealdey.merchant_signup_page.sign_in_merchant("merchant_with_valid_subscription")
  end
end 

And(/^I am logged in as merchant with valid subscription$/) do
  @dealdey.merchant_signup_page.sign_in_merchant("merchant_with_valid_subscription")
end 

And(/^I am logged in as merchant with invalid subscription$/) do
  @dealdey.merchant_signup_page.sign_in_merchant("merchant_with_invalid_subscription")
end 

Then(/^I see signin and signup links$/) do
  expect(@dealdey.merchant_signup_page.signin_and_signup_links?).to eq(true)
end 

And(/^I click sign in as merchant link$/) do
  rescue_background_exception{@dealdey.merchant_signup_page.sign_in_link.click}
end

Then(/^I see merchant sign_in form in popup$/) do
  expect(@dealdey.merchant_signup_page.has_merchant_signin_form?).to eq(true)
end 

And(/^I submit merchant sign in form with wrong credentials$/) do
  @dealdey.merchant_signup_page.populate_merchant_signin_form({"merchant_email" => "test@deal.com"})
end

And(/^I submit merchant sign in form without password$/) do
  @dealdey.merchant_signup_page.populate_merchant_signin_form({"merchant_password" => ""})
end

And(/^I submit merchant sign in form with wrong password$/) do
  @dealdey.merchant_signup_page.populate_merchant_signin_form({"merchant_password" => "909090"})
end

And(/^I submit merchant sign in form$/) do
  @dealdey.merchant_signup_page.populate_merchant_signin_form
end

Given(/^I am on merchant signup page$/) do
  @dealdey.merchant_signup_page.sign_up.click
end

Then(/^I should see merchant signup form$/) do
  @dealdey.merchant_signup_page.wait_for_merchant_signup_form
  expect(@dealdey.merchant_signup_page.has_merchant_signup_form?).to eq(true)
end 

And(/^I submit the signup form$/) do
  @dealdey.merchant_signup_page.submit_signup_form
end 

And(/^I fill "([^\"]*)" with "([^\"]*)"$/) do|merch_attr, value|
  @dealdey.merchant_signup_page.populate_merchant({merch_attr => value})
end 

And(/^I fill merchant signup form$/) do
  @dealdey.merchant_signup_page.populate_merchant
end 

And(/^I check offer promo checkbox$/) do
  @dealdey.merchant_signup_page.offer_promo.set(true)
end 

And(/^I upload a logo$/) do
  @dealdey.merchant_signup_page.logo_file.set(File.join(File.dirname(__FILE__), '..', '..', '..', 'config/data/images', 'flipkart.jpg'))
end 

Then(/^I should be on merchant forget password page$/) do
  expect(@dealdey.merchant_signup_page.forget_password_page?).to eq(true)
end

And(/^I click Send me reset password instructions for merchant$/) do
  @dealdey.merchant_signup_page.resend_password_instruction.click
end

And(/^I fill merchant email for resend instruction with "(.*?)"$/) do |email|
  @dealdey.merchant_signup_page.user_email_for_resend.set(email)
end