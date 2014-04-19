And(/^I click forget password link$/) do
  rescue_background_exception{@dealdey.user_login_page.forget_password_link.click}
end

Then(/^I should see forget password page$/) do
  expect(@dealdey.user_forget_password_page.has_forget_password_div?).to eq(true)
end

And(/^I click Send me reset password instructions$/) do
  @dealdey.user_forget_password_page.resend_password_instruction.click
end

And(/^I submit resend instruction with "(.*?)"$/) do |email|
  @dealdey.user_forget_password_page.submit_resend_password_form(email)
end

