class AuthorController < ApplicationController

  #skip_before_filter :require_authentication, :only => [:login, :create]

  def authors
      @authors = Author.find(:all)
  end

  def login

  end

  def post_login
    @author = Author.authenticate params[:penname], params[:password]
    if @author
      session[:curr_author] = @author.id
      redirect_to :controller => 'chain', :action => 'author', :id => @author.id
      flash[:notice] = "Welcome back to Paperchain, " + @author.first_name + "!"
    else
      redirect_to :controller => 'author', :action => 'login'
      flash[:notice] = "That was not a valid penname-password combination. Please try again."
    end
  end

  def logout
    session[:curr_author] = nil
    redirect_to :controller => 'author', :action => 'login'
  end

  def register
    
  end

  def post_register
    @author = Author.new params[:penname]
    if @author.save
      redirect_to :controller => 'chain', :action => 'author', :id => author.id
      flash[:notice] = "Welcome to Paperchain, " + author.first_name + "!"
    else
      redirect_to :controller => 'author', :action => 'register'
      flash[:notice] = @author.errors
    end
  end

 


end
