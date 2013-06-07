class Link < ActiveRecord::Base
	attr_accessible :date, :link_text, :title
	belongs_to :author
  belongs_to :chain

  def wordcount 
    self.link_text.split(' ').count
  end
end
