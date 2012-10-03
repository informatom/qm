class BusinessProcessNoteAssignmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @business_process_note_assignment.save
      redirect_to @business_process_note_assignment, notice: 'Business process note assignment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @business_process_note_assignment.update_attributes(params[:business_process_note_assignment])
      redirect_to @business_process_note_assignment, notice: 'Business process note assignment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @business_process_note_assignment.destroy
    redirect_to business_process_note_assignments_url
  end
end
