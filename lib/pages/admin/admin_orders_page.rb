#cart section on admin orders page
class CartSection < SitePrism::Section
  element :cart_table, "table.table"
  element :cart_items, "table.table tr.cart_item_area"
  element :cart_item_quantity, "table.table tr.cart_item_area.odd td.deal_qty"
  element :edit_cart_quantity, "table.table tr.cart_item_area.odd td.deal_qty a.edit_link"
  element :input_for_edit_quantity, "table.table tr.cart_item_area.odd td.deal_qty_edit input#quantity"
  element :save_changed_quantity, "table.table tr.cart_item_area.odd td.deal_qty_edit a", :text => "Save"
  element :cart_item_price, "table.table tr.cart_item_area.odd td.price"
  element :cart_item_total, "table.table tr.cart_item_area.odd td.amount"
  elements :all_cart_item_total, "table.table tr.cart_item_area td.amount"
  element :grand_total, "table.table tr#cart_summary td table tr td#total-amount"
end
#user section to add user to order
class AddUserSection < SitePrism::Section
  element :search_user_field, "div.auto_email form input#email"
  element :add_user, "button.button"
end

class CustomerDetailSection < SitePrism::Section
  element :user_name, "div.user_detail p.customer_name"
  element :user_email, "div.user_detail p.customer_email"
  element :proceed_to_payment, "div.buttons span.main-button-orange-arrow input.existing_address.button"
end

class AdminOrdersPage < SitePrism::Page
  include AjaxHelper
  section :cart_section, CartSection, "div.cart-table-holder"
  section :add_user_section, AddUserSection, "div.inner"
  section :customer_detail_section, CustomerDetailSection, "div.inner"

  element :new_order, "div.page-header-right a.right.button", :text => "New Order"
  #To search a deal 
  element :search_deal_form, "form#searchForm"
  element :search_deal, "form#searchForm #search"
  element :continue, "a.button"
  element :discard_cart, "a", :text => "Discard Cart"
  
  #auto suggestion while searching deals/users
  elements :auto_suggested_deals, "div#searched_deals div#deals ul li a"
  elements :auto_suggessted_users , "ul.ui-autocomplete.ui-menu.ui-widget.ui-widget-content.ui-corner-all li.ui-menu-item a"  

  #checkout section
  element :wallet_payment_option, "div.payment-methods ul.methods li.wallet span.top-section label.wallet-img"
  element :pod_payment_option, "div.payment-methods ul.methods li.cod span.top-section label"
  element :complete_order, "div.form-section form span.wallet-button input.button"
  element :wallet_balance, "div.payment-box div#wallet_mode div.wallet-left dl.wallet dd"

  def serach_and_add_deal_to_cart
    search_deal.set(data_for("default/pod_non_shippable_deal")["title"])
    wait_for_auto_suggested_deals
    select_auto_suggested_deals
  end

  def select_auto_suggested_deals
    auto_suggested_deals.first.click
  end

  def edit_deal_quantity(limit)
    change_quantity(data_for("deals_data/shared")[limit] + 1)
  end

  def change_quantity(val)
    click_edit_quantity
    cart_section.input_for_edit_quantity.set(val)
    cart_section.save_changed_quantity.click
  end

  def click_edit_quantity
    cart_section.edit_cart_quantity.click
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
    cart_section.cart_item_quantity.text.to_i
  end

  def unit_price_for_li
    get_amount(cart_section.cart_item_price.text)
  end

  def line_item_total
    get_amount(cart_section.cart_item_total.text)
  end 

  def grand_total_updated?
    grand_total_of_deals == sum_of_all_line_item_total
  end

  def grand_total_of_deals
    get_amount(cart_section.grand_total.text)
  end

  def sum_of_all_line_item_total
    cart_section.all_cart_item_total.collect(&:text).inject(0){|res, elem| res.to_f + get_amount(elem)}
  end 
  
  def get_amount(elem)
    elem[1..-1].gsub(',','').to_f
  end

  def has_customer_deatils_and_proceed_button?
    customer_detail_section.has_user_email? && customer_detail_section.has_user_name? && customer_detail_section.has_proceed_to_payment?
  end

  def serach_and_add_user
    add_user_section.search_user_field.set(data_for("users/admin_first")["email"])
    wait_for_auto_suggessted_users
    auto_suggessted_users.first.select_option
    add_user_section.add_user.click
    wait_for_ajax
  end

  def has_payment_options?
    has_wallet_payment_option? && has_pod_payment_option?
  end
end
