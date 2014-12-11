module Admin
  class RepositoriesController < AdminController

    def index
      @repositories = Repository.all
    end

  end
end
