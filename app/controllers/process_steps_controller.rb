class ProcessStepsController < ApplicationController
  load_and_authorize_resource

  def create
      @process_step.created_by = current_user.id
      @process_step.updated_by = current_user.id            
      if @process_step.save
        redirect_to @process_step, notice: t('notice.process_step.created')
      else
        render action: "new"
      end
  end

  def update
    @process_step.updated_by = current_user.id
    if @process_step.update_attributes(params[:process_step])
      redirect_to @process_step, notice: t('notice.process_step.updated')
    else
      render action: "edit"
    end
  end

  def destroy    
    begin
      @process_step.destroy
      flash[:success] = t('notice.process_step.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @process_step.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to process_steps_url
    end 
  end
end
