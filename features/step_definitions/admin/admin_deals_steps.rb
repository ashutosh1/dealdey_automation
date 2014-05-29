And(/^I click on "(.*?)" on "(.*?)" page$/) do |link, page|
  @dealdey.send("admin_#{page}_page").send(link.downcase.split.join("_")).click
end