class ChainController < ApplicationController

  before_filter :require_post, :only => [:post_chain]

  def index
    @chain = Chain.find(params[:id])
  end

  def find_next_link(author)
    cur_day = Time.now.strftime("%w").to_i
    next_due = 7
    next_chain = nil
    author.chains.each do |chain|
      if chain.num_left != 0
        for i in 0..6
          if chain.link_rate[(cur_day+i)%7] == "1" && i < next_due
            prev_link = nil
            counter = 0
            while prev_link.nil?
              counter += 1
              if counter <= cur_day
                if chain.link_rate[cur_day - counter] == "1"
                  prev_link = cur_day - counter
                end
              else
                if chain.link_rate[7 + (cur_day - counter)] == "1" 
                  prev_link = 7 + (cur_day - counter)
                end
              end
            end
            author_links = Link.where("author_id = ? AND chain_id = ?", author.id, chain.id)
            puts author_links
            link_found = false
            author_links.each do |link|
              puts link
              puts link.id
              if link.date.to_date > (Date.today - counter)
                link_found = true
              end
            end
            
            if !link_found
              next_chain = chain
              next_due = i
            end
          end
        end
      end
    end
    return next_chain, next_due
  end 

  def author
    id = params[:id]
    if !id.nil?
      if session[:curr_author] == id.to_i
        
        @author = Author.find(id)
        @chains = @author.chains

        @num_links = 0
        @num_words = 0
        next_link = find_next_link(@author)
        @next_chain = next_link[0]
        @days_nc = next_link[1]
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
        redirect_to :controller => 'home', :action => 'index'
    end 
  end

  def create_chain
    @chain = Chain.new
    @chain.title = params[:title]
    @chain.authors << Author.find(session[:curr_author])

    @chain.end_type = params[:ends]
    if params[:ends] == "entries"
      @chain.num_left = params[:entries]
    elsif params[:ends] == "weeks"
      @chain.num_left = params[:weeks]
    else
      @chain.num_left = 0
    end

    @chain.start_date = DateTime.now

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
      puts @chain
      redirect_to :controller => :chain, :action => 'index', :id => @chain.id
    else
      redirect_to :back
    end
  end
end
