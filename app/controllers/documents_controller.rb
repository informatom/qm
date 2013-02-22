class DocumentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @document.save
      redirect_to @document, notice: t('notice.document.created')
    else
      render action: "new"
    end
  end

  def update
    if @document.update_attributes(params[:document])
      redirect_to @document, notice: t('notice.document.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end
end
