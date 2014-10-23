module Admin
  class LogEntriesController < AdminController

    def index
      @entries = LogEntry.unpublished
    end

    def new
      @entry = LogEntry.new
    end

    def edit
      @entry = LogEntry.find params[:id]
    end

    def create
      @entry = LogEntry.create params[:log_entry]
      respond_with [:admin, @entry], location: admin_log_entries_path
    end

    def update
      @entry = LogEntry.find params[:id]
      @entry.update_attributes params[:log_entry]
      respond_with [:admin, @entry], location: admin_log_entries_path
    end

  end
end
