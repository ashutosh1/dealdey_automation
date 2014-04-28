And(/^I click on "(.*?)" on deal page$/) do |link|
  @dealdey.admin_deals_page.send(link.downcase.split.join("_")).click
end