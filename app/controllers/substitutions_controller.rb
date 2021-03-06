class SubstitutionsController < ApplicationController
  load_and_authorize_resource :substitution

  def create
    if @substitution.save
      redirect_to @substitution, notice: t('notice.substitution.created')
    else
      render action: "new"
    end
  end

  def update
    if @substitution.update_attributes(params[:substitution])
      redirect_to @substitution, notice: t('notice.substitution.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @substitution.destroy

    redirect_to substitutions_url
  end
end
