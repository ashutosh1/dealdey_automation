Given(/^I am on account page$/) do
  rescue_background_exception do 
    @dealdey.user_account_page.account.hover
    @dealdey.user_account_page.settings.click
  end
end

Then(/^I see profile details$/) do
  expect(@dealdey.user_account_page.has_profile_form?).to eq(true)
end 

And(/^I update my profile$/) do
  @dealdey.user_account_page.update_profile
end

And(/^I update profile without "([^\"]*)"$/) do|pass_attr|
  @dealdey.user_account_page.populate_user_profile({pass_attr => ""}, pass_attr)
end

And(/^I update profile with invalid mobile$/) do
  @dealdey.user_account_page.populate_user_profile({"mobile" => "0567787878"}, "mobile")
end

And(/^I update profile without age bracket$/) do
  @dealdey.user_account_page.select_data_form_select_list(1, "age")
  @dealdey.user_account_page.click_on_save
end

And(/^I update profile without gender$/) do
  @dealdey.user_account_page.select_data_form_select_list(1, "gender")
  @dealdey.user_account_page.click_on_save
end

And(/^I click select none$/) do
  @dealdey.user_account_page.select_none.click
end

And(/^I save news letter settings$/) do
  @dealdey.user_account_page.save_news_letter
end

Then(/^All select box should be unchecked$/) do
  expect(@dealdey.user_account_page.checkboxes_unchecked?).to eq(true)
end

And(/^I update news letter settings$/) do
  @dealdey.user_account_page.wait_for_news_letter_checkbox
  @dealdey.user_account_page.news_letter_checkbox.first.set(true)
  @dealdey.user_account_page.save_news_letter
end

And(/^I should see first check box are checked$/) do 
  expect(@dealdey.user_account_page.news_letter_checkbox.first.checked?).to eq(true)
end

Given(/^I am on update address page$/) do
  @dealdey.user_account_page.address_tab.click
  @dealdey.user_account_page.wait_for_shipping_address_form
end

And(/^I add a new address$/) do
  @dealdey.user_account_page.add_new_address
end

And(/^I edit first address$/) do
  @dealdey.user_account_page.edit.first.click
  @dealdey.user_account_page.wait_for_edit_address_name
  @dealdey.user_account_page.update_address
end

And(/^I delete first address$/) do
  @dealdey.user_account_page.delete.first.click
  alert = page.driver.browser.switch_to().alert();
  alert.accept()
  wait_for_ajax
end

Given(/^I am on update update password page$/) do
  @dealdey.user_account_page.password_tab.click
  @dealdey.user_account_page.wait_for_new_password
end

And(/^I update password with invalid current password$/) do
  @dealdey.user_account_page.fill_and_save_password_field({"current_password" => "xyz"})
end

And(/^I update password$/) do
  @dealdey.user_account_page.fill_and_save_password_field
end

And(/^I reset the password$/) do
  @dealdey.user_account_page.reset_update_password
end

And(/^I submit blank shipping address form$/) do
  @dealdey.user_account_page.save_address
end

And(/^I update password without "([^\"]*)"$/) do|pass_attr|
  @dealdey.user_account_page.fill_and_save_password_field({pass_attr => ""})
end

And(/^I update password with blank values$/) do
  @dealdey.user_account_page.click_on_save
end
