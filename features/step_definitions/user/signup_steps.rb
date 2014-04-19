Then(/^I should see sign up link$/) do
  expect(@dealdey.user_signup_page.has_sign_up_link?).to eq(true)
end

Given(/^I visit home page and see the sign up popup$/) do
  rescue_background_exception{@dealdey.user_signup_page.sign_up_link.click}
end

Then(/^I should see signup form$/) do 
  expect(@dealdey.user_signup_page.all_there?).to eq(true)
end

And(/^I submit blank signup form$/) do
  @dealdey.user_signup_page.sign_up
end

And(/^I submit signup form with wrong mobile$/) do
  @dealdey.user_signup_page.populate_user({"mobile" => "0898989"})
end

And(/^I submit signup form with existing email$/) do
  @dealdey.user_signup_page.populate_user({"email" => "vijay@vinsol.com"   })
end

And(/^I submit signup form with different password and password confirmation$/) do
  @dealdey.user_signup_page.populate_user({"password" => "123456", "password_confirmation" => "789635"})
end

And(/^I submit signup form$/) do
  @dealdey.user_signup_page.populate_user  
end

And(/^I submit signup form with wrong email$/) do
  @dealdey.user_signup_page.populate_user({"email" => "test"})
end
