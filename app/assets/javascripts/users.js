$(document).ready(function(){
    // Retrieve Stripe public key, for permission to interact with Stripe
    // まずstripe側にこちらのstripeアカウントを認識させるために、publishablekeyを渡す。
    // Stripe は stripe.js を読み込むと使える記述
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    // Watch for a form submission:
    // ID form-submit-btnを持つ要素をクリックしたら起動し、その要素が起こす状態を保持。
    // ID form-submit-btnは _pro_form.html.erbのsubmit buttonに書かれている。
    $("#form-submit-btn").click(function(event){
        // Prevent form's default behavior so that it does not yet submit
        // Id form-submit-btnを持つ要素が起こす動作を停止させる
        event.preventDefault();
        // Disable button to prevent additional clicks
        // type = submitのinput要素を機能させなくして、ボタンを2回以上押されることのないようにする。
        $('input[type=submit]').prop('disabled', true );
        // エラー発生時のために、変数 errorに falseを入れておく。
        var error = false;
        // Grab values from credit card fields and store each in variables
        // _pro_form.html.erbのフォームに入力された情報を変数に入れる
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        // error変数の中身であるfalseではない時、つまり、trueの時、
        // 変数に入れた_pro_form.html.erbのフォームに入力された情報を暗号化して、
        // Stripeにkeyとvalueのハッシュとして渡す。
        // この暗号化されたクレジットカード情報は１度しか使用できないため、
        // 不正な使用を妨げることができる。
        // 暗号化を行う createToken は stripe.js のメソッド
        if (!error) {
            // Get the stripe token:
            // Send card information to Stripe
            Stripe.createToken({
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                exp_year: expYear
                // Stripe sends back a response, which includes a card token
                // ここに書いてあるstriperesponseHandler はここの下の部分で定義されている。
                // 上のstripeサーバーへカード情報を渡す処理が行われたら、次にこの、
                // stripeResponseHandlerの処理が行われる。
            }, stripeResponseHandler);
        }
        return false;
    }); // form submission
    
    // status と responseは stripeサーバーから送られてくる。
    function stripeResponseHandler(status, response) {
        // Get a reference to the form:
        // ID new_userを持つ要素を指定している状態を変数fに入れる。
        // ID new_userを持つ要素を指定することは、
        // _pro_form.html.erbのフォーム全体の枠組みを指定しているということ。
        var f = $("#new_user");
        
        // Get the token from the response:
        var token = response.id;
        
        // Add the token to the form:
        // stripe_card_token の定義は、app/models/user.rb の中で行われている。
        // アクセッサ−が書かれているため、Userクラスの外でも簡単に呼び出せる。
        f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
        
        // Submit the form:
        // Finally, submit the form to our servers: only the email, password, and hidden card token.
        // .get(0)は配列の１番最初の要素を取得するのと同じ意味合いの記述
        f.get(0).submit();
    }
});