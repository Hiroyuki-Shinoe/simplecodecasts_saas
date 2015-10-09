class Profile < ActiveRecord::Base
    belongs_to :user
    
    # paperclipのdocument (https://github.com/thoughtbot/paperclip#models)には、
    # user modelの中に書くように書かれているが、今回は、profileデータベースに画像を保存したいので、
    # profile modelの中に書く。
    # この記述には、avatar カラムを使用することが書かれているため、まず、migrationでデータテーブルに
    # カラムを追加する。
    # migration作成時に入力するものも、rails generate paperclip user avatar ではなく、
    # rails generate paperclip profile avatar となる。
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end