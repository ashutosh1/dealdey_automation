Given(/^I am on merchant welcome page$/) do
  rescue_background_exception{@dealdey.merchant_signup_page.upload_a_promo.click}
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
  @dealdey.merchant_signup_page.sign_up
end

Then(/^I should see merchant signup form$/) do
  expect(@dealdey.merchant_signup_page.merchant_signup_form?).to eq(true)
end 

And(/^I submit the signup form$/) do
  @dealdey.merchant_signup_page.submit_form
end 

And(/^I fill "([^\"]*)" with "([^\"]*)"$/) do|merch_attr, value|
  @dealdey.merchant_signup_page.populate_merchant({merch_attr.to_sym => value})
end 

And(/^I fill merchant signup form$/) do
  @dealdey.merchant_signup_page.populate_merchant
end 

And(/^I check offer promo checkbox$/) do
  @dealdey.merchant_signup_page.select_offer_promo
end 

And(/^I upload a logo$/) do
  @dealdey.merchant_signup_page.logo_file = File.join(File.dirname(__FILE__), '..', '..', 'config/data/images', 'flipkart.jpg')
end 



And(/^I click sign in as merchant button$/) do
  @dealdey.merchant_signup_page.sign_in
end



Then(/^I should be on merchant forget password page$/) do
  expect(@dealdey.merchant_signup_page.forget_password_page?).to eq(true)
end

And(/^I fill merchant email for resend instruction with "(.*?)"$/) do |email|
  @dealdey.merchant_signup_page.user_email_for_resend = email
end