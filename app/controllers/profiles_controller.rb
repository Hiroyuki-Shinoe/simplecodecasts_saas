class ProfilesController < ApplicationController
    def new
        # form where a user can fill out own profile.
        # まず、profileを入力しようとしているuserがどのuserか識別する処理を書く
        # app/views/pages/home.html.erb の new_user_profile_path(current_user)
        # から渡されたuser情報から、params[:user_id] で user_idを取得し、
        # どのuserかを識別する。
        @user = User.find(params[:user_id])
        # 下１行はparamsの説明のための見本
        @variable = params[:hello]
        # 上記で識別したユーザーのprofileを作成
        @profile = @user.build_profile
    end
end