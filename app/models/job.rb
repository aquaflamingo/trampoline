# frozen_string_literal: true

class Job < ApplicationRecord
  has_one_attached :upload
  has_one :run

  validates :title, presence: true
  validates :description, presence: true

  def complete?
    run.present? && run.completed_at
  end

  def to_downloadable
    d = Download.new(self)

    d.result
  end

  class Download
    ERBPayload = Struct.new(:name, :description, :text)

    def initialize(j)
      @payload = ERBPayload.new(
        j.title,
        j.description,
        j.run&.resolved_text
      )
    end

    def result
      erb_template_fp = Rails.root.join('app', 'views', 'jobs', 'download.erb.txt')

      erb = ERB.new(File.read(erb_template_fp))

      erb.result(get_binding)
    end

    # disable:rubocop
    def get_binding
      binding
    end
    # enable:rubocop
  end
end
