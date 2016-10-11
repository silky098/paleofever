class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user #, :except => create

private
def fetch_user
  if session[:user_id].present?
    @current_user = User.find_by :id => session[:user_id]
  end
    session[:user_id] = nil unless @current_user.present?
  end


  def check_for_user
    flash[:message] = 'Please login in order to create a recipe'
    redirect_to login_path unless @current_user.present?
  end


end
