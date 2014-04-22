# class MerchantContactAndFaqPage < SitePrism::Page
#   include AjaxHelper
  
#   element :cart_header, "table tr#cart-header"


#   link(:contact, :text => "Contact")
#   link(:faq, :text => "FAQ")
#   link(:help_email, :text => "help@dealdey.com")
#   link(:advertise_email, :text => "advertise@dealdey.com")
#   link(:premium_slider, :class => "premium_slider")
  
#   image(:office_building) do|page|
#     page.div_element(:class => "rightbar").image_element(:src => "/assets/web/office_building.jpg")
#   end
#   image(:abuja_office_building) do|page|
#     page.div_element(:class => "rightbar").image_element(:src => "/assets/web/abuja-office.jpg")
#   end
  
#   div(:dealdey_lagos_office_map ,:id => "dealdey-map-canvas")
#   div(:dealdey_abuja_office_map ,:id => "dealdey-branch-office-map-canvas")
#   div(:faq_page_title) do|page|
#     page.div_element(:id => "faq_wrapper").div_element(:class => "title")
#   end
  
# end