class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :only_admin

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
      end

      def only_admin
        unless user_signed_in? && current_user.admin
          redirect_to root_path, notice: "No tienes permiso para crear usuario"
    
        end
      end
end
