module Admin
  class LogEntriesController < AdminController

    def index
      @entries = LogEntry.unpublished
    end

  end
end
