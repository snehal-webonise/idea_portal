class Category < ActiveRecord::Base
  has_many :ideas
  attr_accessible :type
end
