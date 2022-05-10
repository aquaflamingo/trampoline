# frozen_string_literal: true

class AddCompletedAtToRuns < ActiveRecord::Migration[7.0]
  def change
    add_column :runs, :completed_at, :datetime
  end
end
