class User < ActiveRecord::Base
  has_many :ideas
  attr_accessible :email, :employee_id, :name
end
