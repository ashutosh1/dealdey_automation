class MerchantSignupPage < SitePrism::Page
  include AjaxHelper
  include FormHelper
  
  DEFAULT_ATTR = ["Business name", "Location", "Phone", "Email", "Category", "Contact person", "Business description"]
  
  element :upload_a_promo, "div.header-right ul.header-links li.merchant a"
  element :sign_up, "span.signin a.signup"
  element :sign_in_link, "span.signin a.signin_link"
  
  #merchant sign in form
  element :merchant_sign_in_div, "div#merchant_sign_in_popup"
  element :merchant_signin_form, 'form#new_merchant'
  element :merchant_email, "form#new_merchant input#merchant_email"
  element :merchant_password, "form#new_merchant input#merchant_password"
  element :sign_in, "form#new_merchant span.main-button-orange input"

  #merchant sign up form
  element :merchant_signup_form, "form#merchant-contact-register-form"
  element :phone, "form#merchant-contact-register-form input#merchant_phone"
  element :email, "form#merchant-contact-register-form input#merchant_email"
  element :location, "form#merchant-contact-register-form input#merchant_location"
  element :category, "form#merchant-contact-register-form #merchant_category", visible: false
  element :business_name, "form#merchant-contact-register-form #merchant_business_name"
  element :contact_person, "form#merchant-contact-register-form #merchant_contact_person"
  element :business_description, "form#merchant-contact-register-form #merchant_business_description"
  element :signup_button, "div.button span.main-button-orange input"

  #radio buttons
  element :offer_deal, "form#merchant-contact-register-form #merchant_offer_deal_true"
  element :offer_promo, "form#merchant-contact-register-form #merchant_offer_deal_false"

  #if offer promo
  element :website, "#merchant_website"
  element :logo_file, "#merchant_logo"

  #if offer deal
  element :deal_price, "#merchant_deal_price"
  element :deal_discount, "#merchant_deal_discount"
  element :deal_description, "#merchant_deal_description"

  #merchant forget password
  element :forget_password_div, "div.merchantForgotPassword"
  element :user_email_for_resend, "div.merchantForgotPassword #merchant_email"  
  element :resend_password_instruction , "div.merchantForgotPassword form#new_merchant ul li span.btnGreen span.main-button-orange input"
  
  def merchant_password=(value)
    execute_script("document.getElementById('merchant_password').value = '#{value}';")
  end
  
  def populate_merchant_signin_form(data = {})
    populate_form data_for("merchant_details/merchant_signin_credential").merge(data)
    sign_in.click
  end

  def submit_signup_form
    signup_button.click
  end

  def signin_and_signup_links?
	  has_sign_up? && has_sign_in_link?
  end

	def populate_merchant(data = {})
    data = data_for("merchant_details/first").merge(data)
    populate_form(data)
    category.find("option:nth-child(2)").select_option
  end

  def forget_password_page?
    has_forget_password_div? && has_user_email_for_resend?
  end
  
  def sign_in_merchant(valid_or_invalid_subscription=nil)
    merchant = valid_or_invalid_subscription.nil? ? "merchant_with_valid_subscription" : valid_or_invalid_subscription
    populate_form(data_for("merchant_details/#{merchant}"))
    sign_in.click
  end

end