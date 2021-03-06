class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :check_login_debug
  before_filter :check_login

  # def check_login_debug
  #   session[:curr_author] = 3
  # end

  def check_login
    if session[:curr_author]
      @author = Author.find_by_id(session[:curr_author])
      @logged_in = true
    else
      @author = Author.new(:penname => "error");
      @logged_in = false
    end
  end

  def require_post
      if !request.post?
          raise ActionController::RoutingError.new('Not Found')
      end
  end

end


