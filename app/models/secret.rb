class Secret < ApplicationRecord
  belongs_to :profile

  enum vendors: {
    openai: 0,
    gcp: 1
  }

  validate :name_is_unique

  private
  def name_is_unique
    errors.add(:name, "Profile has secret with same name already") if profile.exchange_api_keys.exists?(name: name)
  end
end
