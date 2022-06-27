class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :firstname_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
  validates :lastname_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }
  validates :birthday, presence: true
end
