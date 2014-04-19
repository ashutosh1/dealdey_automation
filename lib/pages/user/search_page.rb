class UserSearchPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  CATEGORY = ["Bestsellers", "City & Travel", "Fashion", "Gadgets & Electronics", "Home & Decor", "Baby & Kids"]
  element :search_field, "#search"
  element :search_form, "form#searchForm"
  element :serach_button, "form#searchForm input.search"
  element :search_deals_div, "#searched_deals"
  element :deals_div, "#deals"
  element :search_page, "#search_page"
  element :search_text, ".subCat"

  element :search_header, "h2.search"
  element :search_result_header, "h3.title"
  element :detail_page_header, "h1.title"
  element :best_seller, "div.city_deals span.text", :text => "Bestsellers"
  elements :search_results, "div.deals div.city_deals #all_category_deals"
  
  elements :all_categories, ".text"
  element :search_title, ".title"
  element :search_result_title, ".left_title"
  element :auto_suggest_results_header, "div#searched_deals div#deals span.title"
  element :auto_suggest_first_result, "div#searched_deals div#deals ul li:nth-child(1) a"
  
  
  def search
    serach_button.click
  end

  def all_categories?(txt)
    all_categories.collect(&:text).include?(txt)
  end

  def search_suggestion?
    has_auto_suggest_results_header? && has_auto_suggest_first_result?
  end

  def search_result_page?
    has_detail_page_header? && has_search_result_title?
  end
end

