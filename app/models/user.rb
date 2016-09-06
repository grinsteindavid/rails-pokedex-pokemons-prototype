class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
  validates_uniqueness_of :username, :on => :create, :message => "must be unique"
  validates_format_of :email, :with => EMAIL_REGEX, :on => :create, :message => "is invalid"
  validates_length_of :password, :within => 3..72, :on => :create, :message => "length must be between 3 and 72 digits"
  validates_presence_of :email, :on => :create, :message => "can't be blank"
  validates_presence_of :username, :on => :create, :message => "can't be blank"
  validates_presence_of :password, :on => :create, :message => "can't be blank"

  has_many :pokemons, :dependent => :destroy
  has_secure_password
end
