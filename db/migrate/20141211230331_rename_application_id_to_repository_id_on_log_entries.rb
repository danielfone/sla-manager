class RenameApplicationIdToRepositoryIdOnLogEntries < ActiveRecord::Migration
  def change
    rename_column :log_entries, :application_id, :repository_id
  end
end
