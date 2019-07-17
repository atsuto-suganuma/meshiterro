class PostImage < ApplicationRecord
	belongs_to :user
	#ポストイメージモデルからユーザーIDに紐づいてユーザーモデルを参照できるよ！
	# ポストイメージモデルに紐づいているのは１つのユーザーモデルなのでモデル名が単数形になるので注意しよう
	attachment :image
	# ここにアタッチメントメソッドを追加することで画像をアップロードできるようになるよ！
	# _idは含めないので注意しよう！
end
