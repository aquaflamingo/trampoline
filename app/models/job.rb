class Job < ApplicationRecord
  has_one_attached :upload

  validates :title, presence: true
  validates :description, presence: true
end
