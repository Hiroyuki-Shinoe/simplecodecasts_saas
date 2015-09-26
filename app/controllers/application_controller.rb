class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller? 
  
  # rails 4以降、strong parameterによって、個別に記述したデータしかフォームから取得できないようになっている
  # そこで、データテーブルにカラムを増やし、そのカラムに入れるデータをフォームから取得しようとする際には、
  # その都度、フォームからの取得を許可する記述が必要となる。
  # 今回は、_pro_form.html.erbのフォームに、app/assets/javascripts/users.jsを通して追加された、
  # <input type="hidden" name="user[stripe_card_token]" value="' + token + '" />から
  # データを取得するため。
  # devise gemに関係するため、特殊な書き方である可能性あり。
  # https://github.com/plataformatec/devise
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :stripe_card_token, :email, :password, :password_confirmation)}
    end
end
