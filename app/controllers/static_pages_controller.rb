class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end
  
  def paid
    
    
    @order = Order.find_by(id: params[:id])
    @order.update_attribute(:status, "Paid by User: #{current_user.email}")
    
  end
end
