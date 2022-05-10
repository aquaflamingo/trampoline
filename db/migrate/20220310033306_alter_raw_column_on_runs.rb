# frozen_string_literal: true

class AlterRawColumnOnRuns < ActiveRecord::Migration[7.0]
  def change
    change_column :runs, :raw, :text
  end
end
