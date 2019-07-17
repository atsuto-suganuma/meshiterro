class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # 作成したユーザーモデルにデバイスで使用する機能はこれですよー

    has_many :post_images, dependent: :destroy
    #ポストイメージと１対Nの関係になっているよ！, モデル内の親レコードが消されたら子レコードも一緒に消えるよ！
    #ポストイメージモデルとは複数関係しているので複数形になっている。
    # モデル名だけど先頭小文字になっているよ！ハズ_メニーのときはモデル名でも小文字で書くと理解しておこう！
    has_many :post_comments,dependent: :destroy
    #ポストコメントと１対Nの関係になっているよ！, モデル内の親レコードが消されたら子レコードも一緒に消えるよ！
    #ポストコメントモデルとは複数関係しているので複数形になっている。
    has_many :favorites, dependent: :destroy
    #フェイバリットと１対Nの関係になっているよ！, モデル内の親レコードが消されたら子レコードも一緒に消えるよ！
    #フェイバリットモデルとは複数関係しているので複数形になっている。
    attachment :profile_image
    #画像をアップロードするためのメソッドだよー！
end
