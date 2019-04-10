class UserController < ApplicationController
    
    def login
        
        session[:login] = 1
        flash[:notice] = "Logged in, welcome!"
        redirect_to :controller => :items
        
        
    end
    
    def logout
        
        session[:login] = nil
        flash[:notice] = "See you later alligator!"
        redirect_to :controller => :items
        
        
    end
    
    
end
