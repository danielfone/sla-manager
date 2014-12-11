class RenameApplicationsToRepositories < ActiveRecord::Migration
  def change
    rename_table :applications, :repositories
  end
end
