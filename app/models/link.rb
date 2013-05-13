class Link < ActiveRecord::Base
	attr_accessible: date
	belongs_to :author
end
