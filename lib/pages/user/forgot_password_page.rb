class UserForgetPasswordPage < SitePrism::Page

  element :forget_password_div, "div.forgotPassword"
  element :user_email_for_resend, "div.forgotPassword form#new_user ul li input#user_email"
  element :resend_password_instruction, "div.forgotPassword form#new_user ul li span.btnGreen input.submit"
  
  def submit_resend_password_form(email)
    user_email_for_resend.set(email)
    resend_password_instruction.click
  end

end

