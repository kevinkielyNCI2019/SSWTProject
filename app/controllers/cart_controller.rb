class CartController < ApplicationController
  
  #start of add to cart logic
  
  before_action :authenticate_user!
  
  
  def add
    # get the Id of the product
    id = params[:id]
    
   # if the cart is already been created, use existing cart else create a blank cart
  if session[:cart] then
    cart = session[:cart]
  else
    session[:cart] = {}
    cart = session[:cart]
  end
  #If the product is already added it increments by 1 or else product set to 1
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end  
  
    redirect_to :action => :index
  
  end
  
  
########## CLEAR THE CART ##############

def clearCart
  #### this sets the cart session to not exist
  session[:cart] = nil
  redirect_to :action => :index
  
  
end

####### start of remove item from cart logic ###########

def remove
  
  id = params[:id]
  cart = session[:cart]  
  cart.delete id
  redirect_to :action => :index
  
end



 
#### start of index logic
  
  def index
    # passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end  
  end
  
##### increase the cart quantity
  
  def increase
    id = params[:id]
    cart = session[:cart]  
    
    if cart[id] == 0 then
      cart.delete id
    else
    cart[id] = cart[id] + 1
    end
    
    redirect_to :action => :index
    
  end
  
  
  ##### decrease the cart quantity
  
  def decrease
    id = params[:id]
    cart = session[:cart]  
    
    if cart[id] == 1 then
      cart.delete id
    else
    cart[id] = cart[id] - 1
    end
    
    redirect_to :action => :index
    
  end
  
  ### create a new order ###
  
  def createOrder
       # Step 1: Get the current user
       @user = User.find(current_user.id)
      
       # Step 2: Create a new order and associate it with the current user
       @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
       @order.save
      
       # Step 3: For each item in the cart, create a new item on the order!!
       @cart = session[:cart] || {} # Get the content of the Cart
       @cart.each do | id, quantity |
       item = Item.find_by_id(id)
       @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.albumtitle, :description => item.albumdesc, :quantity => quantity, :price=> item.albumprice)
       @orderitem.save
       end
       
       @orders = Order.all
    
    
    @orderitems = Orderitem.where(order_id: Order.last)
    
    session[:cart] = nil
       
       
  end
  
end
