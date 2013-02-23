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
    begin
      @document.destroy
      flash[:success] = t('notice.document.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @document.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to documents_url
    end
  end
end
