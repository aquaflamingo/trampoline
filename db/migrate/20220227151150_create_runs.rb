class CreateRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :runs do |t|
      t.references :job, null: false, foreign_key: true
      t.json :raw
      t.text :resolved_text

      t.timestamps
    end
  end
end
