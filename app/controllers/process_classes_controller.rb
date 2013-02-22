class ProcessClassesController < ApplicationController
  load_and_authorize_resource

  def create
    if @process_class.save
      redirect_to @process_class, notice: t('notice.process_class.created')
    else
      render action: "new"
    end
  end

  def update
    if @process_class.update_attributes(params[:process_class])
      redirect_to @process_class, notice: t('notice.process_class.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @process_class.destroy

    redirect_to process_classes_url
  end
end
