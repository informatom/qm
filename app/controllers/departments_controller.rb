class DepartmentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @department.save
      redirect_to @department, notice: t('notice.department.created')
    else
      render action: "new"
    end
  end

  def update
    if @department.update_attributes(params[:department])
      redirect_to @department, notice: t('notice.department.updated')
    else
      ender action: "edit"
    end
  end

  def destroy
    begin
      @department.destroy
      flash[:success] = "department successfully destroyed."
    rescue ActiveRecord::DeleteRestrictionError => e
      @department.errors.add(:base, e)
      flash[:error] = t('exception.' + "#{e}")
    ensure
      redirect_to departments_url
    end
  end

  def index
    @departments = Department.where(company_id: current_company.id)
  end
end
