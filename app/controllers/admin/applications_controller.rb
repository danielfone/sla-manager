module Admin
  class ApplicationsController < AdminController

    def index
      @apps = Application.all
    end

  end
end
