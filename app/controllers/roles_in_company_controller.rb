class RolesInCompanyController < ApplicationController
  load_and_authorize_resource

  def create
    if @role_in_company.save
      redirect_to @role_in_company, notice: t('notice.role_in_company.created')
    else
      render action: "new"
    end
  end

  def update
    if @role_in_company.update_attributes(params[:role_in_company])
      redirect_to @role_in_company, notice: t('notice.role_in_company.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @role_in_company.destroy
      flash[:success] = t('notice.role_in_company.destroyed')
    rescue ActiveRecord::DeleteRestrictionError => e
      @role_in_company.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to roles_in_company_url
    end
  end

  def index
    @roles_in_company = RoleInCompany.where(company_id: current_company.id)
  end
end