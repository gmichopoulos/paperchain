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

  # def author
  #   id = params[:id]
  #   @author = Author.find(id)
  #   @chains = @author.chains

  #   @num_links = 0
  #   @num_words = 0
  #   @author.links.each do |link|
  #     @num_links += 1
  #     @num_words += link.link_text.length
  #   end

  #   @num_links += @num_words/250

  # end

  def create_chain
    @chain = Chain.new
    @chain.author = Author.find(params[:id])

  end

  def author
    id = params[:id]
    if !id.nil?
      if session[:curr_author] == id.to_i
        
        @author = Author.find(id)
        @chains = @author.chains

        @num_links = 0
        @num_words = 0
        @author.links.each do |link|
          @num_links += 1
          @num_words += link.link_text.length
        end

        @num_links += @num_words/250
      else
        flash[:notice] = "Maybe you were just looking to find your own page?"
        redirect_to :controller => 'chain', :action => 'author', :id => session[:curr_author]
      end

    else
        flash[:notice] = "You have to log in to view an author page!"
        redirect_to :controller => 'author', :action => 'login'
    end 
  end
      
end
