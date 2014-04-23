class MerchantAccountPage < SitePrism::Page
  include AjaxHelper
  include FormHelper

  MERCHANT_PASS_ATTR = ["Current password", "Password"]
  DEFAULT_ATTR = ["Business name", "Location", "Phone", "Contact person", "Business description"]

  element :password_tab, "div#tabs ul.tab li:nth-child(2) a", :text => "Password"
  element :my_subscription_tab, "div#tabs ul.tab li:nth-child(3) a", :text => "My Subscription"

  #password tab section
  element :reset_password_form, "div#update_password form#edit_merchant"
  element :current_password, "div#update_password form#edit_merchant ul li input#merchant_current_password"
  element :new_password, "div#update_password form#edit_merchant ul li input#merchant_password"
  element :confirm_password, "div#update_password form#edit_merchant ul li input#merchant_password_confirmation"
  element :reset_password_button, "div#update_password form#edit_merchant ul li span.btnGreen span.main-button-orange input"

  #my subscription tab section
  element :subscription_div, "div#subscribe"
  element :proceed_to_payment, "div.proceed_button span.main-button-orange-arrow a"
  element :normal_price_block, "div#merchant-notice div.options span.normal_block"
  element :premium_price_block,"div#merchant-notice div.options span.premium_block"

  #profile tab section
  element :edit_profile_form, "div#update_profile form.edit_merchant"
  element :phone, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_phone"
  element :merchant_email, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_email"
  element :location, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_location"
  element :business_name, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_business_name"
  element :contact_person, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_contact_person"
  element :website, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_website"
  element :business_description, "div#update_profile form.edit_merchant ul li span.form-right input#merchant_business_description"
  element :category, "div#update_profile form.edit_merchant ul li span.form-right #merchant_category", visible: false    
  element :logo_file, "div#update_profile form.edit_merchant ul li span.form-right #merchant_logo"
  element :save_profile_button, "div#update_profile form.edit_merchant ul li.right.group.wat-cf.column input"

  def reset_updated_password
    populate_form(data_for("merchant_details/reset_merchant_password"))
    submit_form
  end

  def fill_and_save_password_field(data = {})
    populate_form(data_for("merchant_details/change_merchant_password").merge(data))
    submit_form
  end
  
  def subscription_section?
    has_subscription_div? && has_proceed_to_payment? && multiple_subscription_offer?
  end

  def multiple_subscription_offer?
    has_premium_price_block? && has_normal_price_block?
  end

  def populate_merchant_profile(data = {})
    populate_form(data_for("merchant_details/first").merge(data))
    category.find("option:nth-child(2)").select_option
    submit_form
  end

  def submit_form
    has_reset_password_button? ? reset_password_button.click : save_profile_button.click
  end
  
  def has_edit_profile_form_attr?
    has_phone? && has_merchant_email? && has_contact_person? && has_business_name? && has_category?
  end
end  
  