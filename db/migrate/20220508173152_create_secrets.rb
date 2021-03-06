# frozen_string_literal: true

class CreateSecrets < ActiveRecord::Migration[7.0]
  def change
    create_table :secrets do |t|
      t.string :name
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
