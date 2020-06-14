class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def after_sign_in_path_for(resource)
        if resource.is_a?(User) && resource.roles.blank?
            resource.add_role(:user)
        end
        super
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
          user_params.permit(:name, :email, :password, :password_confirmation)
        end
      end
end
