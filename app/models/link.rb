class Link < ActiveRecord::Base
	attr_accessible :date, :link_text
	belongs_to :author
  belongs_to :chain
end
