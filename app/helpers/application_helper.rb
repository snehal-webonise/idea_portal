module ApplicationHelper
  def select_categories
    Category.select("id, name").collect{|i| [simple_format(i.name), i.id] }
  end

  def get_category(category_id)
    logger.info"######i m here#########"
    Category.find(category_id).name
  end

  def find_like(user_id,idea_id)
    Like.where(:user_id=>user_id, :idea_id => idea_id)
  end
end
