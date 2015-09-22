class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  
  # Userクラスの中で、定義されたstripe_card_token をapp/assets/javascripts/users.js で使用するために、
  # アクセッサ−を書いておく。
  attr_accessor :stripe_card_token
  
  # app/controllers/users/rrgistrations_controller.rb に書かれているメソッド
  # save_with_paymentの定義を行う
  def save_with_payment
    # フォームで入力されたものが適切であれば、処理を実行する。
    if valid?
      # stripeサーバーへデータを送るとともに、stripeがproアカウントユーザーに利用料を課金する。
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      # stripeサーバーからユーザー(stripe内ではcustomer)のidが送り返されてくる
      self.stripe_customer_token = customer.id
      save!
    end
    
  end
end
