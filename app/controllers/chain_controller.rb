class ChainController < ApplicationController

  # before_filter :check_login 
  before_filter :require_post, :only => [:post_comment, :post_photo, :post_tag]

  # def author
  #   id = params[:id]
  #   @author = Author.find(id)
  #   @chains = @author.chains
  # end

  def create_chain
    @chain = Chain.new
    @chain.author = Author.find(params[:id])

  end

  def author
    authID = params[:id]
    curr_authID = session[:curr_author]

    if !authID.nil?
      if curr_authID == authID.to_i
        @author = Author.find(authID)
      else
        flash[:notice] = "Maybe you were just looking to find your own page?"
        redirect_to :controller => 'chain', :action => 'author', :id => session[:curr_author]
      end

    else
        flash[:notice] = "You have to log in to view your author page!"
        redirect_to :controller => 'author', :action => 'login'
    end 
  end
      
end
