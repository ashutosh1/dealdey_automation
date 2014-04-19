Then(/^I should see search form$/) do
  expect(@dealdey.user_search_page.has_search_form?).to eq(true)
end

And(/^I enter "([^\"]*)" in search field$/) do |text|
  @dealdey.user_search_page.search_field.set(text)
  @dealdey.user_search_page.wait_for_auto_suggest_results_header if text != "xyxyxyxyxyxyxyx"
end

Then(/^I should see search suggestions$/) do
  expect(@dealdey.user_search_page.search_suggestion?).to eq(true)
end

And(/^I click autosuggest serach result$/) do
  @dealdey.user_search_page.auto_suggest_first_result.click
end

Then(/^I should be on deal details page$/) do
  expect(@dealdey.user_search_page.search_result_page?).to eq(true)
end

And(/^I click search button$/) do
  @dealdey.user_search_page.search
end

Then(/^I should see search text "(.*?)"$/) do |arg1|
  expect(@dealdey.user_search_page.has_search_text? && @dealdey.user_search_page.search_text.text.include?(arg1)).to eq(true)
end

Then(/^I should see search results$/) do
  expect(@dealdey.user_search_page.search_results.count).to be >= 1
end

Then(/^I should see all categories section$/) do
  UserSearchPage::CATEGORY.each do|txt|
    expect(@dealdey.user_search_page.all_categories?(txt)).to eq(true)
  end
end

And(/^I search with "(.*?)"$/) do |text|
  @dealdey.user_search_page.search_field.set(text)
  @dealdey.user_search_page.search
end


