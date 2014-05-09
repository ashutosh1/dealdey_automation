Then(/^I should see new product deal form$/) do 
  expect(@dealdey.admin_new_product_deal_page.has_new_product_deal_form?).to eq(true)
end

And(/^I should see all fields of new product deal form$/) do 
  expect(@dealdey.admin_new_product_deal_page.all_there?).to eq(true)
end

And(/^I submit blank deal form$/) do 
  @dealdey.admin_new_product_deal_page.save_new_deal
end

When(/^I submit new deal form with sms text less than min char allowed$/) do 
  @dealdey.admin_new_product_deal_page.submit_new_deal_form("deal_sms_text" => "sms")
end

When(/^I submit new deal form with sms text greater than max char allowed$/) do 
  @dealdey.admin_new_product_deal_page.submit_new_deal_form("deal_sms_text" => "sms greater than max char allowed, testing max allowed char in sms.char should be less than 67")
end

When(/^I submit new deal form with image size greater than max size allowed$/) do 
  @dealdey.admin_new_product_deal_page.upload_image.set(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'config/data/images', 'maxsize.jpg')))
  @dealdey.admin_new_product_deal_page.save_new_deal  
end

And(/^I submit new deal form with valid data$/) do 
  @dealdey.admin_new_product_deal_page.submit_new_deal_form
end