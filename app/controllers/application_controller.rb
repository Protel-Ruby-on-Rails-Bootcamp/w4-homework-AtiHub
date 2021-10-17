class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |u|
            u.permit :email, :username, :password, :password_confirmation
        end
        
        devise_parameter_sanitizer.permit(:account_update) do |u|
            u.permit :email, :username, :password, :current_password
        end
    end
end
