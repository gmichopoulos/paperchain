class Invitation < ActiveRecord::Base
  attr_accessible :chain, :invitor
  belongs_to :author
  # attr_accessible :title, :body
end
