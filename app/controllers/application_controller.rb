class ApplicationController < ActionController::Base
#sign in後に飛ぶページ
    def after_sign_in_path_for(resource)
        case resource
        when EndUser
          session[:previous_url] || end_user_root_path
        when AdminUser
          admin_root_path
        end
    end
#sign up前に飛ぶページ
    def after_sign_up_path_for(resource)
      case resource
      when EndUser
        session[:previous_url] || end_user_root_path
      when AdminUser
        session[:previous_url] || admin_root_path
      end
#sign outした後に飛ぶページ
    def after_sign_out_path_for(resource)
      case resource
      when EndUser
        end_user_root_path
      when AdminUser
        admin_root_path
    end
end