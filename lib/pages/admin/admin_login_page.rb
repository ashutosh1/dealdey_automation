class AdminLoginPage < SitePrism::Page
  include FormHelper
  include AjaxHelper

  element :login_form ,"div#box div.content.login form#new_account"
  element :email ,"div#box div.content.login form#new_account input#account_email"
  element :password ,"div#box div.content.login form#new_account input#account_password"
  element :login_button ,"div#box div.content.login form#new_account button.button"

  def populate_and_submit_form(data={})
    populate_form(data_for("users/admin_first").merge(data))
    login_button.click
  end


end