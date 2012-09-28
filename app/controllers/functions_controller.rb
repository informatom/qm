class FunctionsController < ApplicationController
  load_and_authorize_resource

  def create
    if @function.save
      redirect_to @function, notice: t('activerecord.models.function.created')
    else
      render action: "new"
    end
  end

  def update
    if @function.update_attributes(params[:function])
      redirect_to @function, notice: t('activerecord.models.function.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @function.destroy
      flash[:success] = "function successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @function.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to functions_url
    end
  end
end
