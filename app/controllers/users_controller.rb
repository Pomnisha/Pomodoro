class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:add_pomodoro, :del_pomodoro]
  before_filter :correct_user, :only => [:add_pomodoro, :del_pomodoro]

  def show
  end

  def index
    @users = User.all
  end

  def add_pomodoro
    @st = params[:status]
    redirect_to users_path and return unless %("red", "yellow").include?(@st)
    @pom = Pomodoras.new
    @pom.status = @st
    @pom.end_at = Time.now + @user.pomodoro_length.minutes
    @user.pomodorass << @pom
    redirect_to users_path
  end

  def del_pomodoro
    @user.pomodorass.last.destroy unless @user.pomodorass.last.status == "free"
    redirect_to users_path
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to users_path unless @user == current_user
  end

end
