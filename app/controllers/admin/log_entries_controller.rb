module Admin
  class LogEntriesController < AdminController

    helper_method :repository

    def index
      @entry_groups = scope.unpublished.order('completed_at DESC').group_by {|e| e.completed_at.strftime "%a, %e %b"}
    end

    def new
      @entry = LogEntry.new
      @entry.repository = repository if repository
    end

    def edit
      @entry = LogEntry.find params[:id]
    end

    def duplicate
      @entry = LogEntry.find(params[:log_entry_id]).dup
      @entry.repository = nil
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

    def repository
      @repository ||= Repository.find params[:repository_id] if params[:repository_id]
    end

    def redirect_path
      if params[:add]
        new_admin_repository_log_entry_path @entry.repository
      else
        admin_repository_log_entries_path @entry.repository
      end
    end

    def scope
      repository ? repository.log_entries : LogEntry
    end

  end
end
