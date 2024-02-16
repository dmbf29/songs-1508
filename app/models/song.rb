class Song < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # validates :column_name, whatever_validation
  validates :title, presence: true
end
