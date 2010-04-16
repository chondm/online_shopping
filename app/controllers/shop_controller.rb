class ShopController < ApplicationController
  
  include MinimalCart::ShoppingCart
  #mininal_cart
  layout 'shop'
  PER_PAGE = 10
  
  def index
    page = (params[:page] || 1)
    @product_lists = Item.item_lists(page, PER_PAGE)
    @shopping_cart = session[:shopping_cart]  
  end

  #------------------------------------------------------
  # Method name : add_to_cart
  # Input : product_id
  # Output : N/A
  # Date created : April 14, 2010
  # Developer: ChonDM
  # Description : Add item into shopping cart
  #------------------------------------------------------
  def add_to_cart
    product_id = params[:id]
    add_cart(product_id.to_i)
    shopping_cart = session[:shopping_cart]
    render :partial => "shopping_cart", :locals =>{:carts => shopping_cart}
  end
end
