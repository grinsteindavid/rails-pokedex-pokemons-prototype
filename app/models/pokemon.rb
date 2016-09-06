class Pokemon < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, PokemonUploader

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :hp, :on => :create, :message => "can't be blank"
  validates_numericality_of :hp, :on => :create, :message => "is not a number"
  validates_length_of :name, :within => 3..25, :on => :create, :message => "must be present"
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"

  scope :search_these, -> (names) {where name: names}
end
