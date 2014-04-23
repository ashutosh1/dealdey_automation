require 'uri'
require 'cgi'

# Given /^(?:|I )am on "([^\"]*)" page$/ do |page_name|
#   @dealdey.send(page_name.split.join("_")).load
#   @dealdey.send(page_name.split.join("_")).displayed?
# end

# When /^(?:|I )go to (.+) page$/ do |page_name|
#   @dealdey.send(page_name.split.join("_")).load
#   @dealdey.shared_page.wait_default
# end

Then /^(?:|I )should be on "([^\"]*)"$/ do |page_name|
  expect(@dealdey.send(page_name.split.join("_")).displayed?).to eq(true)
end

And(/^I go back$/) do 
  go_back
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )click "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
  # find("option[value='Male']").click
  # find("option:nth-child(2)").click
  # find("option", value).click
  # all('#foo option')[2].select_option
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|I )choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^(?:|I )attach the file "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then(/^I should see "([^\"]*)"$/) do |expected_text|
  expect(page.text).to include(expected_text)
end

Then(/^I should not see "([^\"]*)"$/) do |expected_text|
  expect(page.text).to_not include(expected_text)
end
