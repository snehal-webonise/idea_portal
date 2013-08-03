class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :description, :mode, :name, :status,:how_usefull,:category_id
end
