class Rating < ActiveRecord::Base
  belongs_to :idea
  attr_accessible :count
end
