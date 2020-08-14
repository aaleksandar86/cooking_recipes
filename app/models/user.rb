class User < ApplicationRecord
  USERNAME_LENGTH = 40
  FIRST_NAME_LENGTH = 50
  LAST_NAME_LENGTH = 50
  EMAIL_LENGTH = 60
  PASSWORD_LENGTH = 6

  has_secure_password

  has_many :recipes, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save :email_to_downcase

  validates :username, presence: true, length: { maximum: USERNAME_LENGTH }, uniqueness: true
  validates :first_name, presence: true, length: { maximum: FIRST_NAME_LENGTH }
  validates :last_name, presence: true, length: { maximum: LAST_NAME_LENGTH }
  validates :password, presence: true, length: { minimum: PASSWORD_LENGTH }
  validates :email, presence: true, length: { maximum: EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  private

  def email_to_downcase
    self.email = email.downcase
  end
end
