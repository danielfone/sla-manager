class AddLastUpdatedAtToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :last_entry_at, :datetime
  end
end
