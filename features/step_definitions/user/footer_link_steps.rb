Then(/^I should see "([^\"]*)" in footer$/) do |expected_text|
  expect(@dealdey.user_footer_link_page.footer_div.text).to include(expected_text)
end

And(/^I click "([^\"]*)" in footer$/) do |expected_text|
  @dealdey.user_footer_link_page.send(expected_text.downcase.split.join("_")).click
end

Then(/^I should see avilable "(.*?)":$/) do|link_type, table|
  data = table.hashes[0]
  link_type = link_type.downcase.split.join("_")
  data[link_type].split.each do|social_link|
    expect(@dealdey.user_footer_link_page.send("has_#{social_link}?")).to eq(true)
  end
end

Then(/^I click links and see respective pages:$/) do|table|
  data = table.hashes
  data.each do |hash|
    @dealdey.user_footer_link_page.send(hash["Click Links"].downcase.split.join("_")).click
    step "I should see \"#{hash['pages']}\""
  end
end

#TODO optimize below steps and check url instead of text and image
Then(/^I should be on dealdeyholic blog page$/) do
  aw = page.driver.browser.window_handles
  page.driver.browser.switch_to.window(aw[1])
  val = @dealdey.user_footer_link_page.has_dealdeyholic_blog_image?
  page.driver.browser.close
  page.driver.browser.switch_to.window(aw[0])
  expect(val).to eq(true)  
end

Then(/^I should see "([^\"]*)" in new tab$/) do |expected_text|
  aw = page.driver.browser.window_handles
  page.driver.browser.switch_to.window(aw[1])
  val = page.text
  page.driver.browser.close
  page.driver.browser.switch_to.window(aw[0])
  expect(val).to include(expected_text)
end