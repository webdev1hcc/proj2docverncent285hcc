# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def login
    if params[:user] == nil
      username = password = ""
    else
      username = params[:user][:username]
      password = params[:user][:password]
    end
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" +
      username + "','" + password + "')").to_i
    if username == "guest" && password == "guest"
      cookies.signed[:user_id] = -1
      redirect_to :controller => "user_suggestions", :action=> "index"
    end
  end

  def logout
  end

end
