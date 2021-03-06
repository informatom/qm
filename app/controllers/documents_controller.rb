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

  def download
    extension = @document.attachment.file.extension.downcase
    mimetype = MIME::Types.type_for(@document.attachment.file.filename)
    send_file @document.attachment.path, :type => mimetype, :disposition => 'attachment'
  end

  def index
    @documents = Document.where(company_id: current_company.id)
  end
end