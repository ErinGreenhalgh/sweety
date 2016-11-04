class Reports::ReadingsController < ApplicationController
  def new
    @dates_with_readings = Reading.available_dates
    @months_with_readings = Reading.available_months
  end

  def results
    @report_type = params[:report_type]
    @date = params[:date]
    if @report_type == ["daily"]
      @data = Reading.report_for_day(@date)
    end
    if @report_type == ["month-to-date"]
      @data = Reading.report_for_month_to_date(@date)
    end
    if @report_type == ["monthly"]
      @data = Reading.report_for_month(@date)
    end
  end

end
