# app/models/user_suggestion.rb
class UserSuggestion < ActiveRecord::Base
  set_table_name "user_suggestions_view"
  
  def makeOption
    name + "|" + department + "|" + division + "|" + 
    suggestion_text[0..200]
  end
end
