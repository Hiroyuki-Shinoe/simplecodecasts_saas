class ProfilesController < ApplicationController
    def new
        # form where a user can fill out own profile.
        # まず、現在ページにアクセスしているユーザーを識別する。
        # params[:user_id] でクライアント側からユーザーのuser_idが渡ってくるようにする。
        # 
        @user = User.find(params[:user_id])
        @variable = params[:hello]
        # 上記で識別したユーザーのprofileを作成
        @profile = @user.build_profile
    end
end