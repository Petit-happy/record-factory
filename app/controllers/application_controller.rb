class ApplicationController < ActionController::Base

    # 追加　autocompletes 実行する model 名と column 名
    # protect_from_forgery with: :exception
    # 第 1 引数 => model名 :user (必須)
    # 第 2 引数 => column名 :name (必須)
    # 第 3 引数 => オプション full: true (任意)
    # autocomplete :user, :name, full: true # 追加
end
