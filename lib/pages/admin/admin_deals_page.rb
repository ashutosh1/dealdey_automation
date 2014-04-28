class AdminDealsPage < SitePrism::Page
  include AjaxHelper

  element :new_product_deal, "div.deal_links span.headerLinks a", :text => "New Product Deal"
  element :new_service_deal, "div.deal_links span.headerLinks a", :text => "New Service Deal"
end