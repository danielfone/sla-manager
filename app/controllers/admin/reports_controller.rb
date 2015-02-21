module Admin
  class ReportsController < AdminController

    def index
      @reports = Report.all.includes(:repository, :client).order('report_date DESC')
    end

    def new
      @report = Report.new do |r|
        r.repository = repository
        r.report_date = params[:date] || default_date
        r.report_date = r.report_date.end_of_month
      end
      add_entries
    end

    def edit
      @report = Report.find_by_token(params[:id])
      @new_entry = LogEntry.new do |e|
        e.repository = @report.repository
        e.completed_at = @report.report_date
        e.report_id = @report.id
      end
    end

    def create
      @report = Report.new params[:report]
      add_entries
      @report.save
      respond_with @report
    end

  private

    def repository
      @repository ||= Repository.find params[:repository_id] if params[:repository_id]
    end

    def default_date
      Date.today - 1.month
    end

    def default_log_entries
      @report.repository.log_entries.unpublished.order(:completed_at)
    end

    def add_entries
      @report.log_entries = default_log_entries.where('completed_at <= ?', @report.report_date)
    end

  end
end
