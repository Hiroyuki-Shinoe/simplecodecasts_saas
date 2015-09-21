class PagesController < ApplicationController
    def home
        # データベーステーブルへのアクセスには、１文字目の大文字にしたテーブル名を使う
        # findメソッドはデータベースを検索するためのもの。
        # parameterとしてIDを渡して、合致するものを探す
        @basic_plan = Plan.find(1)
        # idが１のデータが入っているインスタンス変数 @basic_planには、idやnameといった
        # キーによるバリューの呼び出しが行える
        # @basic_plan.id == 1
        # @basic_plan.name == basic
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
end
