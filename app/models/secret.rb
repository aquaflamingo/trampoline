# frozen_string_literal: true

class Secret < ApplicationRecord
  lockbox_encrypts :blob

  belongs_to :profile

  enum vendors: {
    open_ai: 'open_ai',
    gcp: 'gcp'
  }

  validate :name_is_unique

  module Vendor
    OpenAI = 'Open AI'
    GoogleCloudPlatform = 'Google Cloud Platform'

    def self.decorated_name(val)
      case val
      when :open_ai
        OpenAI
      when :gcp
        GoogleCloudPlatform
      end
    end
  end

  def vendor_name
    Vendor.decorated_name(vendor.to_sym)
  end

  private

  def name_is_unique
    errors.add(:name, 'Profile has secret with same name already') if profile.secrets.exists?(name:)
  end
end
