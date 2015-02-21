class ApplicationController < ActionController::Base

  helper_method :admin?

private

  def admin?
    false
  end

end
