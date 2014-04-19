class UserLoginPage < SitePrism::Page
  include FormHelper
  include AjaxHelper
  
  element :email, "#sign_in_email"
  element :password, "#sign_in_password"
  element :forget_password_link, "a.forgotPWD"
  element :sign_in_link, "div.header-right ul.header-links li.signin a"
  element :sign_in_popup, "#signin_popup_form"
  element :sign_in_button, "div#signin_popup_form form#log_in_form li span.main-button-orange input.submit"

  def password=(value)
    execute_script("document.getElementById('sign_in_password').value = '#{value}';")
  end
 
  def sign_in
    sign_in_button.click
  end

  def signed_in_user
    sign_in_link.click
    populate_signin_form
  end

  def populate_signin_form(data={})
    populate_form(data_for("users/admin_first").merge(data))
    sign_in
    wait_for_ajax
  end

end
