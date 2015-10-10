####Gemfile
source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]

# Use bootstrap library for styles
gem 'bootstrap-sass', '3.3.1'

# Use font awesome library for icons
gem 'font-awesome-sass', '4.2.0'

# Use postgresql as the database for production
group :production do
    gem 'pg'
    gem 'rails_12factor'
end
# Use SCSS for stylesheets
gem 'sass-rails', '4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# turbolinks gemはstripe gemとコンフリクトを起こす可能性があるので、コメントアウトしておく
# turbolinksを使用するには、他にも多くの注意点がある。 http://qiita.com/seri_k/items/164accd9ef8ddb4a942e
# turbolinksを無効にする際には、gemfileの変更と、app/views/layouts/application.html.erbのhead内の変更、
# app/assets/javascripts/application.js内の変更の3つを行う必要がある
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.0',          group: :doc
# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# ユーザーログイン時の認証を行うgem
# Use devise for user authentication
gem 'devise', '3.4.1'

# 安全にクレジットカード決済機能を追加できるgem
# Use stripe for handling payments 
gem 'stripe', '1.16.1'

# figaro gemはgithub等に公開してはいけないものが有るときに使う
# gemに追加して、bundle install後、bundle exec figaro installを打つと、
# config/application.ymlが作成され、.gitignoreに自動的にconfig/application.ymlが追加される
# .gitignoreに記述されているファイルはgitに保存されないので、オンライン上に公開されなくてすむ
# Use figaro to hide secret keys
gem 'figaro', '1.0.0'

# Use paperclip for image uploads
# 画像をアップロードする機能を追加するgem　https://github.com/thoughtbot/paperclip#ruby-and-rails
# 使用するには、まずImageMagicがインストールされていなければならない。
# ImageMagicインストールの有無の確認には、ターミナルで identifyと入力。
# 無いようなら、 brew install imagemagick でインストール。
# pdfのアップロード機能も追加したいなら、 brew install gs も入力しておく。
gem 'paperclip', '4.2.1'

# css3の新機能を古いブラウザー等で正常に機能するようにする記述法を自動で補完してくれるgem
# https://github.com/ai/autoprefixer-rails
gem 'autoprefixer-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '3.1.7'
# Use unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Use debugger
# gem 'debugger', group: [:development, :test]