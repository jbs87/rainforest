class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
    respond_to do |format|
     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      format.html { redirect_to products_path, notice: "Logged in!"}
      format.js
    else
      flash.now[:alert] = "Invalid email or password"
      format.html { render :new }
      format.js
    end
  end
end

def destroy
 session[:user_id] = nil
 redirect_to products_path, notice: "Logged out!"
end
end
