class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  attr_accessible :idea_id, :user_id

  scope :total_likes, lambda{|idea| where("idea_id =?", idea.id)}
end
