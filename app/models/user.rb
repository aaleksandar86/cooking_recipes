class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  private

  def email_to_downcase
    self.email = email.downcase
  end
end
