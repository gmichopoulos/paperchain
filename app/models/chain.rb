class Chain < ActiveRecord::Base
  attr_accessible :start_date, :link_rate, :num_links
  
	has_and_belongs_to_many :authors
  has_many :links
end
