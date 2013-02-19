class ProcessStepsController < ApplicationController
  load_and_authorize_resource

  def create
      @process_step.created_by = current_user.id
      @process_step.updated_by = current_user.id            
      if @process_step.save
        redirect_to @process_step, notice: 'Process step was successfully created.'
      else
        render action: "new"
      end
  end

  def update
    @process_step.updated_by = current_user.id
    if @process_step.update_attributes(params[:process_step])
      redirect_to @process_step, notice: 'Process step was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy    
    @process_step.destroy

    redirect_to process_steps_url    
  end
end
