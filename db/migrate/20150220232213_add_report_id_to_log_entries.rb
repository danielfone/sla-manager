class AddReportIdToLogEntries < ActiveRecord::Migration
  def change
    add_column :log_entries, :report_id, :integer
    add_index :log_entries, :report_id
  end
end
