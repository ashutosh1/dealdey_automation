class DealDey
  USER_PAGES = ["UserLoginPage", "UserSharedPage", "UserSubscriptionPopup", "UserSignupPage", "UserSearchPage", "UserForgetPasswordPage", "UserFooterLinkPage", "UserAccountPage", "UserCartPage", "UserDealDetailPage", "UserCheckoutPage"]
  MERCHANT_PAGES = ["MerchantSignupPage", "MerchantHomePage", "MerchantAccountPage","MerchantContactAndFaqPage"]
  ADMIN_PAGES = ["AdminLandingPage", "AdminLoginPage", "AdminDealsPage", "AdminNewProductDealPage","AdminCartPage", "AdminCheckoutPage", "AdminOrdersPage"]
  
  (USER_PAGES + MERCHANT_PAGES + ADMIN_PAGES).each do |meth|
    define_method(meth.underscore){Object.const_get(meth).new}
    # define_method(meth.underscore) do 
    #   var = instance_variable_get("@#{meth.underscore}")
    #   return var if var
    #   instance_variable_set("@#{meth.underscore}", Object.const_get(meth).new)
    # end  
  end

end