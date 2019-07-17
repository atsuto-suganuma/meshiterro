class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #ログイン認証してない場合はログイン画面にリダイレクトさせるよ！
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイスを利用する機能が実行される前にコンフィガ以下のコマンドを使うよ

  protected #ほかのコントローラからも参照ができるストロングパラメータだよ
  def configure_permitted_parameters # デバイス＿パラメーター以下でネームのデータ操作を許可アクションメソッドだよ！
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	# ユーザー登録の際にユーザー名のデータ操作が許可されるよ！
  end
end
