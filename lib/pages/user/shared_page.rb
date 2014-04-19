class UserSharedPage < SitePrism::Page
  include InlineErrorHelper
  element :flash, "div#flash div.message p"
  elements :inline_error_messages, "p.errorMsg"
  elements :error_messages, ".alert"
  
  def wait_default(time=nil)
    if time.nil?
      sleep(5)
    else
      sleep(time)
    end
  end
end