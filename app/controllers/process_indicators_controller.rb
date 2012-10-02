class ProcessIndicatorsController < ApplicationController
  load_and_authorize_resource

  def create
    if @process_indicator.save
      redirect_to @process_indicator, notice: 'Process indicator was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @process_indicator.update_attributes(params[:process_indicator])
      redirect_to @process_indicator, notice: 'Process indicator was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @process_indicator.destroy
    redirect_to process_indicators_url
  end
end
