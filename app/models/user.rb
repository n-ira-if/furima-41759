class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,128}\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX,}, if: -> { password.present? }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龠々ー]+\z/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX}
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX}

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX}
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX}

  validates :birth_date, presence: true

end
