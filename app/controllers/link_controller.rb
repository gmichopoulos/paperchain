class LinkController < ApplicationController

  def index
    @link = Link.find(params[:id])
    @wordcount = @link.link_text.split.length
    @prev = @next = nil
    links = @link.chain.links.order("date")
    links.length.times do |i|
      if links[i] == @link
        @prev = links[i-1] unless i == 0
        @next = links[i+1] unless i == links.length-1
      end
    end
  end

  def save
    @link = Link.find(params[:id])
    @link.link_text = params[:text]
    @link.title = params[:title]
    
    if @link.save
      render :json => {:text => @link.link_text}
    end
  end

  def create
    @link = Link.new
    @link.title = 'New entry'
    @link.link_text = ''
    @link.date = DateTime.now
    @link.author = Author.find(session[:curr_author])
    @link.chain = Chain.find(params[:chain])

    if @link.save
      redirect_to :controller => 'link', :action => 'index', :id => @link.id, :edit => 'true'
    else
      redirect_to :back
      flash[:notice] = "Could not create new link :("
    end
  end

end
