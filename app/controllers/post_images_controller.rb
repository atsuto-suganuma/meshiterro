class PostImagesController < ApplicationController

    def new
    	@post_image = PostImage.new #画像を投稿する画面に情報を渡すための変数だよ
    end

    def create
    	@post_image = PostImage.new(post_image_params) #ストロングパラメータを使うよ
    	@post_image.user_id = current_user.id 
    	#画像投稿のユーザーアイディーと利用者のユーザーアイディーを紐づけるよ
    	if @post_image.save #画像を保存するよ
    	redirect_to post_images_path #画面移動するよ
    	else
    	render :new
    	end
    end

    def index
    	@post_images = PostImage.page(params[:page]).reverse_order
    	#１ページ分の決められた数のデータを新しい順に取得するよ！
    end

    def show
    	@post_image = PostImage.find(params[:id])
    	@post_comment = PostComment.new
    end
    
    def destroy
    	@post_image = PostImage.find(params[:id])
    	#リソースズルーティングのデストロイから渡ってきたパラメータをもとに、削除するデータをファインドメソッドで探してビューに送るデータに変換してるよ
    	@post_image.destroy
    	#データを削除するよ
    	redirect_to post_images_path
    end
    
private
    def post_image_params
    	params.require(:post_image).permit(:shop_name, :image, :caption)
    end
# 投稿データのストロングパラメータだよ
end

