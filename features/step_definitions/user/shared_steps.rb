def check_all_inline_error(class_name)
  @dealdey.user_shared_page.wait_for_inline_error_messages
  Object.const_get("#{class_name}")::DEFAULT_ATTR.each do |val|
    expect(@dealdey.user_shared_page.check_errors?(val)).to eq(true)
  end
end

Then(/^I should see flash message "([^\"]*)"$/) do |expected_text|
  @dealdey.user_shared_page.wait_for_flash(10)
  expect(@dealdey.user_shared_page.flash.text).to eq(expected_text)
end

Then(/^I should see error message "([^\"]*)"$/) do |expected_text|
  expect(@dealdey.user_shared_page.error_messages[-1].text).to eq(expected_text)
end

Then(/^I should see inline error "([^\"]*)"$/) do|msg|
  expect(@dealdey.user_shared_page.check_inline_errors?(msg)).to eq(true)
end

Then(/^I should not see inline error "(.*?)"$/) do |expected_text|
  expect(@dealdey.user_shared_page.check_inline_errors?(expected_text)).to eq(false)
end

Then(/^I should see inline error on all "([^\"]*)" mandatory field$/) do|class_name|
  check_all_inline_error(class_name)
end 