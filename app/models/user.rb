class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :family_name, format: { with: /\A[ァ-ヶー－ぁ-ん一-龥]+\z/ }
    validates :given_name, format: { with: /\A[ァ-ヶー－ぁ-ん一-龥]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :given_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
