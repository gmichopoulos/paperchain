class ChainController < ApplicationController

  # before_filter :check_login 
  before_filter :require_post, :only => [:post_comment, :post_photo, :post_tag]

  # def check_login
  #     @curr_author = session[:curr_author]          
  # end

  def require_post
      if !request.post?
          raise ActionController::RoutingError.new('Not Found')
      end
  end

  def author
    id = params[:id]
    @author = Author.find(id)
    @chains = @author.chains
  end

  def create_chain
    @chain = Chain.new
    @chain.author = Author.find(params[:id])

  end

  # def author
  #   id = params[:id]
  #   if !id.nil?
  #     if session[:curr_author] == id
  #       @author = Author.find(id)

  #       # Populate instance variable with an array of 'chains' of arrays 
  #       # of all the author's links for use in the view.
  #       @chains = []
  #       for chain in @author.chains
  #         links = []
  #         for link in chain.links
  #           links << link
  #         end
  #         @chains << links
  #       end

  #     else
  #       flash[:notice] = "Maybe you were just looking to find your own page?"
  #       redirect_to :controller => 'chain', :action => 'author', :id => session[:curr_author]
  #     end

  #   else
  #       flash[:notice] = "You have to log in to view an author page!"
  #       redirect_to :controller => 'author', :action => 'login'
  #   end 
  # end
      
end
