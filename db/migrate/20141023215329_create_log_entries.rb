class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.datetime :completed_at
      t.references :application, index: true
      t.string :entry_type
      t.text :data
      t.boolean :published, default: false, null: false

      t.timestamps
    end

    add_index :log_entries, :entry_type
    add_index :log_entries, :published
  end
end