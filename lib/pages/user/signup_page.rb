 class UserSignupPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  DEFAULT_ATTR = ["Firstname", "Lastname", "Email", "Mobile", "Gender","Age bracket", "Password"]

  element :firstname, "#user_firstname"
  element :lastname, "#user_lastname"
  element :email, "#user_email"
  element :mobile, "#user_mobile"
  element :password, "#user_password"
  element :password_confirmation, "#user_password_confirmation"
  
  element :gender,"#user_gender", visible: false
  element :age_bracket, "#user_age_bracket", visible: false
  element :register, "form#new_user li.register span input.uppercase"
  
  element :fb_login, ".signinBtnFB"
  element :sign_up_link, "div.header-right ul.header-links li.signup a"
  element :already_registered, "div#new_member_register_bottom span.already a"

  def sign_up
    register.click
  end

  def populate_user(data = {})
    populate_form(data_for("users/user_info_for_signup").merge(data))
    gender.find('option:nth-child(2)').select_option
    age_bracket.find('option:nth-child(2)').select_option
    sign_up
  end

end
  