class AdminLandingPage < SitePrism::Page
  include AjaxHelper

  element :deals ,"div#main-navigation a[href='/admin/deals']"
  element :orders ,"div#main-navigation a[href='/admin/orders?filter=&shipping_status=&type=paid']"
  
end