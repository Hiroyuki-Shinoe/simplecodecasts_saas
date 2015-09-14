class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        # if @contact.saveで@contactをデータベースに保存すると同時に、保存が成功したか(true)どうか(false)の判定を実施している
        if @contact.save
            # hashオブジェクトflashにkey( :success )とvalue( 'Message sent.' )のペアを入れている。
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else
            flash[:danger] = 'Error occured, message has not been sent.'
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            # rails 4以降、デフォルトではフォームでデータを取得できなくなっている。
            # 取得するには、permit(:name, :email, :comments)のように、
            # 変更させたいデータのみを明示する必要がある。
            # 詳しくは　http://ruby-rails.hatenadiary.com/entry/20141126/1417012848
            params.require(:contact).permit(:name, :email, :comments)
        end
    
end