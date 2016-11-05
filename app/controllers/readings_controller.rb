class ReadingsController < ApplicationController
  def new
    @reading = Reading.new
  end

  def create
    @reading = Reading.new(glucose_level: params[:reading][:glucose_level])
    if @reading.save
      flash[:success] = "Reading of #{@reading.glucose_level} mg/dl successfully submitted"
    else
      flash[:danger] = @reading.errors.full_messages.join(", and ")
    end
    redirect_to root_path
  end
end
