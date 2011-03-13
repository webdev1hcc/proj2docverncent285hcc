# app/controllers/user_suggestions_controller.rb
class UserSuggestionsController < ApplicationController
  def index
    @usersuggestions = UserSuggestion.all
  end
end
