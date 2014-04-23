class MerchantHomePage < SitePrism::Page
  include AjaxHelper
  include FormHelper
  set_url_matcher /http:\/\/localhost:3000\/merchants/
  
  DEFAULT_ATTR = ["Business address", "Title", "Start date", "End date", "Description"]
  #offer promo form
  element :promo_offer_form, "form#new_discount_coupon"
  element :promo_url, "form#new_discount_coupon #discount_coupon_coupon_url"
  element :promo_code, "form#new_discount_coupon #discount_coupon_code"
  element :business_address, "form#new_discount_coupon #discount_coupon_business_address"
  element :coupon_title, "form#new_discount_coupon #discount_coupon_title"
  element :coupon_keywords, "form#new_discount_coupon #discount_coupon_keywords"
  element :coupon_start_date, "form#new_discount_coupon #discount_coupon_start_date"
  element :coupon_end_date, "form#new_discount_coupon #discount_coupon_end_date"
  element :submit_promo_button, "div.coupon_offer div.submit-form input.submit"

  element :view_all_promos, "a#all_coupons"
  element :logout, "a" , :text => "Logout"
  element :my_account, "a", :text => "My Account"
  element :contact, "a", :text => "Contact"
  element :proceed_to_payment, "a", :text => "Proceed To Payment"
   
  #Footer links and text
  element :merchant_footer, "div.merchant_footer"
  element :footer_contact ,"div.merchant_footer a", :text => "Contact"
  element :footer_faq ,"div.merchant_footer a", :text => "FAQ"
  
  #Expired subscription  
  element :merchant_notice, "div#merchant-notice"
  element :cancel_subscription, "span.cancel-image"
  element :normal_price_block, "div#merchant-notice div.options span.normal_block"
  element :premium_price_block,"div#merchant-notice div.options span.premium_block"
  element :error_image, "div#merchant-notice div.merchant_welcome div.info span.error-img"
  element :subscription_info_warning, "div#merchant-notice div.merchant_welcome div.info"

  def submit_promo_form
    submit_promo_button.click
  end
  
  def populate_promo(data = {})
    populate_form(data_for("merchant_details/merchant_promo_details").merge(data))
    set_dates
    fill_promo_description
  end
   
  def set_dates
    coupon_start_date.set(Date.today)
    coupon_end_date.set(Date.today + 1)
  end 

  def fill_promo_description
    page.driver.browser.switch_to.frame "discount_coupon_description_ifr"
    execute_script("document.getElementById('tinymce').innerHTML = '<p>You can get two deals with one......</p>';")
    page.driver.browser.switch_to.default_content
  end

  def partial_populate_promo(data = {})
    data = data_for("merchant_details/merchant_promo_details").merge(data)    
    populate_form data
  end
  
  def subscription_info?
    has_merchant_notice? && (merchant_notice.text != "")
  end

  def price_blocks?
    has_normal_price_block? && has_premium_price_block?
  end

end