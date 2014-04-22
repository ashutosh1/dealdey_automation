# class MerchantAccountPage
#   include PageObject

#   MERCHANT_PASS_ATTR = ["Current password", "Password"]
#   MERCHANT_PROFILE_ATTR = ["Business name", "Location", "Phone", "Contact person", "Business description"]

#   link(:password_tab, :text => 'Password')
#   link(:my_subscription_tab, :text => 'My Subscription')

#   #password tab
#   text_field(:current_password, :id => "merchant_current_password")
#   text_field(:new_password) do|page|
#     page.div_element(:id => "update_password").when_visible.text_field_element(:id => "merchant_password")
#   end
#   text_field(:confirm_password, :id => "merchant_password_confirmation")

#   #my subscription tab
#   link(:proceed_to_payment, :text => 'Proceed To Payment')
#   div(:merchant_welcome, :class => 'merchant_welcome')
#   span(:premium_block, :class => 'premium_block')
#   span(:normal_block, :class => 'normal_block')

#   #profile tab
#   form(:edit_profile_form, :class => "edit_merchant") 
#   text_field(:phone, :id => "merchant_phone")
#   text_field(:merchant_email) do|page|
#     page.div_element(:id => "update_profile").text_field_element(:id => "merchant_email")
#   end 
#   text_field(:location, :id => "merchant_location")
#   select_list(:category, :id => "merchant_category")
#   text_field(:business_name, :id => "merchant_business_name")
#   text_field(:contact_person, :id => "merchant_contact_person")
#   text_field(:website, :id => "merchant_website")
#   text_area(:business_description, :id => "merchant_business_description")  
#   file_field(:logo_file, :id => 'merchant_logo')
  
#   def reset_updated_password
#     populate_page_with data_for("merchant_details/reset_merchant_password")
#     save_password
#   end

#   def fill_and_save_password_field(data = {})
#     populate_page_with data_for("merchant_details/change_merchant_password").merge(data)
#     save_password
#   end

#   def save_password
#     @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[2]/form/ul/li[4]/span/span/input").click
#   end
  
#   def subscription_section?
#     proceed_to_payment? && merchant_welcome?
#   end

#   def multiple_subscription_offer?
#     premium_block? && normal_block?
#   end

#   def save_profile
#     @browser.find_element(:class => "savebut").click
#   end

#   def populate_merchant_profile(data = {})
#     populate_page_with data_for("merchant_details/first").merge(data)
#     category_element[2].click
#     save_profile
#   end

# end  
#   