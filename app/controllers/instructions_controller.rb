class InstructionsController < ApplicationController
  load_and_authorize_resource

  def create
    @instruction.created_by = current_user.id
    @instruction.updated_by = current_user.id
    if @instruction.save
      redirect_to @instruction, notice: 'Instruction was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @instruction.updated_by = current_user.id
    if @instruction.update_attributes(params[:instruction])
      redirect_to @instruction, notice: 'Instruction was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @instruction.destroy

    redirect_to instructions_url
  end
end
