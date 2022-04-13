class Job < ApplicationRecord
  has_one_attached :upload
  has_one :run

  validates :title, presence: true
  validates :description, presence: true
end
