class Link < ActiveRecord::Base
	attr_accessible :date, :link_text
	belongs_to :author
end
