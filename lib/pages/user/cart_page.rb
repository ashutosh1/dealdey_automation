class UserCartPage < SitePrism::Page
  include FormHelper
  include AjaxHelper
  
  element :cart_header, "table tr#cart-header"
  elements :cart_items, "table tr.cart_item_area"
  element :cart_icon, "div.header-bottom div.header-last ul.cart-header li a.cart-header"
  element :deals_count_in_cart, "div.header-bottom div.header-last ul.cart-header li a span.count"

  
  # link(:continue_shopping, :text => "Continue shopping")
  # link(:proceed_to_payment, :text => "Proceed to Payment")
  # link(:edit_quantity, :text => "Edit")
  # link(:save_changed_quantity, :text => "Save")
  # link(:cancel_changed_quantity, :text => "Cancel")

  # select_list(:new_shipping_address_state, :id => "state")
  # select_list(:new_shipping_address_area, :id => "area")
  # div(:new_ship_address, :class => "cart_ship_address")

  # text_field(:quantity_box, :id => "quantity")
  # text_field(:shipping_address_name, :id => "cart_shipping_address_attributes_name")
  # text_field(:address_line, :id => "cart_shipping_address_attributes_address_line")
  # text_field(:address_landmark, :id => "cart_shipping_address_attributes_landmark")
  # form(:new_ship_address_form, :class => "edit_cart")

  # cells(:li_total_amount, :class => "amount")
  # cells(:li_price, :class => "price")
  # cell(:grand_total, :class => "total-amount")

  # def proceed
  #   span = @browser.find_element(:class => "main-button-orange-arrow")
  #   span.find_element(:name => "commit", :value => "Proceed to Payment", :type => "submit").click
  # end

  # def proceed_with_new_address
  #   @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div/div[2]/form/dl/span[2]/input").click
  # end

  # def populate_new_shipping_address
  #   populate_page_with data_for("address/new_shipping_address")
  #   self.new_shipping_address_state_element[1].click
  #   self.new_shipping_address_area_element[1].click
  #   proceed_with_new_address
  # end

  # def change_quantity(val)
  #   click_edit_quantity
  #   self.quantity_box = val
  #   self.save_changed_quantity
  # end
  
  # def edit_deal_quantity(limit)
  #   change_quantity(data_for("deals_data/shared")[limit] + 1)
  # end

  # def quantity_changed?(val)
  #   quantity_of_li == val
  # end

  # def li_total_updated?
  #   li_price_elements.last.text * quantity_of_li == li_total_amount_elements.last.text
  # end

  # def grand_total_updated?
  #   true
  #   # arr = li_total_amount_elements.collect(&:text)
  #   # arr.delete_at(arr.index("Total"))
  #   # arr.inject(&:+) == self.grand_total
  # end

  # def quantity_of_li
  #   click_edit_quantity
  #   quantity_box
  # end

  # def click_edit_quantity
  #   edit_quantity
  #   wait_for_ajax
  # end

end