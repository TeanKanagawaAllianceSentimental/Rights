class SaleController < ApplicationController

  # def cart # ここのアクション名をどうするか、これでいいのか。modelで指定するか
  #   @sales = Sales.members.carts.items.find(session[:member_id])
  #   @sub_total = @sales.unit_price * 
  #   @total_price = 
  # end

  def index #　購入一覧(マイページ)
    
  end

  def create # 購入するボタン
    @sale_item.sale_invoice_id
    redirect_to
  end

  def show # カートの中身
    @member = Member.find(session[:menber_id])
    @addresses = Sales_Shipping.where(params[:member_id])
    @sale = Sale.find(params[:id])
    @address = Shipping_Address.new
  end

  def edit # 購入内容の確認
    @member = Member.find(session[:member_id])
    @credit = @member.sale.find(params[:credit_card_id])
    @invoice = @member.sale.find(params[:sale_invoice_id])
    @sale_item = SaleItem.new
    @items = @member.cart.where(params[:item_id])
  end

  def update # 一連の購入手続き
    
  end




  

private
    def shipping_address_params
      params.require(:shipping_addresses).permit(:shipping_postal_code, :shipping_address1, :shipping_address2, :organisation_name, :department, :contact_person, :user_telephone)
    end

    def select_address_params
      params.require(:sales).permit(:shipping_address_id)
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
