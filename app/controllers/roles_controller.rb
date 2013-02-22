class RolesController < ApplicationController
  load_and_authorize_resource

  def create
    if @role.save
      redirect_to @role, notice: t('notice.role.created')
    else
      render action: "new"
    end
  end

  def update
    if @role.update_attributes(params[:role])
      redirect_to @role, notice: t('notice.role.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @role.destroy
      flash[:success] = t('notice.role.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @role.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to roles_url
    end
  end
end
