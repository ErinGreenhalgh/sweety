class Reports::ReadingsController < ApplicationController
  def new
    @dates_with_readings = Reading.available_dates
    @months_with_readings = Reading.available_months
  end

  def results
    @report_type = params[:report_type]
    @date = params[:date]
    @month = params[:month]
    if @report_type == ["daily"]
      @data = Reading.report_for_day(@date)
    elsif @report_type == ["month-to-date"]
      @data = Reading.report_for_month_to_date(@date)
    elsif @report_type == ["monthly"]
      @data = Reading.report_for_month(@month)
    end
  end
end
