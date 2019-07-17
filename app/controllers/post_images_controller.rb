class PostImagesController < ApplicationController

    def new
    	@post_image = PostImage.new #画像を投稿する画面に情報を渡すための変数だよ
    end

    def create
    	@post_image = PostImage.new(post_image_params) #ストロングパラメータを使うよ
    	@post_image.user_id = current_user.id 
    	#画像投稿のユーザーアイディーと利用者のユーザーアイディーを紐づけるよ
    	@post_image.save #画像を保存するよ
    	redirect_to post_images_path #画面移動するよ
    end

    def index
    	@post_images = PostImage.all
    end

    def show
    	@post_image = PostImage.find(params[:id])
    end
private
    def post_image_params
    	params.require(:post_image).permit(:shop_name, :image, :caption)
    end
# 投稿データのストロングパラメータだよ
end

