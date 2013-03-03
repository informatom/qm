class NoteProcessStepAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @note_process_step_assignment.save
      redirect_to @note_process_step_assignment, notice: t('notice.note_process_step_assignment.created')
    else
      render action: "new"
    end
  end

  def update
    if @note_process_step_assignment.update_attributes(params[:note_process_step_assignment])
      redirect_to @note_process_step_assignment, notice: t('notice.note_process_step_assignment.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @note_process_step_assignment.destroy
    redirect_to note_process_step_assignments_url
  end
end
