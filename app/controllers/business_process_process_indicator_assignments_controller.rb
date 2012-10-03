class BusinessProcessProcessIndicatorAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @business_process_process_indicator_assignment.save
      redirect_to @business_process_process_indicator_assignment, notice: 'Business process process indicator assignment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @business_process_process_indicator_assignment.update_attributes(params[:business_process_process_indicator_assignment])
      redirect_to @business_process_process_indicator_assignment, notice: 'Business process process indicator assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @business_process_process_indicator_assignment.destroy
    redirect_to business_process_process_indicator_assignments_url
  end
end
