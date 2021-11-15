class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = CartItem.where(customer_id:current_customer)
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @old_cart_item = CartItem.find_by(item:@cart_item.item)
    if @old_cart_item.present? and @cart_item.valid?
      @cart_item.count += @old_cart_item.count
      @old_cart_item.destroy
    end
    if @cart_item.save
      redirect_to cart_items_path
    else
      render 'items/show'
    end
  end

  def update

  end

  def destroy
  end

  def all_destroy
  end

private

  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

end
