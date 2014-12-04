module Admin
  class LogEntriesController < AdminController

    helper_method :application

    def index
      @entry_groups = scope.unpublished.order('completed_at DESC').group_by {|e| e.completed_at.strftime "%a, %e %b"}
    end

    def new
      @entry = LogEntry.new
      @entry.application = application if application
    end

    def edit
      @entry = LogEntry.find params[:id]
    end

    def duplicate
      @entry = LogEntry.find(params[:log_entry_id]).dup
      @entry.application = nil
      render 'new'
    end

    def create
      @entry = LogEntry.create params[:log_entry]
      respond_with @entry, location: redirect_path
    end

    def update
      @entry = LogEntry.find params[:id]
      @entry.update_attributes params[:log_entry]
      respond_with @entry, location: redirect_path
    end

  private

    def application
      @application ||= Application.find params[:application_id] if params[:application_id]
    end

    def redirect_path
      if params[:add]
        new_admin_application_log_entry_path @entry.application
      else
        admin_application_log_entries_path @entry.application
      end
    end

    def scope
      application ? application.log_entries : LogEntry
    end

  end
end
