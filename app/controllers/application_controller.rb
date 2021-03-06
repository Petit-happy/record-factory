class ApplicationController < ActionController::Base
  #userがsign_inしていない時に表示できる画面。
  #before_action :authenticate_end_user!, except: []
  # before_action :authenticate_admin_user!, except: []

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
    end
#sign outした後に飛ぶページ
#デバイスのモデル名はハッシュで
      def after_sign_out_path_for(resource)
      # end_user_root_path
        case resource
        when :end_user
          end_user_root_path
        when :admin_user
          new_admin_user_session_path
        end
      end


      protect_from_forgery with: :exception
      # 第 1 引数 => model名 :user (必須)
      # 第 2 引数 => column名 :name (必須)
      # 第 3 引数 => オプション full: true (任意)
      autocomplete :artist, :artist_name, full: true

    end
