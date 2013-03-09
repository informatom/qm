class InstructionDocumentAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @instruction_document_assignment.save
      redirect_to @instruction_document_assignment, notice: t('notice.instruction_document_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @instruction_document_assignment.update_attributes(params[:instruction_document_assignment])
      redirect_to @instruction_document_assignment, notice: t('notice.instruction_document_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @instruction_document_assignment.destroy
    redirect_to instruction_document_assignments_url
  end
end