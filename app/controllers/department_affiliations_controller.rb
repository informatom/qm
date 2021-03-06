class DepartmentAffiliationsController < ApplicationController
  load_and_authorize_resource

  def create
    if @department_affiliation.save
      redirect_to @department_affiliation, notice: t('notice.department_affiliation.created')
    else
      render action: "new"
    end
  end

  def update
    if @department_affiliation.update_attributes(params[:department_affiliation])
      redirect_to @department_affiliation, notice: t('notice.department_affiliation.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @department_affiliation.destroy

    redirect_to department_affiliations_url
  end
end
