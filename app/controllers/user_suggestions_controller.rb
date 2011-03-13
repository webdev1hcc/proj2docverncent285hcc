# app/controllers/user_suggestions_controller.rb
class UserSuggestionsController < ApplicationController
  def index
    @usersuggestions = UserSuggestion.all
  end
  
  def create
    user_id = cookies.signed[:user_id]
    s_text = params[:suggestion][:s_text]
    s_text = s_text.gsub(/'/,"''") # to escape quotes
    conn = ActiveRecord::Base.connection
    conn.select_value("select insertSuggestion(" +
      user_id.to_s + ",'" + s_text + "')")
    redirect_to :controller => "user_suggestions",
      :action => "index"
  end
  
  def chooseSuggestion
    user = User.find(cookies.signed[:user_id])
    div = user.division
    dept = user.department
    if div == dept
      @usersuggestions = UserSuggestion.find_all_by_division(div)
    else
      @usersuggestions = UserSuggestion.find_all_by_department(dept)
    end
  end
end
