class VisaPaymentIframe < SitePrism::Page
  #Visa card field for payment
  element :credit_card_num, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td input[name='pan']"
  element :cvv, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td input#cvv2"
  element :cardholder_name, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td input[name='fio']"
  element :expiration_month, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td select[name='expMon']"
  element :expiration_year, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td select#ExpYear"
  element :ok, "div#style_bl div#wrapper div#main table tbody tr td form#mF table.dates tbody tr td.titletr button#OK"

  element :ipin, "div#body form#fr input#iPIN"
  element :submit, "div#body #btnSubmit"

  element :keys, "body div#body div#keypad-div div.keypad-row button.keypad-key"
  element :gateway_response, "div.message div.status"

  element :payable_amount_via_visa, "div#style_bl div#wrapper div#main table tbody tr td table.information tr:nth-child(2) td:nth-child(2)"
end

class PagaPaymentIframe < SitePrism::Page
  element :payable_amount_via_paga, "#epay div#layout-wrapper div#layout-contents div#content div.purchase.panel.ui-corner-all div:nth-child(2) div.contents div.inset.clearfix div.form div:nth-child(4) span:nth-child(2)"
  element :xyz, "#epay div#layout-wrapper div#layout-contents div#content div.purchase.panel.ui-corner-all div:nth-child(2) div.contents div.inset.clearfix div.form div:nth-child(4) span:nth-child(1)"
end

class UserCheckoutPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  DEFAULT_ATTR = ["Name", "Address line", "State", "Area"]
  iframe :visa_payment_iframe, VisaPaymentIframe, "div#pageContent #valu-card-online-payment-iframe"
  iframe :paga_payment_iframe, PagaPaymentIframe, "div#pageContent #paga-online-payment-iframe"

  #Webpay gateway page, Payable amount
  element :payable_amount_via_webpay, "div#outer-frame div#payment-information form div#mainDiv div.price_ish div.course-ribbon.green"

  #Payment Methods
  element :pod_payment_method , "div.payment-methods ul.methods li.cod span.top-section .cod-img"
  element :rencredit_payment_method, "div.payment-methods ul.methods li.rencredit span.top-section .rencredit-img"
  element :one_credit_payment_method, "div.payment-methods ul.methods li.one_credit span.top-section .one_credit-img"
  element :visa_card_payment_method, "div.payment-methods ul.methods li.valucard.not-using-wallet-tab  span.top-section .valucard-img"
  element :paga_payment_method, "div.payment-methods ul.methods li.paga_epay.using-wallet-tab span.top-section .image"

  #Complete button for diffrent payment methods
  element :complete_order, "div#wallet_mode div.wallet-left div.form-section form span.main-button-orange-arrow input"
  element :complete_epay_order , "div#paga_epay_mode div.form-section form span.main-button-orange-arrow input"
  element :complete_pod_order, "div#cod_mode span.main-button-orange-arrow input"
  element :complete_onecredit_order, "div#one_credit_mode div.form-section form span.main-button-orange-arrow input"
  element :complete_visa_order, "div#valucard_mode div.form-section form span.main-button-orange-arrow input"
  element :complete_order_webpay, "div#web_pay_mode div.form-section form span.main-button-orange-arrow input"
  element :complete_paga_order, "div#paga_epay_mode div.form-section form span.main-button-orange-arrow input"

  element :wallet_balance, "div.complete-order div.wallet-payment div.wallet-sum span#wallet-amt span.text"
  element :credit_link, "div.complete-order div.wallet-payment div.wallet-sum span#wallet-amt a"
  element :use_wallet, "div.complete-order div.wallet-payment div.checkbox-option #select-wallet"
  element :instruction_popup, "div.visa-instructions"
  element :close_instruction_popup, "a.ui-dialog-titlebar-close.ui-corner-all"
  
  #Confirm and Continue page before gateway
  element :tracking_id, "div.confirmationForm div.topBox.infoBlock p.para strong"
  elements :user_info, "div.formField"
  element :confirm_and_continue, "div.formField.buttons span.main-button-orange-arrow input"
  #In case of webpay or visa
  element :total_amount, "div.confirmationForm div:nth-child(5)"  
  element :paid_via_wallet, "div.confirmationForm div:nth-child(6)"  
  element :payable_via_card, "div.confirmationForm div:nth-child(7)" 
  #In case of Paga
  element :paga_total_amount, "div.confirmationForm div:nth-child(4)"  
  element :paga_paid_via_wallet, "div.confirmationForm div:nth-child(5)"  
  element :paga_payable_via_card, "div.confirmationForm div:nth-child(6)" 

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
  
  def has_wallet_amount_and_credit_link?
    has_credit_link? && has_wallet_balance?
  end

  def has_visa_instrction_popup?
    has_instruction_popup? && has_close_instruction_popup?
  end

  def has_tracking_id_and_user_info?
    has_tracking_id? && has_user_info?
  end

  def populate_new_shipping_address
    populate_form data_for("address/new_shipping_address")
    new_shipping_address_state.find('option:nth-child(2)').select_option
    wait_for_ajax
    new_shipping_address_area.find('option:nth-child(2)').select_option
    pod_proceed_to_payment_with_new_address.click
    wait_for_ajax
  end
  
  #TODO find a way to keep data safe
  def submit_gateway_form(data={})
    wait_for_visa_payment_iframe
    visa_payment_iframe do |frame|
      frame.credit_card_num.set(ENV["CREDIT_CARD_NUM"]) 
      frame.cvv.set(ENV["CREDIT_CARD_CVV"])
      frame.cardholder_name.set(ENV["CREDIT_CARD_HOLDER_NAME"])
      frame.expiration_month.find(:option, ENV["CREDIT_CARD_EXPIRY_MONTH"]).select_option
      frame.expiration_year.find(:option, ENV["CREDIT_CARD_EXPIRY_YEAR"]).select_option
      frame.ok.click 
    end
  end

  def pay
    visa_payment_iframe {|frame| frame.submit.click }
  end

  def gateway_message?(expected_text)
    wait_for_visa_payment_iframe
    visa_payment_iframe do |frame|
      frame.wait_for_gateway_response
      return frame.gateway_response.text.include?(expected_text)
    end
  end
  
  def is_payable_amount_via_card_correct?
    get_amount(total_amount.text) == (payable_amount_via_gateway + get_amount(paid_via_wallet.text))
  end

  def get_amount(elem)
    amount = elem.scan(/(\d+[.,]\d+)/).flatten.first.gsub(',','')
    return amount.to_f if !amount.nil?
    elem.scan(/\d/).flatten.first.gsub(',','').to_f
  end

  def check_reamining_payable_amount?(gateway, payable_amount)
    if gateway.downcase == "visa"
      wait_for_visa_payment_iframe
      visa_payment_iframe do |frame|
        payable_amount ==  frame.payable_amount_via_visa.text.to_f
      end
    elsif gateway.downcase == "paga"
      wait_for_paga_payment_iframe
      paga_payment_iframe do |frame|
        payable_amount ==  get_amount(frame.payable_amount_via_paga.text)
      end   
    else
      wait_for_payable_amount_via_webpay
      payable_amount == get_amount(payable_amount_via_webpay.text)
    end
  end

  def payable_amount_via_gateway
    get_amount(payable_via_card.text) 
  end
  
  def is_payable_amount_via_paga_card_correct?
    get_amount(paga_total_amount.text) == (payable_amount_via_paga_gateway + get_amount(paga_paid_via_wallet.text))    
  end

  def payable_amount_via_paga_gateway
    get_amount(paga_payable_via_card.text) 
  end
end
