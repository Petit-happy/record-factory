class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        case resource
        when EndUser
          session[:previous_url] || end_user_root_path
        when AdminUser
          admin_root_path
        end
      end
    def after_sign_out_path_for(resource)
      end_user_root_path
    end
end