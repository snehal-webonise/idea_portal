class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
   attr_accessible :idea_id, :user_id
end
