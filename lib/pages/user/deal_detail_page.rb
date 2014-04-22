class UserDealDetailPage < SitePrism::Page
  include UrlHelper
  include AjaxHelper
  #On detail page of non fashion deals
  element :buy_product, "a.buyNow.button"
  element :add_to_cart, "div.buy-now a.addToCart"

  #On detail page of fashion deals
  element :buy_now_link, "a.addToCart.button"
  element :cart_item_quantity, "#cart_item_quantity", visible: false
    
  #for service deals only
  element :deal_location_map, "div.gmap"
  
  element :available_for_emi, "p.emi_option"
  element :deal_detail_div, "div.deal-detail"
  element :state_select_div, "div.state-select"
  element :cod_option, 'p.cod-option a#view-cod-areas'

  def add_deal_to_cart
    has_buy_product? ? add_to_cart_and_buy : buy_now_link.click
  end

  def add_to_cart_and_buy
    service = service_deal?
    buy_product.click
    unless service
      wait_for_add_to_cart
      add_to_cart.click
    end
  end
  
  def service_deal?
    has_deal_location_map?
  end

  def visit_deals(deal)
    url_to_visit(deal.downcase.split.join("_"))
  end

  def select_quantity(num=nil)
    if num.nil?
      cart_item_quantity.find("option:nth-child(2)").select_option
    else
      cart_item_quantity.find("option:nth-child(#{num.to_i})").select_option
    end
  end
  
  def add_option_to_select(limit)
    execute_script("var x = document.getElementById('cart_item_quantity');
    var option = document.createElement('option');
    option.text = '#{limit + 1}';
    x.add(option);")
  end

  def select_extra_option_and_add(limit)
    wait_for_cart_item_quantity
    max_limit = data_for("deals_data/shared")[limit]
    add_option_to_select(max_limit)
    cart_item_quantity.find(:option, max_limit+1).select_option
  end

end