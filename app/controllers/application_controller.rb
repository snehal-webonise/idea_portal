class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource) 
  	logger.info "+++++++++++++++#{resource.inspect}"
  	if resource.is_admin?
			admin_ideas_path
		else
			ideas_path
		end

	end

end
