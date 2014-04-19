class UserDealDetailPage < SitePrism::Page
  include UrlHelper
  include AjaxHelper
  #On detail page of non fashion deals
  element :buy_product, "a.buyNow.button"
  element :add_to_cart, "div.buy-now a.addToCart"

  #On detail page of fashion deals
  element :buy_now_link, "a.addToCart.button"
  element :cart_item_quantity, "#cart_item_quantity", visible: false

  element :available_for_emi, "p.emi_option"

  def add_deal_to_cart
    has_buy_product? ? add_to_cart_and_buy : buy_now_link.click
  end

  def add_to_cart_and_buy
    buy_product.click
    # wait_for_add_to_cart
    # add_to_cart.click
  end
  
  def visit_deals(deal)
    url_to_visit(deal.downcase.split.join("_"))
  end

  def select_quantity
    cart_item_quantity.find("option:nth-child(2)").select_option
  end
  
  def add_option_to_select(limit)
    sleep(10)
    p "aaaaaaaaaaaaaaaaaa"
    execute_script("var x = document.getElementById('cart_item_quantity');
    var option = document.createElement('option');
    option.text = '#{limit + 1}';
    x.add(option);")
    sleep(20)
  end

  def select_extra_option_and_add(limit)
    wait_for_cart_item_quantity
    p data_for("deals_data/shared")[limit]
    add_option_to_select(data_for("deals_data/shared")[limit])
    p cart_item_quantity.find("option:nth-child(2)")
    p cart_item_quantity.find("option")
    p cart_item_quantity.find("option").count
  end

end