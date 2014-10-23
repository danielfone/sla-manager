module Admin
  class LogEntriesController < AdminController

    def index
      @entries = LogEntry.unpublished
    end

    def new
      @entry = LogEntry.new
    end

    def create
      @entry = LogEntry.create params[:log_entry]
      respond_with @entry
    end

  end
end
