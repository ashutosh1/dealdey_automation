Then(/^I should see sign in link$/) do
  expect(@dealdey.user_login_page.has_sign_in_link?).to eq(true)
end

And(/^I click Sign In link$/) do
  @dealdey.user_login_page.sign_in_link.click
end

And(/^I click on Sign In button$/) do
  @dealdey.user_login_page.sign_in
  wait_for_ajax
end

Then(/^I should see sign in popup$/) do
  expect(@dealdey.user_login_page.has_sign_in_popup?).to eq(true)
end

Given(/^I visit home page and see the sign in popup$/) do
  rescue_background_exception{@dealdey.user_login_page.sign_in_link.click}
end

And(/^I submit sign in form with valid credentials$/)do 
  @dealdey.user_login_page.populate_signin_form
end

And(/^I submit sign in form with wrong password$/)do 
  @dealdey.user_login_page.populate_signin_form({"password" => "xyz"})
end

And(/^I submit sign in form without password$/)do 
  @dealdey.user_login_page.populate_signin_form({"password" => ""})
end

And(/^I submit sign in form with invalid credentials$/)do 
  @dealdey.user_login_page.populate_signin_form({"email" => "xz@zv.com", "password" => "xyz"})
end

Given(/^I am signed in as user$/) do 
  steps %{
    And I click Sign In link
    And I submit sign in form with valid credentials
  }
end

Given(/^I am signed in as another user$/) do 
  steps %{
    And I click Sign In link
    And I submit sign in form with "admin second" login
  }
end

And(/^I submit sign in form with "(.*?)" login$/) do |user|
  @dealdey.user_login_page.populate_signin_form(data_for("users/#{user.downcase.split.join('_')}"))
end

Given(/^I am signed in as "(.*?)"$/) do |user|
  steps %{
    And I click Sign In link
    And I submit sign in form with "#{user}" login
  }
end