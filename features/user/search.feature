Feature: Search Page
  Search for deals should work for user and admin both

Background:
  And I close the subscription popup

Scenario: user see search form and auto suggestion for search keywords
  Then I should see search form

  And I enter "profe" in search field
  Then I should see search suggestions
  
  And I click autosuggest serach result
  Then I should be on deal details page

Scenario: search deals with title
  And I search with "profe"
  Then I should see search results
  Then I should see search text "profe"

Scenario: search deals with wrong title
  And I search with "xyxyxyxyxyxyxyx"
  Then I should see "0 item(s) found for xyxyxyxyxyxyxyx"
  Then I should see "Make sure all the words are spelled correctly."
  Then I should see "Try searching for a less specific item."
  Then I should see "You may also want to look at our Top selling categories:"
  Then I should see all categories section

Scenario: Search deal's by keyword
  And I enter "test" in search field
  Then I should see search suggestions
  
  And I click search button
  Then I should see search results
  Then I should see search text "test"