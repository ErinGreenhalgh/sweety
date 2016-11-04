class Reports::ReadingsController < ApplicationController
  def new
    @dates_with_readings = Reading.pluck("DATE(created_at)").uniq
  end

  def results
    @report_type = params[:report_type]
    @date = params[:date]
    @data = Reading.report_for_day(@date)
  end

end
