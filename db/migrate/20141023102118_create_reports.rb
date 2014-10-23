class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :client, index: true
      t.string :token

      t.timestamps
    end
  end
end
