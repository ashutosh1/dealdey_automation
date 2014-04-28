class AdminLandingPage < SitePrism::Page
  include AjaxHelper

  element :deals ,"div#main-navigation a[href='/admin/deals']"
  
end