class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:show, :add_pomodoro]

  def show
  end

  def index
    @users = User.all
  end

  def add_pomodoro
    @pom = Pomodoras.new
    @user.pomodorass << @pom
    @pom.status = "busy"
    redirect_to users_path
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to users_path unless @user == current_user
  end

end
