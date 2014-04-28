Then(/^I should see new product deal form$/) do 
  expect(@dealdey.admin_new_product_deal_page.has_new_product_deal_form?).to eq(true)
end

And(/^I should see all fields of new product deal of form$/) do 
  expect(@dealdey.admin_new_product_deal_page.all_there?).to eq(true)
end

And(/^I submit blank deal form$/) do 
  @dealdey.admin_new_product_deal_page.save_deal.click
end