And(/^I click contact on merchant home page$/) do
  on(MerchantContactAndFaqPage).contact
end 

Then(/^I should see "([^\"]*)" image$/)do|img|
  expect(on(MerchantContactAndFaqPage).send("#{img}?")).to eq(true)
end 

Then(/^I should see "([^\"]*)" map$/)do|gmap|
  expect(on(MerchantContactAndFaqPage).send("#{gmap}?")).to eq(true)
end 

Then(/^I should see help email "([^\"]*)"$/)do|email|
  expect(on(MerchantContactAndFaqPage).help_email?).to eq(true)
end 

Then(/^I should see advertise email "([^\"]*)"$/)do|email|
  expect(on(MerchantContactAndFaqPage).advertise_email?).to eq(true)
end 

Then(/^I should see faq title "(.*?)"$/) do |arg1|
  expect(on(MerchantContactAndFaqPage).faq_page_title).to eq(arg1)
end

And(/^I click faq on merchant home page$/) do
  on(MerchantContactAndFaqPage).faq
end 