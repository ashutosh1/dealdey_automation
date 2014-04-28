And(/^I click on "(.*?)" in nav bar$/) do |link|
  @dealdey.admin_landing_page.send(link.downcase.split.join("_")).click
end