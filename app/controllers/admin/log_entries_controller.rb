module Admin
  class LogEntriesController < AdminController

    def index
      @entries = LogEntry.unpublished
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
        admin_log_entries_path
      end
    end

  end
end
