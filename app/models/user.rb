class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  #has_many :orders

  ## パスワードの半角英数字混合入力必須
  ## 氏名それぞれ全角ひらがな漢字カタカナ入力必須
  ## 氏名かなそれぞれ全角カタカナ入力必須
  

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、漢字、カタカナで入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、漢字、カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英字と数字を組み合わせて入力してください" }
end
