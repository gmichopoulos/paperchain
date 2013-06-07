class Author < ActiveRecord::Base
  @@username_regex = /^[a-zA-Z]+$/
  @@email_regex = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  attr_accessible  :first_name, :last_name, :email, :penname, :password, :password_confirmation

  has_secure_password

  has_many :links
  has_and_belongs_to_many :chains
  has_many :invitations

  validates_presence_of :penname
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_uniqueness_of :penname
  validates_uniqueness_of :email

  validates :email, :format => { :with => @@email_regex, :message => "is invalid" }
  validates :penname, :format => { :with => @@username_regex, :message => "should not have numbers" }
  validates :password, :length => { :minimum => 8, :too_short => "must be at least %{count} characters long" }

  def self.authenticate(penname, password)
    find_by_penname(penname).try(:authenticate, password)
  end

  def points
    points = 0
    points += 50*self.chains.length
    points += 10*self.links.length
  end

end
