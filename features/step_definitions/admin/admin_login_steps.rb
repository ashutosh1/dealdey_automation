Given(/^I visit admin section$/) do 
  visit(url_to_visit("admin_section"))
  @dealdey.admin_login_page.wait_for_login_form
end

And(/^I am logged in as admin$/) do 
  steps %{
    Given I visit admin section
    And I fill and submit login form for admin
  }
end

And(/^I fill and submit login form for admin$/) do 
  @dealdey.admin_login_page.populate_and_submit_form
end

And(/^I click on Login button for admin$/) do 
  @dealdey.admin_login_page.login_button.click
end

And(/^I submit admin login form with invalid credentials$/) do 
  @dealdey.admin_login_page.populate_and_submit_form({"email" => "test", "password" => "1234"})
end

And(/^I submit admin login form without password$/) do 
  @dealdey.admin_login_page.populate_and_submit_form({"password" => ""})
end

And(/^I submit admin login form with wrong password$/) do 
  @dealdey.admin_login_page.populate_and_submit_form({"password" => "wrong password"})
end

And(/^I should see admin login form$/) do 
  expect(@dealdey.admin_login_page.has_login_form?).to eq(true)
end