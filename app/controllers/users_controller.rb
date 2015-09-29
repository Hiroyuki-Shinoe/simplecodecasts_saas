class UsersController < ApplicationController
    def show
        # ここでは、 :user_id ではなく、 :id と書く。
        # これは rake routes で確認できる show アクションのurl が
        # /users/:id となっているため。
        @user = User.find(params[:id])
    end
    
end