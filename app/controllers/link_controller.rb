class LinkController < ApplicationController

def index
  @link = Link.find(params[:id])
  @wordcount = @link.link_text.split.length
end

end
