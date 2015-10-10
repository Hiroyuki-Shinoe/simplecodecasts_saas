class UsersController < ApplicationController
    # サインインしている人しか、各actionの処理を実行できなくする。
    # devise gemが持つ authenticate_user! はサインインしていないユーザーの場合、
    # ログインフォームページ /users/sign_inへ飛ばす。
    before_action :authenticate_user!
    
    def index
        @user = User.all
    end
    
    def show
        # ここでは、 :user_id ではなく、 :id と書く。
        # これは rake routes で確認できる show アクションのurl が
        # /users/:id となっているため。
        @user = User.find(params[:id])
    end
    
end