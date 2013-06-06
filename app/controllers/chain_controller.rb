class ChainController < ApplicationController

  # before_filter :check_login 
  before_filter :require_post, :only => [:post_chain]

  def index
    @chain = Chain.find(params[:id])
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
          @num_words += link.link_text.split(" ").count
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

  def create_chain
    @chain = Chain.new
    @chain.title = params[:title]
    @chain.authors << Author.find(session[:curr_author])
    @chain.start_date = DateTime.now
    @chain.num_links = 0

    link_rate = ''
    if params[:day0].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day1].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day2].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day3].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day4].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day5].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end
    if params[:day6].to_i == 1
      link_rate = link_rate + '1'
    else
      link_rate = link_rate + '0'
    end

    @chain.link_rate = link_rate

    if @chain.save
      redirect_to :controller => :chain, :action => 'index', :id => @chain.id
    else
      redirect_to :back
    end
  end
end
