class Rating < ActiveRecord::Base
  belongs_to :idea
  attr_accessible :count,:idea_id
end
