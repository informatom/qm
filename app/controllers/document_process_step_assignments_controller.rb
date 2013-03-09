class DocumentProcessStepAssignmentsController < ApplicationController
    load_and_authorize_resource

  def create
    if @document_process_step_assignment.save
      redirect_to @document_process_step_assignment, notice: t('notice.document_process_step_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @document_process_step_assignment.update_attributes(params[:document_process_step_assignment])
      redirect_to @document_process_step_assignment, notice: t('notice.document_process_step_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @document_process_step_assignment.destroy
    redirect_to document_process_step_assignments_url
  end
end