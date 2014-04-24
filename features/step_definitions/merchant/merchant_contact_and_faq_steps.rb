And(/^I click contact on merchant home page$/) do
  @dealdey.merchant_contact_and_faq_page.contact.click
end 

Then(/^I should see head and branch office image of dealdey$/) do
  expect(@dealdey.merchant_contact_and_faq_page.branch_and_head_office_image?).to eq(true)
end 

Then(/^I should see "([^\"]*)" map$/)do|gmap|
  expect(@dealdey.merchant_contact_and_faq_page.send("has_#{gmap.downcase.split.join('_')}?")).to eq(true)
end 

Then(/^I should see help email "([^\"]*)"$/)do|email|
  expect(@dealdey.merchant_contact_and_faq_page.help_email.text).to eq(email)
end 

Then(/^I should see advertise email "([^\"]*)"$/)do|email|
  expect(@dealdey.merchant_contact_and_faq_page.advertise_email.text).to eq(email)
end 

Then(/^I should see faq title "(.*?)"$/) do |arg1|
  expect(@dealdey.merchant_contact_and_faq_page.faq_page_title.text).to eq(arg1)
end

And(/^I click faq on merchant home page$/) do
  @dealdey.merchant_contact_and_faq_page.faq.click
end 

Then(/^I should see premium_slider image$/) do 
  expect(@dealdey.merchant_contact_and_faq_page.has_premium_slider?).to eq(true)
end