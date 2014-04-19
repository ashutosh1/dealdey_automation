class UserSubscriptionPopup < SitePrism::Page
  include AjaxHelper
  
  element :subscription_popup, "div#new_city_select"
  element :subscription_email, "input#email_subscription_email"
  element :select_state, "#email_subscription_state_id", visible: false
  element :signup, "div#new_city_select span.sign_up input.submit.button"
  element :already_registered, "div#new_city_select div.main-section div.first span.already a"
  element :close_subscription, '.no-subscription'
  
  element :subscription_notice, "div.layout-wrapper div.accountPage.confirm_page div.image h2"

  def register
    signup.click
    wait_for_ajax
  end

  def subscription_form?
    has_subscription_popup? && has_subscription_email? && has_select_state?
  end

  def already_registered_link?(link)
    has_already_registered? && (already_registered.text == link)
  end

end
