module Admin
  class ReportsController < AdminController

    def new
      @report = Report.new do |r|
        r.repository = repository
        r.report_date = (Date.today - 1.month).end_of_month
        r.log_entries = repository.log_entries.unpublished
      end
    end

  private

    def repository
      @repository ||= Repository.find params[:repository_id] if params[:repository_id]
    end

  end
end
