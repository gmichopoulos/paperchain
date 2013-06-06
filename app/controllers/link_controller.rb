class LinkController < ApplicationController

def index
  @link = Link.find(params[:id])
  @wordcount = @link.link_text.split.length
  @prev = @next = nil
  links = @link.chain.links
  links.length.times do |i|
    if links[i] == @link
      @prev = links[i-1] unless i == 0
      @next = links[i+1] unless i == links.length-1
    end
  end
end

end
