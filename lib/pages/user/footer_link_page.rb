class UserFooterLinkPage < SitePrism::Page
  
  element :toi_dealdey,"div#footer div.footer-top a", :text => "Times of India for DealDeyy"
  element :dealdeyholic_blog_image, "div#page div.header_top .header-image"
  element :conditions_policy, "div#footer div.footer-top a[href='/delivery_return_refund_and_cancellation_policy']"
  element :call_footer, "div.call-footer"
  element :footer_div, "div#footer"

  PAYMENT_OPTIONS = ["mastercard", "visa", "verve", "gtb", "zenith", "access", "paga", "rencredit", "pod"]
  KNOW_LINKS = ["About Us", "Contact Us", "FAQ", "How It Works", "The DealDeyholic Blog", "Careers"]
  SOCIAL_LINKS = ["gplus-link", "pinterest-link", "twitter-link", "fb-link"]
  EXPLORE_LINKS = ["Terms Of Use", "Privacy Policy", "Upload a Promo"]
  
  PAYMENT_OPTIONS.each do |pay_option|
    element pay_option.to_sym, "div#footer div.footer-top div.#{pay_option}"
  end

  KNOW_LINKS.each do |foot_link|
    element foot_link.downcase.split.join("_").to_sym, "div#footer div.footer-top div.block.know ul li a", :text => foot_link
  end

  SOCIAL_LINKS.each do |social_link|
    element social_link.gsub("-","_").to_sym, "div#footer div.footer-bottom div.right div.follow a.#{social_link}"
  end

  EXPLORE_LINKS.each do |foot_link|
    element foot_link.downcase.split.join("_").to_sym, "div#footer div.footer-top div.block.explore-main ul li a", :text => foot_link
  end
  
end
