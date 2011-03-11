class UsersController < ApplicationController
  def new
  end

  def create
    name = params[:user][:name]
    username = params[:user][:username]
    password = params[:user][:password]
    conn = ActiveRecord::Base.connection
    sql = "insert into users_view (name,username,password,div,dept) " +
      "values ('" + name + "','" + username + "','" +
      password + "','" + div + "','" + dept + "')"
    conn.insert(sql)
    redirect_to : controller => "users", :action => "index"
  end
  
  def edit
  end

  def index
    @users = User.all
  end
  
  def chooseUser
    @users = User.all
  end

end
