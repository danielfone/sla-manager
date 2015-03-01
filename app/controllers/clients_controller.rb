class ClientsController < ApplicationController

  def show
    client = Client.find_by_token! params[:id]
    report = client.reports.order('report_date').last or
      raise ActiveRecord::RecordNotFound
    redirect_to report
  end

end
