class BusinessProcessDepartmentAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @business_process_department_assignment.save
      redirect_to @business_process_department_assignment, notice: t('notice.business_process_department_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @business_process_department_assignment.update_attributes(params[:business_process_department_assignment])
      redirect_to @business_process_department_assignment, notice: t('notice.business_process_department_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @business_process_department_assignment.destroy
    redirect_to business_process_department_assignments_url
  end
end
