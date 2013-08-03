class Comment < ActiveRecord::Base
  belongs_to :idea

  attr_accessible :description
  validates_presence_of :description,:message => "Description can't be blank'"
  validates_length_of :description, :maximum => 200, :message => "description should be maximum 200 characters."
end
