class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post_image
	# ユーザーモデルとポストイメージモデル、この２つのモデルと紐づいているよ！
end
