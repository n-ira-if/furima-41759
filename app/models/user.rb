class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,128}\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "パスワードには半角英数字を含めてください" }, if: -> { password.present? }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龠々ー]+\z/
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "全角で入力してください" }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: "全角で入力してください" }

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "全角カタカナで入力してください" }
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "全角カタカナで入力してください" }

  validates :birth_date, presence: true

end
