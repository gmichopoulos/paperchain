class Link < ActiveRecord::Base
	attr_accessible :date, :link_text, :title
	belongs_to :author
  belongs_to :chain
end
