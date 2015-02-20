class AddRepositoryIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :repository_id, :integer
    add_index :reports, :repository_id
  end
end
