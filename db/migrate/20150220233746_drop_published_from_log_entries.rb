class DropPublishedFromLogEntries < ActiveRecord::Migration
  def change
    remove_column :log_entries, :published, :boolean, default: false, null: false
  end
end
