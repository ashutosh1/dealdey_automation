class UserAccountPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  DEFAULT_ATTR = ["Name", "Address line", "State", "Area"]
  #user account dropdown links
  element :account, "div.header-right ul.header-links li.user a.dropdown"
  element :user_account, "div.header-right ul.header-links li.user"
  element :settings, "div.header-right ul.header-links ul#dropdown_detail li a.settings"
  
  #tabs on account page
  element :address_tab, "div#tabs ul.tab li#address-tab a"
  element :password_tab, "div#tabs ul.tab li a", :text => "Password"
  element :profile_tab, "div#tabs ul.tab li a", :text => "Profile"

  #profile tab
  element :profile_form, "form.edit_user"
  element :firstname, "form.edit_user input#user_firstname"
  element :lastname, "form.edit_user input#user_lastname"
  element :mobile, "form.edit_user input#user_mobile"
  element :gender, "form.edit_user #user_gender", visible: false
  element :age, "form.edit_user #user_age_bracket", visible: false
  element :profession, "form.edit_user #user_profession", visible: false
  element :salary, "form.edit_user #user_salary_bracket", visible: false
  element :save_changes, "form.edit_user input.submit.savebut"
    
  #address tab
  element :shipping_address_form, "form.new_shipping_address", visible: true
  element :shipping_address_name, "form.new_shipping_address #shipping_address_name", visible: true
  element :address_line, "form.new_shipping_address #shipping_address_address_line", visible: true
  element :address_landmark, "form.new_shipping_address #shipping_address_landmark", visible: true
  element :state, "form.new_shipping_address #shipping_address_state", visible: false
  element :area, "form.new_shipping_address #area_list", visible: false
  element :save_shipping_address, "form.new_shipping_address button.button.savebut"
  elements :edit, "div#user-shipping-addresses .edit"
  elements :delete, "div#user-shipping-addresses a", :text => "Delete"
  element :edit_address_name, "div.address_form form.edit_shipping_address input#shipping_address_name"
  element :save_updated_address, "div.address_form form.edit_shipping_address .savebut"
    
  #password update
  element :current_password, "form.edit_user input#user_current_password" 
  element :new_password, "form.edit_user input#user_password" 
  element :confirm_password, "form.edit_user input#user_password_confirmation" 

  #newsletter section
  element :news_letter_form, "form#manage_subscription_form"
  element :select_none, "form#manage_subscription_form a.select_none"
  elements :news_letter_checkbox, "form#manage_subscription_form input#state_ids_"
  element :save_news_letter_changes, "form#manage_subscription_form input.submit.savebut"
  
  def save_address
    save_shipping_address.click
  end

  def save_news_letter
    save_news_letter_changes.click
  end

  def click_on_save
    save_changes.click
  end

  def update_profile
    populate_form(data_for("users/user_update_data"))
    select_data_form_select_list(2, "gender", "age")
    click_on_save
  end
  
  def populate_user_profile(data = {}, pass_attr)
    populate_form(data_for("users/user_update_data").merge(data))
    click_on_save
  end

  def checkboxes_unchecked?
    news_letter_checkbox.map{|chk_box| return false if chk_box.checked?}
    return true
  end

  def add_new_address
    populate_form(data_for("address/new_shipping_address"))
    select_data_form_select_list(2, "state", "area")
    save_address
  end

  def update_address
    edit_address_name.set(data_for("address/update_shipping_address")["shipping_address_name"])
    wait_for_save_updated_address
    save_updated_address.click
  end

  def reset_update_password
    populate_form(data_for("users/reset_user_password"))
    click_on_save
  end

  def fill_and_save_password_field(data = {})
    populate_form(data_for("users/change_user_password").merge(data))
    click_on_save
  end

  def select_data_form_select_list(child_num, *arg)
    arg.each do |meth|
      send(meth).find("option:nth-child(#{child_num.to_i})").select_option
      wait_for_ajax if meth == "state"
    end
  end
  
end