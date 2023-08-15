class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :items
  #has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角ひらがな、漢字、カタカナで入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角ひらがな、漢字、カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{Katakana}\p{Blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birth_date, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英字と数字を組み合わせて入力してください" }
end
