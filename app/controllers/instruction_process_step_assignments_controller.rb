class InstructionProcessStepAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @instruction_process_step_assignment.save
      redirect_to @instruction_process_step_assignment, notice: t('notice.instruction_process_step_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @instruction_process_step_assignment.update_attributes(params[:instruction_process_step_assignment])
      redirect_to @instruction_process_step_assignment, notice: t('notice.instruction_process_step_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @instruction_process_step_assignment.destroy
    redirect_to instruction_process_step_assignments_url
  end
end