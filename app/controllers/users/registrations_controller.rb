class Users::RegistrationsController < Devise::RegistrationsController
    # devise gemが備えている機能を書き換えるために、
    # devise gemが持っているDevis::RegistrationsControllerを継承したクラス 
    # Users::RegistrationsControllerを作成し、それの内容を記述することで上書きしていく。
    
    # before_filter は書かれたcontroller内の他の処理が行われる前に、実行したいことが有るときに使う
    # 例えばログインしていないユーザーが特定のページへアクセスした場合、ログインページヘ飛ばすなどの処理
    # only: :new は書かれたcontrollerのnewアクションへアクセスしたユーザーのみにfilterを実行するという意味
    # 今回は、継承されたdevise/registrationsConrtollerのnewアクションへアクセスしたユーザーへ実行される
    before_filter :select_plan, only: :new
    
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
    
    # privateの下に書かれた処理は、このcontrollerからしか呼び出せなくなる
    private
        # before_filterで指定した、このcontrollerのnewアクションにアクセスしたユーザーへ実行するメソッド
        # select_planの定義を記述
        def select_plan
            # query stringのkeyがplanであり、かつ、valueが1か2である場合を除き、下記の処理を実行
            unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
            # alertメッセージを表示し、rootページへ飛ばす。
            flash[:notice] = "Please select a membership plan to sign up."
            redirect_to root_url
            end
        end
end