# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :secrets

  def openai_credentials
    secrets.open_ai&.first
  end

  def gcp_credentials
    secrets.gcp&.first
  end
end
