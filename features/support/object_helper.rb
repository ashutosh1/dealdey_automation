class DealDey

  def user_login_page
    UserLoginPage.new
  end

  def user_shared_page
    UserSharedPage.new
  end

  def user_subscription_popup
    UserSubscriptionPopup.new
  end

  def user_signup_page
    UserSignupPage.new
  end

  def user_search_page
    UserSearchPage.new
  end

  def user_forget_password_page
    UserForgetPasswordPage.new
  end

  def user_footer_link_page
    UserFooterLinkPage.new
  end

  def user_account_page
    UserAccountPage.new
  end

  def user_cart_page
    UserCartPage.new
  end

  def user_deal_detail_page
    UserDealDetailPage.new
  end

  def user_checkout_page
    UserCheckoutPage.new
  end

  #Object of Merchant class
  def merchant_signup_page
    MerchantSignupPage.new
  end
  
  def merchant_home_page
    MerchantHomePage.new 
  end

  def merchant_account_page
    MerchantAccountPage.new 
  end

  def merchant_contact_and_faq_page
    MerchantContactAndFaqPage.new
  end


  
  def admin_checkout_page
    Admin::CheckoutPage.new
  end

  def admin_cart_page
    Admin::CartPage.new
  end

  def admin_shared_page
    Admin::SharedPage.new
  end

  def admin_login_page
    Admin::LoginPage.new
  end


end
