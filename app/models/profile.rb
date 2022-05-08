class Profile < ApplicationRecord
  has_many :secrets

  def openai_credentials
    # TODO
  end

  def gcp_credentials
    # TODO
  end
end
