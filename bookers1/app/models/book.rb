class Book < ApplicationRecord
  # 入力フォームのvalidationの設定をオンにする
  validates :title, presence: true
  validates :body, presence: true
end
