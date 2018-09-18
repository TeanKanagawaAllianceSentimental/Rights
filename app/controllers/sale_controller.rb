class SaleController < ApplicationController

  # def cart # ここのアクション名をどうするか、これでいいのか。modelで指定するか
  #   @sales = Sales.members.carts.items.find(session[:member_id])
  #   @sub_total = @sales.unit_price * 
  #   @total_price = 
  # end

  def select_address
    @member = Member.find(session[:menber_id])
    @addresses = Sales_Shipping.where(params[:member_id])
  end

  def add_address
    @address = Shipping_Addresses.new
  end


end


# def add_good(good_id)

#     current_item = line_items.find_by_good_id(good_id)

#     if current_item
#       current_item.quantity += 1
#     else
#       current_item = line_items.build(good_id: good_id)
#     end
#     current_item

#   end

   # def add_to_cart
   #   p = Product.find(params[:id])
   #   (session[:cart] || = []) << p.id
   #   session[:price] || = 0
   #   session[:price] += p.price
   #   flash[:notice] = "#{p.name}をカートに追加しました。"
   #   redirect_to store_products_path
   # end
