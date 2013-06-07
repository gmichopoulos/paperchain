class AuthorController < ApplicationController

  before_filter :require_post, :only => [:post_login, :post_register]

  def authors
      @authors = Author.find(:all)
  end

  def post_login
    @author = Author.authenticate params[:penname], params[:password]
    if @author
      session[:curr_author] = @author.id
      redirect_to :controller => 'chain', :action => 'author', :id => @author.id
      flash[:notice] = "Welcome back to Paperchain, " + @author.first_name + "!"
    else
      redirect_to root_url
      flash[:log_err] = "That was not a valid penname-password combination. Please try again."
    end
  end

  def logout
    session[:curr_author] = nil
    redirect_to root_url
  end

  def post_register
    @author = Author.new(:penname => params[:penname], :email =>params[:email], 
                          :first_name => params[:first_name], :last_name => params[:last_name], 
                          :password => params[:password], :password_confirmation => params[:password_confirmation])
    if @author.save
      session[:curr_author] = @author.id 
      redirect_to :controller => 'chain', :action => 'author', :id => @author.id
      flash[:notice] = "Welcome to Paperchain, " + @author.first_name + "!"
    else
      redirect_to root_url
      flash[:reg_err] = @author.errors.full_messages.to_sentence
    end
  end

 


end
