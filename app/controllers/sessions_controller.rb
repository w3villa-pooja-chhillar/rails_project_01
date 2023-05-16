class SessionsController < ApplicationController
     def new
     end

     def create
       user = User.find_by(email: params[:session][:email].downcase) 
       if user && user.authenticate(params[:session][:password])
       session[:id] = user.id
        flash[:notice]= "Logged in Successfully"
        redirect_to user
       else
        flash[:now] = "There is something wrong with your login details"
        render :new,  status: :unprocessable_entity
     end
    end

     def destroy
        session[:id] = nil
        flash[:notice]= " Logged out"
        redirect_to root_path
     end
    end