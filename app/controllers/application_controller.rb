class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login_debug
  before_filter :check_login

  def check_login_debug
    session[:curr_author] = 3
  end

  def check_login
    if session[:curr_author]
      @name = Author.find_by_id(session[:curr_author]).penname
      @logged_in = true
    else
      @name = "Balls Dickturd"
      @logged_in = false
    end
  end

end


