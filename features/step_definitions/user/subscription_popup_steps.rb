Then(/^I should see subscription popup$/) do
  expect(@dealdey.user_subscription_popup.has_subscription_popup?).to eq(true)
end

And(/^I close the subscription popup$/) do
  rescue_background_exception{@dealdey.user_subscription_popup.close_subscription.click}
end

Then(/^I should see signup button for subscription popup$/) do
  expect(@dealdey.user_subscription_popup.has_signup?).to eq(true)
end

When(/^I submit subscription form with email "(.*?)"$/) do |email|
  @dealdey.user_subscription_popup.subscription_email.set(email)
  @dealdey.user_subscription_popup.register
end

And(/^I should see subscription form$/) do 
  expect(@dealdey.user_subscription_popup.subscription_form?).to eq(true)
end

And(/^I should see "(.*?)" link$/) do |link|
  expect(@dealdey.user_subscription_popup.already_registered_link?(link)).to eq(true)
end