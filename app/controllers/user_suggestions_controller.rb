# app/controllers/user_suggestions_controller.rb
class UserSuggestionsController < ApplicationController
  def index
    if params[:order] == nil
      @usersuggestions = UserSuggestion.all
    else
      @usersuggestions = UserSuggestion.all(:order => params[:order])
    end
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
  
  def edit
    suggid = params[:suggestion][:suggestion]
    @suggestion = UserSuggestion.find_by_suggid(suggid)
  end
  
  def update
    id = params[:user_suggestion][:suggid]
    s_text = params[:user_suggestion][:suggestion_text]
    suggestion = Suggestion.find_by_id(id)
    suggestion.update_attributes(:suggestion_text => s_text)
    redirect_to :controller=>"user_suggestions", :action => "index"
  end
end
