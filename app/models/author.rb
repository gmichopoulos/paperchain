class Author < ActiveRecord::Base
  	attr_accessible  :first_name, :last_name, :email, :penname, :password, :password_confirmation
  	has_many :links
	has_and_belongs_to_many :chains
end
