class PostImage < ApplicationRecord
	belongs_to :user
	#ポストイメージモデルからユーザーIDに紐づいてユーザーモデルを参照できるよ！
	# ポストイメージモデルに紐づいているのは１つのユーザーモデルなのでモデル名が単数形になるので注意しよう
	attachment :image
	# ここにアタッチメントメソッドを追加することで画像をアップロードできるようになるよ！
	# _idは含めないので注意しよう！
	has_many :post_comments, dependent: :destroy
	#ポストイメージと１対Nの関係になっているよ！, モデル内の親レコードが消されたら子レコードも一緒に消えるよ！
	has_many :favorites, dependent: :destroy
	#フェイバリットと１対Nの関係になっているよ！, モデル内の親レコードが消されたら子レコードも一緒に消えるよ！
	validates :shop_name, presence: true
	validates :image, presence: true
	#入力されたデータの存在をチェックし、データが入っていればトゥルーとするよ！

	def favorited_by?(user) #フェイバリット_バイメソッドを使うよ（ユーザー引数を参照するよ）
	  favorites.where(user_id: user.id).exists? #引数で渡されたユーザーアイディーがフェイバリットテーブル内に存在してるか調べるよ！
	  # あればトゥルー、なければフォルスを返すよ　エクジスツは存在を調べるよ
	end
end
