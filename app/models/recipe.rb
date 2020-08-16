class Recipe < ApplicationRecord
  TITLE_LENGTH = 5
  DESCRIPTION_LENGTH = 250

  belongs_to :user

  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :instructions, inverse_of: :recipe, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |att| att['ingredient_name'].blank? }
  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: proc { |att| att['body'].blank? }

  validates :title, presence: true, length: { minimum: TITLE_LENGTH }
  validates :description, presence: true, length: { maximum: DESCRIPTION_LENGTH }
end
