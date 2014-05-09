class HighlightIframe < SitePrism::Page
  element :body_field, "#tinymce"
end

class FinePrintIframe < SitePrism::Page
  element :body_field, "#tinymce"
end

class DescriptionIframe < SitePrism::Page
  element :body_field, "#tinymce"
end

class AdminNewProductDealPage < SitePrism::Page
  include FormHelper
  include AjaxHelper
  iframe :highlight_iframe, HighlightIframe, "form#new_deal table#deal_highlights_tbl #deal_highlights_ifr"
  iframe :fine_print_iframe, FinePrintIframe, "form#new_deal table#deal_highlights_tbl #deal_fine_prints_ifr"
  iframe :description_iframe, DescriptionIframe, "form#new_deal table#deal_highlights_tbl #deal_description_ifr"

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
  element :ul_for_autosuggest_field, "ul.ui-autocomplete.ui-menu.ui-widget.ui-widget-content.ui-corner-all"
  elements :autosuggest_items, "ul.ui-autocomplete.ui-menu.ui-widget.ui-widget-content.ui-corner-all li"
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
  element :deal_cod_available, "form#new_deal #deal_cod_available"

  element :check_sku , "a#check_sku"
  element :save_deal, "button.button"

  def submit_new_deal_form(data={})
    populate_form(data_for("deals/new_deal").merge(data))
    upload_files
    select_dates
    select_states_from_multi_select_box
    fill_autosuggest_data
    fill_tiny_text_areas
    save_new_deal
  end

  def save_new_deal
    save_deal.click
  end

  def upload_files
    ["upload_image", "upload_listing_image"].each do |file_field|
      send(file_field).set(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'config/data/images', 'filpkart.jpg')))
    end
  end

  def select_dates
    end_year = deal_start_date_1i.find('option[selected]').text.to_i + 1
    deal_end_date_1i.find(:option, end_year).select_option
    deal_expiration_date_1i.find(:option, end_year + 1).select_option
  end

  def select_states_from_multi_select_box
    deal_state_ids.find("option:nth-child(2)").select_option
  end

  def fill_autosuggest_data
    ["deal_category_name", "business_name"].each do |field|
      if send("has_#{field}?")
        send(field).set("as")
        wait_for_autosuggest_items
        autosuggest_items.first.click
      end
    end
  end

  def fill_tiny_text_areas
    ["highlight_iframe", "description_iframe", "fine_print_iframe"].each do |iframe|
      send(iframe) do |frame|
        frame.body_field.set(data_for("deals/#{iframe}")["text"])
      end
    end
  end
  
  def all_there? 
    items = self.class.mapped_items - ["ul_for_autosuggest_field", "autosuggest_items", "highlight_iframe", "fine_print_iframe", "description_iframe"]
    items.all? {|element| send "has_#{element}?" }
  end
end