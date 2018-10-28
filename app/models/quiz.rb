class Quiz < ApplicationRecord
  validates :title, :description, presence: true

  has_many :questions
end
