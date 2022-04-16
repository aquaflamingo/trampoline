class Run < ApplicationRecord
  belongs_to :job

  def complete?
    completed_at.present?
  end
end
