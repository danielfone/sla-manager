class AdminController < ApplicationController
  include BasicAuth

  respond_to :html

private

  def admin?
    true
  end

end
