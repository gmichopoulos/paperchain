class AuthorController < ApplicationController

  #skip_before_filter :require_authentication, :only => [:login, :create]
  before_filter :require_post, :only => [:post_login, :post_register]

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
    @author = Author.new(:penname => params[:penname], :email =>params[:email], :first_name => params[:first_name], :last_name => params[:last_name], :password => params[:password])
    if @author.save
      session[:curr_author] = @author.id 
      redirect_to :controller => 'chain', :action => 'author', :id => @author.id
      flash[:notice] = "Welcome to Paperchain, " + @author.first_name + "!"
    else
      redirect_to :controller => 'author', :action => 'register'
      flash[:notice] = @author.errors.full_messages.to_sentence
    end
  end

 


end
