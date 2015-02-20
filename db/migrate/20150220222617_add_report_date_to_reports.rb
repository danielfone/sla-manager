class AddReportDateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :report_date, :date
    add_index :reports, :report_date
  end
end
