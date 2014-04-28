class AdminNewProductDealPage < SitePrism::Page
  include FormHelper
  include AjaxHelper
  DEFAULT_ATTR = ["Title", "Short title", "Permalink", "Sku number", "Sms text", "States", "Category", "Business", "Image", "Listing image", "List price", "Discounted price", "Commission", "Address line1", "Description", "Fine prints", "Highlights", "Shippable states"]
  
  element :new_product_deal_form , "form#new_deal"
  #mandatory element
  element :deal_title, "form#new_deal input#deal_title"
  element :deal_short_title, "form#new_deal input#deal_short_title"
  element :deal_permalink, "form#new_deal input#deal_permalink"
  element :deal_sku_number, "form#new_deal input#deal_sku_number"
  element :deal_sms_text, "form#new_deal input#deal_sms_text"
  element :deal_list_price, "form#new_deal input#deal_list_price"
  element :deal_discounted_price, "form#new_deal input#deal_discounted_price"
  element :deal_commission, "form#new_deal input#deal_commission"
  element :deal_address_line1, "form#new_deal input#deal_address_line1"
  element :deal_shippable_states_1, "form#new_deal input#deal_shippable_states_1"
  #multi select box
  element :deal_state_ids, "form#new_deal #deal_state_ids", visible: true
  #autosuggest
  element :deal_category_name, "form#new_deal input#deal_category_name"
  element :business_name, "form#new_deal input#business_name"
  #upload file
  element :upload_image, "form#new_deal #deal_image"
  element :upload_listing_image, "form#new_deal #deal_listing_image"
  #Date fields
  element :deal_start_date_1i, "form#new_deal #deal_start_date_1i"
  element :deal_start_date_2i, "form#new_deal #deal_start_date_2i"
  element :deal_start_date_3i, "form#new_deal #deal_start_date_3i"

  element :deal_end_date_1i, "form#new_deal #deal_end_date_1i"
  element :deal_end_date_2i, "form#new_deal #deal_end_date_2i"
  element :deal_end_date_3i, "form#new_deal #deal_end_date_3i"

  element :deal_expiration_date_1i, "form#new_deal #deal_expiration_date_1i"
  element :deal_expiration_date_2i, "form#new_deal #deal_expiration_date_2i"
  element :deal_expiration_date_3i, "form#new_deal #deal_expiration_date_3i"
  #tables for text area field
  element :deal_fine_prints_tbl, "form#new_deal table#deal_fine_prints_tbl"
  element :deal_highlights_tbl, "form#new_deal table#deal_highlights_tbl"
  element :deal_description_tbl, "form#new_deal table#deal_description_tbl"
  
  #Not mandatory fields
  element :deal_test_deal, "form#new_deal input#deal_test_deal"
  element :deal_secret, "form#new_deal input#deal_secret"
  element :deal_type, "form#new_deal input[name='deal[deal_type]']:nth-child(1)"
  element :deal_rencredit_purchasable, "form#new_deal input#deal_rencredit_purchasable"
  element :deal_offline_deal, "form#new_deal input#deal_offline_deal"
  element :deal_maximum_limit, "form#new_deal input#deal_maximum_limit"
  element :deal_user_upper_limit, "form#new_deal input#deal_user_upper_limit"
  element :deal_size_display_name, "form#new_deal input#deal_size_display_name"
  element :deal_salesman, "form#new_deal input#deal_salesman"
  
  element :check_sku , "a#check_sku"
  element :save_deal, "button.button"
end