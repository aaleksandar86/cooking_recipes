class Recipe < ApplicationRecord
  TITLE_LENGTH = 5
  DESCRIPTION_LENGTH = 250

  belongs_to :user

  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates :title, presence: true, length: { minimum: TITLE_LENGTH }
  validates :description, presence: true, length: { maximum: DESCRIPTION_LENGTH }
end
