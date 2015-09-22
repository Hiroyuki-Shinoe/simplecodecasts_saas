class Users::RegistrationsController < Devise::RegistrationsController
    # devise gemが備えている機能を書き換えるために、
    # devise gemが持っているDevis::RegistrationsControllerを継承したクラス 
    # Users::RegistrationsControllerを作成し、それの内容を記述することで上書きしていく。
    
    def create
        super do |resource|
            if params[:plan]
            # ユーザーのデータテーブルのカラム plan_id に、入力したフォームのplan idを保存する
            # _basic_form.html.erbのフォームから入力されたら、 plan_id には 1が保存される。
            # _pro_form.html.erbのフォームから入力されたら、plan_idには 2が保存される。
                resource.plan_id = params[:plan]
                # ユーザーデータテーブルのplan_idカラムに保存するのが 2 なら、
                # resource.save_with_paymentを実行。
                # このメソッド save_with_payment の定義は app/models/user.rb で行われる。
                # メソッドの定義場所がapp/models/user.rbなのは取り扱っているデータがユーザーテーブルなため。
                if resource.plan_id == 2
                    resource.save_with_payment
                else  # plan_idカラムに保存するのが2でないならresource.saveを実行し、普通にデータベースへ送られる
                    resource.save
                end
            end
        end
    end
    
end