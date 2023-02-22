class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  validates :nickname, presence: true
  validates :sei_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :mei_kanji, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :sei_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :mei_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
