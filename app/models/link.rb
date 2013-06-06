class Link < ActiveRecord::Base
	attr_accessible :date, :link_text, :title
	belongs_to :author
  belongs_to :chain

  # def self.ordered(id)
  #   return Chain.find(id).links.order("date");
  # end
end
