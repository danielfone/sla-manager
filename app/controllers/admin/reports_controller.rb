module Admin
  class ReportsController < AdminController

    def new
      @report = Report.new do |r|
        r.repository = repository
        r.report_date = params[:date] || default_date
        r.report_date = r.report_date.end_of_month
        r.log_entries = default_log_entries.where('completed_at <= ?', r.report_date)
      end
    end

  private

    def repository
      @repository ||= Repository.find params[:repository_id] if params[:repository_id]
    end

    def default_date
      Date.today - 1.month
    end

    def default_log_entries
      repository.log_entries.unpublished.order(:completed_at)
    end

  end
end
