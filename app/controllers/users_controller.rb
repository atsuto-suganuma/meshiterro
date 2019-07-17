class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	# ユーザーモデルから1件分のデータを持ってきてビューに送る形にするよ！
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  	#そのユーザーに紐づいた投稿のみを受け取って、個人が投稿したものを表示するよ
  end

  def edit
  	@user = User.find(params[:id])
  	# ユーザーモデルから1件分のデータを持ってきてビューに送る形にするよ！
  end

  def update
    @user = User.find(params[:id])
  	# ユーザーモデルから1件分のデータを持ってきてビューに送る形にするよ！
    @user.update(user_params)
    # 編集したものを保存するよ！
    redirect_to user_path(@user.id)
  end

private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end
