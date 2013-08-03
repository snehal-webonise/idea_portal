module ApplicationHelper
  def select_categories
    Category.select("id, name").collect{|i| [simple_format(i.name), i.id] }
  end

  def get_category(category_id)
    logger.info"######i m here#########"
    Category.find(category_id).name
  end
end
