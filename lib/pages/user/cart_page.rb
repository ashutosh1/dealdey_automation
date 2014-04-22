class UserCartPage < SitePrism::Page
  include FormHelper
  include AjaxHelper
  
  element :cart_header, "table tr#cart-header"
  elements :cart_items, "table tr.cart_item_area"
  element :cart_icon, "div.header-bottom div.header-last ul.cart-header li a.cart-header"
  element :deals_count_in_cart, "div.header-bottom div.header-last ul.cart-header li a span.count"

  #edit cart quantity
  element :quantity_box, "table tbody tr.cart_item_area.odd td.deal_qty_edit input#quantity"
  element :edit_quantity, "table tbody tr.cart_item_area.odd td.deal_qty a"
  element :save_changed_quantity, "table tbody tr.cart_item_area.odd td.deal_qty_edit a.change_item_quantity_link"
  element :quantity_of_li, "table tbody tr.cart_item_area.odd td.deal_qty span"
  
  element :li_total_amount, "table tbody tr.cart_item_area.odd td.amount"
  element :li_price, "table tbody tr.cart_item_area.odd td.price"
  element :grand_total, "table tbody tr#cart_summary td#total-amount"
  elements :all_line_item_totals,  "table tbody tr.cart_item_area td.amount"
  
  #if user is not already logged in
  element :proceed_to_payment, "dl.buttons span.main-button-orange-arrow a"
  #if user is already logged in and No address or with new address
  element :proceed_to_payment_button, "dl.buttons span.main-button-orange-arrow input"
  #proceed with existing address
  element :proceed_to_payment_with_address, "div.user-addresses div.buttons span.main-button-orange-arrow a"

  element :continue_shopping, "dl.buttons span.btn-gray-small a"
  element :select_address, "div.user-addresses form#existing_ship_addr_form"
  elements :existing_address, "div.user-addresses form#existing_ship_addr_form ul.shipping_addresses"
  
  #Form for new shipping address
  element :new_ship_address_form, "form.edit_cart"
  element :shipping_address_name, "form.edit_cart input#cart_shipping_address_attributes_name"
  element :address_line, "form.edit_cart input#cart_shipping_address_attributes_address_line"
  element :address_landmark, "form.edit_cart input#cart_shipping_address_attributes_landmark"  
  element :new_shipping_address_state, "form.edit_cart #state", visible: false  
  element :new_shipping_address_area, "form.edit_cart #area", visible: false  
  
  def edit_deal_quantity(limit)
    change_quantity(data_for("deals_data/shared")[limit] + 1)
  end

  def change_quantity(val)
    click_edit_quantity
    quantity_box.set(val)
    save_changed_quantity.click
  end

  def click_edit_quantity
    edit_quantity.click
    wait_for_ajax
  end
  
  def updated_quantity_and_line_item_total?(val)
    updated_quantity?(val) && updated_li_total?
  end

  def updated_quantity?(val)
    current_li_quantity == val.to_i
  end

  def updated_li_total?
    current_li_quantity * unit_price_for_li == line_item_total
  end

  def current_li_quantity
    quantity_of_li.text.to_i
  end

  def unit_price_for_li
    get_amount(li_price.text)
  end

  def line_item_total
    get_amount(li_total_amount.text)
  end 

  def grand_total_updated?
    grand_total_of_deals == sum_of_all_line_item_total
  end

  def grand_total_of_deals
    get_amount(grand_total.text)
  end

  def sum_of_all_line_item_total
    all_line_item_totals.collect(&:text).inject(0){|res, elem| res.to_f + get_amount(elem)}
  end 
  
  def get_amount(elem)
    elem[1..-1].gsub(',','').to_f
  end

  def has_button?(btn)
    send("has_#{btn.downcase.split.join("_")}?")
  end
 
  def proceed
    has_proceed_to_payment? ? proceed_to_payment.click : proceed_to_payment_button.click 
  end

  def populate_new_shipping_address
    populate_form data_for("address/new_shipping_address")
    new_shipping_address_state.find('option:nth-child(2)').select_option
    wait_for_ajax
    new_shipping_address_area.find('option:nth-child(2)').select_option
    proceed_to_payment_button.click
  end

end