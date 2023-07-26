class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, dependent: :destroy
  has_one :image, dependent: :destroy

  validates :correct_answer, inclusion: { in: 1..4 }

  accepts_nested_attributes_for :choices
  accepts_nested_attributes_for :image
end
