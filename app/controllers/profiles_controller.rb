class ProfilesController < ApplicationController
    def new
        # form where a user can fill out own profile.
        # まず、profileを入力しようとしているuserがどのuserか識別する処理を書く
        # app/views/pages/home.html.erb の new_user_profile_path(current_user)
        # から渡されたuser情報から、params[:user_id] で user_idを取得し、
        # どのuserかを識別する。
        @user = User.find(params[:user_id])
        # 下１行はparamsの説明のための見本
        # @variable = params[:hello]
        
        # builde_profileを用いて、上記で識別したユーザーのprofileを作成。
        # ここでは、まだ中身は無い。空の状態。
        
        # @profile = @user.build_profile
        
        # 上記の記述だと、new アクションにアクセスする度にuser_id が空のprofileオブジェクトを
        # 作成して上書きしているので、create アクションでfirst_nameなどの中身の入ったprofileを作成した後、
        # /uers/:user_id/profile/new へアクセスし、newアクションを呼び出すと、
        # user_id のカラムの中身が無くなってしまう。
        # /uers/:user_id/profile/newへアクセスするたびに、profileのuser_idカラムの中身無くなってしまうのを
        # 避けるために、@userと関連付けた@profileを作成することをやめる
        @profile = Profile.new
    end
    
    def create
        @user = User.find(params[:user_id])
        # newアクションとは違い、中身のある@profileを作成する記述を書く。
        # profile_paramsは下のprivate以下で定義を行う。
        @profile = @user.build_profile(profile_params)
        # フォームから渡されたデータの入った @profileをデータベースに保存すると同時に、
        # 無事に保存された場合と入力データの誤りなどで保存に失敗した場合に起きることを記述する。
        if @profile.save
            # データベースへの保存に成功したら、
            # flashハッシュにsuccessパラメーターと表示したいメッセージを渡し、
            # 他のページへ飛ばす。flashハッシュに入ったメッセージは飛ばされた先で表示される。
            flash[:success] = "Profile Updated!"
            # user_path はusersControllerのshowアクションへ飛ばしている
            redirect_to user_path(params[:user_id])
        else
            # データベースへの保存に失敗したら、このcontroller内のnewアクションへ飛ばす。
            render action: :new
            # この記述は他にも様々な書き方があり、結果は全く同じになる。
        #   render :new
        #   render "new"
        #   render "new.html.erb"
        #   render action: "new"
        #   render action: :new
        #   render action: "new.html.erb"
        #   render "profiles/new"
        #   render "profiles/new.html.erb"
        #   render template: "profiles/new"
        #   render template: "profiles/new.html.erb"
        end
    end
    
    private
        def profile_params
            # strong parameterの記述。
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end