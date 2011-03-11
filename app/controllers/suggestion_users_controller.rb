# app/controllers/suggestion_users_controller.rb
class SuggestionUsersController < ApplicationController
  def index
    @suggestionuser = UserSuggestion.all
  end
  def new
  end

  def create
    body = params[:suggestion_users][:body]
    conn = ActiveRecord::Base.connection
    sql= "insert into all_view (userid, body) values (" + cookies.signed[:user_id].to_s + ",'" + body +"')"
    conn.insert(sql)
    redirect_to :controller => "suggestion_users", :action => "index"
  end
  def chooseSuggestion
    user = User.find(cookies.signed[:user_id])
    div = user['div']
    dept = user['dept']
    if div == dept 
      @suggestionuser = UserSuggestion.find_all_by_div(div)
    else
      @suggestionuser = UserSuggestion.find_all_by_dept(dept)
    end  
  end
  def edit
    @suggestionuser = UserSuggestion.find_by_sid(params[:id])
  end 
  
  def update
    body = params[:user_suggestion][:body]
    sid = params[:user_suggestion][:sid]
    suggestion = Suggestion.find(sid)
    suggestion.update_attributes(:body => body)
    redirect_to :controller => "suggestion_users", :action => "index"
  end
end
