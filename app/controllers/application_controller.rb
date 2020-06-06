class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.roles.blank?
      resource.add_role(:user)
    end
    super
  end
end
