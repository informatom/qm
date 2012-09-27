class RolesInCompanyController < ApplicationController
  def index
    @role_in_companies = RoleInCompany.all
  end

  def show
    @role_in_company = RoleInCompany.find(params[:id])
  end

  def new
    @role_in_company = RoleInCompany.new
  end

  def edit
    @role_in_company = RoleInCompany.find(params[:id])
  end

  def create
    @role_in_company = RoleInCompany.new(params[:role_in_company])

    if @role_in_company.save
      redirect_to @role_in_company, notice: 'Role in company was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @role_in_company = RoleInCompany.find(params[:id])

    if @role_in_company.update_attributes(params[:role_in_company])
      redirect_to @role_in_company, notice: 'Role in company was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    begin
      @role_in_company = RoleInCompany.find(params[:id])
      @role_in_company.destroy
      flash[:success] = "role_in_company successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @role_in_company.errors.add(:base, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to roles_in_company_url
    end
  end
end
