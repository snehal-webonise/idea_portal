class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes

  attr_accessible :description, :mode, :name, :status,:how_usefull,:category_id
  validates_presence_of :name,:message => "Name can't be blank"
  validates_presence_of :category_id,:message => "Please select a category"
  validates_presence_of :mode,:message => "Please select at least one"
  validates_presence_of :description,:message => "Description can't be blank"
  validates_length_of :description, :maximum => 200, :message => "description should be maximum 200 characters."
  validates_presence_of :how_usefull,:message => "Can't be blank"
  validates_length_of :how_usefull, :maximum => 200, :message => "Please define it in maximum 200 characters."
end
