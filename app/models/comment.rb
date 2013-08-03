class Comment < ActiveRecord::Base
  belongs_to :idea
  attr_accessible :description
end
