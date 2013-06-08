class InstructionsController < ApplicationController
  load_and_authorize_resource

  def create
    @instruction.created_by = current_user.id
    @instruction.updated_by = current_user.id
    if @instruction.save
      redirect_to @instruction, notice: t('notice.instruction.created')
    else
      render action: "new"
    end
  end

  def update
    @instruction.updated_by = current_user.id
    if @instruction.update_attributes(params[:instruction])
      redirect_to @instruction, notice: t('notice.instruction.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @instruction.destroy
    redirect_to instructions_url
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render( :pdf => "show.pdf.rb", :page_size  => 'A4')
      end
    end
  end

  def index
    @instructions = Instruction.where(company_id: current_company.id)
  end
end
