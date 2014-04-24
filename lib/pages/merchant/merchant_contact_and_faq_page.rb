class MerchantContactAndFaqPage < SitePrism::Page
  include AjaxHelper
  
  element :contact, "ul.head-navbar li a", :text => "Contact" 
  element :faq, "ul.head-navbar li a", :text => "FAQ"

  element :help_email, "a", :text => "help@dealdey.com"
  element :advertise_email, "a", :text => "advertise@dealdey.com"
   
  elements :office_buildings , "div.rightbar div.roundedBox.map p.office_building img"
  element :dealdey_lagos_office_map , "div#dealdey-map-canvas"
  element :dealdey_abuja_office_map , "div#dealdey-branch-office-map-canvas"
  
  element :faq_page_title, "div#faq_wrapper div.title"
  element :premium_slider, "ul.merchant_faq li img.premium_slider"
  
  def branch_and_head_office_image?
    has_office_buildings? && office_buildings.size > 1
  end

end