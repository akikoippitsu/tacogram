class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user == nil
      flash["notice"] = "No user with that email found."
      redirect_to "/login"
    else
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome back, #{@user["first_name"]}!"
        redirect_to "/posts"
      else
        flash["notice"] = "Incorrect password."
        redirect_to "/login"
      end
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Logged out."
    redirect_to "/login"
  end
end
