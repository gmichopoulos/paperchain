class Author < ActiveRecord::Base
  @@username_regex = /\p{Alpha}*/

  attr_accessible  :first_name, :last_name, :email, :penname, :password, :password_confirmation

  has_secure_password

  has_many :links
  has_and_belongs_to_many :chains

  validates_presence_of :penname
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :penname
  validates_uniqueness_of :email

  validates :penname, :format => { :with => @@username_regex, :message => "should not have numbers in them" }
  validates :password, :length => { :minimum => 8, :too_short => "must be at least %{count} characters long" }

  def self.authenticate(penname, password)
    find_by_penname(penname).try(:authenticate, password)
  end

end
