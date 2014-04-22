class UserCheckoutPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  DEFAULT_ATTR = ["Name", "Address line", "State", "Area"]
  #Payment Methods
  element :pod_payment_method , "div.payment-methods ul.methods li.cod span.top-section .cod-img"
  element :rencredit_payment_method, "div.payment-methods ul.methods li.rencredit span.top-section .rencredit-img"

  #Complete button for diffrent payment methods
  element :complete_order, "div#wallet_mode div.wallet-left div.form-section form span.main-button-orange-arrow input"
  element :complete_epay_order , "div#paga_epay_mode div.form-section form span.main-button-orange-arrow input"
  element :complete_pod_order, "div#cod_mode span.main-button-orange-arrow input"
  
  element :continue, "div#rencredit_mode span.main-button-orange-arrow input"
  element :complete_rencredit_order, "div.rencredit_cart dl.buttons span.main-button-orange-arrow form#new_order.new_order input:nth-child(4)"
  #select address and proceed for cod popup for non shippable deals using pod
  element :select_or_add_shipping_address , "a#pop-up-address"
  element :pod_proceed_to_payment_with_old_address , "form.existing-address-form div.select-address ul li.button span.main-button-orange-arrow input"
  element :pod_proceed_to_payment_with_new_address , "div.input-address form ul li.button span.main-button-orange-arrow input"
  elements :existing_address_for_pod , "form.existing-address-form div.select-address ul li.address"
  
  element :address_line, "div.input-address form input#cod-address"
  element :address_landmark, "div.input-address form input#cod-landmark"
  element :shipping_address_name, "div.input-address form input#cod-name"
  element :new_shipping_address_state, "div.input-address form #shipping_address_state", visible: false  
  element :new_shipping_address_area, "div.input-address form .cod_area.select_area", visible: false  

  def click_on_complete_order
    complete_order.click    
  end

  def complete_order_with_pod
    pod_payment_method.click
    wait_for_complete_pod_order
    complete_pod_order.click
  end

  def populate_new_shipping_address
    populate_form data_for("address/new_shipping_address")
    new_shipping_address_state.find('option:nth-child(2)').select_option
    wait_for_ajax
    new_shipping_address_area.find('option:nth-child(2)').select_option
    pod_proceed_to_payment_with_new_address.click
    wait_for_ajax
  end

end
 