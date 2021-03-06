class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # belongs_to を記述したモデルのデータテーブルは、plan_id などのforeign keyを持つことになる
  # 今回は、userテーブルからユーザーがbasic plan (plan_id =1)かpro plan (plan_id = 2)を判別したいので、
  # user belongs_to plan、 plan has_many usersと書く。
  belongs_to :plan
  has_one :profile
  
  # Userクラスの中で、定義されたstripe_card_token をapp/assets/javascripts/users.js で使用するために、
  # アクセッサ−を書いておく。
  attr_accessor :stripe_card_token
  
  # app/controllers/users/registrations_controller.rb に書かれているメソッド
  # save_with_paymentの定義を行う
  def save_with_payment
    # フォームで入力されたものが適切であれば、処理を実行する。
    if valid?
      # stripeサーバーへユーザーに関するデータ( email, plan_id, stripe_card_token)を送る。
      # stripeサーバーは customer を作成し、customer_idを返してくる。
      # stripeがproアカウントユーザーに利用料を課金する。
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      # stripeサーバーからユーザー(stripe内ではcustomer)のidが送り返されてくる
      self.stripe_customer_token = customer.id
      save!
    end
    
  end
end
