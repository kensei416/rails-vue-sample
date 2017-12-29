class Task < ApplicationRecord
  belongs_to :category, -> { includes :user }
  validates :title, presence: true
end
